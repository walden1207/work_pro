#!/usr/bin/python
# coding:utf-8
import collections
import json
import os
import shutil
from django.views.decorators.http import require_POST
from xml.etree import ElementTree as ET
import time
import asyncio

from DAC.settings import BASE_DIR
from apps.Public.common import rwini, make_targz_one_by_one, publish_mqtt, rwSqlliteDB, redis_resolve, getHash
from apps.Tm.MatterAnalysis.models import ProtocolDNC, ProtocolPLC, DeviceModal
from apps.Public import restful
from apps.Public import config
from apps.Tm.GateAccess.models import GateInfoModel
from datetime import datetime
from apps.Tm.GateManage.ProtocolConfig import protocol_config, configmap
from apps.Tm.MatterAnalysis.config import protocol_plc_list
from apps.Tm.MatterAnalysis.config import instruct_field_list_for_deviceIP, instruct_field_list_for_deviceID, \
    parse_field_list
from apps.User.models import UserModel

# 设置模板路径
template_path = os.path.join(BASE_DIR, "apps", "Tm", "GateManage", "DownTemp")
# 设置临时文件路径
tempfiles = os.path.join(BASE_DIR, "media", "tempfiles")


@require_POST
def dispatch(request):
    """
    网关下发
    :return:
    """
    gateMacs = eval(request.POST["gateMac"])
    try:
        for gateMac in gateMacs:
            # 加入公司ID
            gateinfo = GateInfoModel.objects.filter(gateMac=gateMac)[0]
            compID = gateinfo.compID
            gateType = gateinfo.gateType
            # 新建配置文件路径
            gateMacFile = gateMac.replace(":", "-")
            if not os.path.exists(os.path.join(tempfiles, gateMacFile)):
                os.mkdir(os.path.join(tempfiles, gateMacFile))
            # DNC配置采集项下发，DNC配置采集项涉及到改变网关配置，分成配置文件config.ini和采集项文件ManuData.xml，打包成rar包下发
            if gateType == "GW_DNC":
                infos = ProtocolDNC.objects.filter(gateMac=gateMac, operationFlag=9, upload=9)
                # 获取网关下的协议类型列表
                prolist = list(set(info.deviceType.TypeList for info in infos))
                if prolist:
                    # 拷贝模板文件到tempfiles
                    temp_ini = (os.path.join(tempfiles, gateMacFile, "Config.ini"))
                    if os.path.exists(temp_ini):
                        os.remove(temp_ini)
                    shutil.copyfile(os.path.join(template_path, "Config.ini"), temp_ini)

                    # 修改MQTT协议参数
                    INI = rwini(temp_ini)
                    INI.mod_opt("MQTT", "MqttServerIp", config.EMQ_IP)
                    INI.mod_opt("MQTT", "MqttServerPort", str(config.EMQ_PORT))
                    INI.mod_opt("MQTT", "MqttUser", config.EMQ_USERNAME)
                    INI.mod_opt("MQTT", "MqttPassword", config.EMQ_PASSWORD)
                    INI.mod_opt("FACTORY", "factoryID", str(compID).zfill(4))

                    temp_xml = (os.path.join(tempfiles, gateMacFile, "ManuData.xml"))

                    # 根据协议获取采集项信息
                    xml_data = set_config(prolist, infos, temp_ini, temp_xml)
                    # 编写下发的xml
                    new_temp_xml(temp_xml, xml_data)

                    # 将配置文件打包成rar文件
                    unpack(tempfiles, gateMacFile, ['.ini', '.xml'])

                    # 发送消息到mqtt
                    dnc_param = {
                        "url": request._current_scheme_host + "/media/tempfiles/{0}{1}".format(filename, ".rar"),
                        "time": datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3],
                    }
                    send_mqtt(compID,gateMac,"ConfigRar",dnc_param)

            # PLC配置采集项下发，PLC是将采集项分成指令文件instruct.db和解析文件parse.db，打包成tar包下发
            else:
                infos = ProtocolPLC.objects.filter(gateMac=gateMac, operationFlag=9)
                prolist = list(set(info.deviceType for info in infos))
                if prolist:
                    # 指令文件
                    instruct_db = (os.path.join(tempfiles, gateMacFile, "instruct.db"))
                    # 解析文件
                    parse_db = (os.path.join(tempfiles, gateMacFile, "parse.db"))
                    # 指令文件和解析文件如果存在，先删除，确保没有脏数据
                    if os.path.exists(instruct_db):
                        os.remove(instruct_db)
                    if os.path.exists(parse_db):
                        os.remove(parse_db)
                    DB_INSTRUCT = rwSqlliteDB(instruct_db)
                    DB_PARSE = rwSqlliteDB(parse_db)
                    # 创建db文件，并且新建协议表结构
                    save_db_file(gateMac, prolist, DB_INSTRUCT, DB_PARSE)

                    # 生成md5文件
                    instruct_md5 = getHash(instruct_db)
                    parse_md5 = getHash(parse_db)
                    md5_file = (os.path.join(tempfiles, gateMacFile, "md5"))
                    if os.path.exists(md5_file):
                        os.remove(md5_file)
                    with open(md5_file, 'w') as f:
                        f.write(instruct_md5 + "  instruct.db\n" + parse_md5 + "  parse.db")

                    # 将配置文件打包成rar文件
                    unpack(tempfiles, gateMacFile, ['.db', ''], suffix=".tar")

                    # 发送消息到mqtt
                    plc_param = {
                        "url": request._current_scheme_host + "/media/tempfiles/{0}{1}".format(filename, ".tar"),
                        "time": datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3],
                        "version": "",
                    }
                    send_mqtt(compID, gateMac, "Scripts", plc_param)

        result = restful.ok()
    except Exception as e:
        result = restful.method_error(message="下发失败")
    return result


def set_xml(data, order):
    """
    配置xml文件
    :return:
    """
    # 配置downTemp.xml
    key = ""
    count = 1
    for j in data:
        tt = """<_{0} Title="{1}" Description="{2}" nodeClass="{3}" configValue="{4}" />""".format(count,
                                                                                                   j.Description,
                                                                                                   j.operationValue,
                                                                                                   j.type,
                                                                                                   j.configValue if j.configValue else "")
        key += tt
        count += 1
        result = """ <MACHINE-{0}>
                  {1}
                  </MACHINE-{0}>""".format(order, key)

    return result


def set_ini(TT, proName, temp_ini, order, data):
    """
    配置ini文件
    :param TT: ini解析地址
    :param proName: 协议名称
    :param temp_ini:
    :param order:
    :param data:
    :return:
    """
    # 判断该协议是否已对应设备
    point = TT.appoint_sections_key("FACTORY", proName.lower())
    # 已对应设备，则追加
    if point:
        TT.mod_opt("FACTORY", proName.lower(), point + "," + str(order))
    else:
        TT.mod_opt("FACTORY", proName.lower(), str(order))
    # 查询端口号
    port = DeviceModal.objects.filter(machCode=data[0].machCode)[0].serialPort
    # 已有MACHINE-1
    if order == 1:
        for i in protocol_config[proName]:
            if i == "machineip":
                TT.mod_opt("MACHINE-{}".format(order), i, str(data[0].deviceIP))
            elif i == "machinePlcPort":
                if port and len(port.split("-")) == 2:
                    TT.mod_opt("MACHINE-{}".format(order), i,
                               port.split("-")[1] if port.split("-")[1] else configmap[i])
            elif i == "machineport":
                if port:
                    TT.mod_opt("MACHINE-{}".format(order), i,
                               port.split("-")[0] if port.split("-")[0] else configmap[i])
            else:
                TT.mod_opt("MACHINE-{}".format(order), i, configmap[i])
    # 新加设备需添加节点
    else:
        TT.add_section("MACHINE-{}".format(order))
        for i in protocol_config[proName]:
            # 根据协议类型添加相应子节点
            if i == "machineip":
                TT.add_section_key_value("MACHINE-{}".format(order), i, str(data[0].deviceIP))
            elif i == "machinePlcPort":
                if port and len(port.split("-")) == 2:
                    TT.add_section_key_value("MACHINE-{}".format(order), i,
                                             port.split("-")[1] if port.split("-")[1] else configmap[i])
            elif i == "machineport":
                if port:
                    TT.add_section_key_value("MACHINE-{}".format(order), i,
                                             port.split("-")[0] if port.split("-")[0] else configmap[i])
            else:
                TT.add_section_key_value("MACHINE-{}".format(order), i, configmap[i])


def prettyXml(elem, level=0):
    """美化写入xml文件的内容"""
    i = "\n" + level * "  "
    if len(elem):
        # 逐层添加空格
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for elem in elem:
            prettyXml(elem, level + 1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i


def new_temp_xml(temp_xml, xml_data):
    """
    编写下发的临时xml
    :param temp_xml: xml路径
    :param xml_data: 写入xml的数据
    :return:
    """
    basic_xml = """<?xml version="1.0" encoding="utf-8"?>
              <ManuData>
            {}
              </ManuData>""".format(xml_data)
    with open(temp_xml, "w", encoding='utf-8') as fp:
        fp.write(basic_xml)
    # 美化xml
    tree = ET.parse(temp_xml)
    root = tree.getroot()
    prettyXml(root, 0)
    tree.write(temp_xml, 'UTF-8')
    # 加title
    title = """<?xml version="1.0" encoding="utf-8"?>\n"""
    with open(temp_xml, 'r+', encoding="utf-8") as f:
        content = f.read()
        f.seek(0, 0)
        f.write(title + content)


def unpack(filepath, filename, filelist, suffix=".rar"):
    """
    将指定路径下的指定文件打包成相应后缀结尾的文件
    :param filepath: 文件路径
    :param filename: 文件名（目录）
    :param filelist: 目录下需打包的文件list
    :param suffix: 文件后缀
    :return:
    """
    newfile = os.path.join(filepath, "{0}{1}".format(filename, suffix))
    # 先查看文件是否存在
    if os.path.exists(newfile):
        os.remove(newfile)
    # 将配置文件打包
    tarfile = os.path.join(filepath, "{}.tar".format(filename))
    make_targz_one_by_one(tarfile, os.path.join(filepath, filename), filelist)

    if suffix == ".rar":
        # tar更名为rar文件
        os.rename(tarfile, newfile)
    if os.path.exists(newfile):
        return True
    else:
        return False


def set_config(prolist, infos, temp_ini, temp_xml):
    """
    根据协议配置采集项信息
    :param prolist:
    :param infos:
    :param temp_ini:
    :param temp_xml:
    :return:
    """
    order = 1
    xml_data = ""
    # 解析ini文件
    TT = rwini(temp_ini)
    for pro in prolist:
        # 同种协议的采集项数据
        pro_data = list(filter(lambda x: x.deviceType.TypeList == pro, infos))
        #  同种协议下的不同物影子
        machCode_list = [j for j in set(i.machCode for i in pro_data)]
        for machCode in machCode_list:
            data = list(filter(lambda x: x.machCode == machCode, pro_data))

            proName = pro.split("_")[0]
            # 配置Config.ini文件
            set_ini(TT, proName, temp_ini, order, data)

            # 配置downTemp.xml
            if os.path.exists(temp_xml):
                os.remove(temp_xml)
            xml_data += set_xml(data, order)
            order += 1
    # 修改设备总数
    TT.mod_opt("FACTORY", "machineCnt", str(order - 1))
    return xml_data


def save_db_file(gateMac, prolist, DB_INSTRUCT, DB_PARSE):
    """
    创建db文件，并且新建协议表结构
    :return:
    """
    # 遍历所有协议
    for protocol in prolist:
        params = ProtocolPLC.objects.filter(gateMac=gateMac, deviceType=protocol)
        if protocol in protocol_plc_list:
            # 在instruct.db中创建表
            DB_INSTRUCT.create_table(protocol, instruct_field_list_for_deviceIP)
            # 将该协议下的所有采集项数据存储到列表instruct_field_values_list中
            instruct_field_values_list = [[param.deviceType, param.deviceIP, param.functionCode, param.startAddress,
                                           param.len, param.operationFlag, param.delayMs, param.updateTime, param.des]
                                          for param in params]
        else:
            # 在parse.db中创建表
            DB_INSTRUCT.create_table(protocol, instruct_field_list_for_deviceID)
            # 将该协议下的所有采集项数据存储到列表instruct_field_values_list中
            instruct_field_values_list = [
                [param.deviceType, param.serialNum, param.deviceID, param.functionCode, param.startAddress,
                 param.operationFlag, param.delayMs, param.updateTime, param.des] for param in params]
        DB_PARSE.create_table(protocol, parse_field_list)
        # 将该协议下的所有采集项数据存储到列表parse_field_values_list中
        parse_field_values_list = [[param.deviceType, param.serialNum, param.deviceIP, param.deviceID,
                                    param.startAddress, param.functionCode, param.dataType, param.name, param.Multiple,
                                    param.offset, param.maxValue, param.minValue, param.operationFlag,
                                    param.updateTime, param.des] for param in params]
        # 根据协议查询出这个网关下的所有采集项，写进指令文件和解析文件中
        DB_INSTRUCT.insert_table(protocol, instruct_field_values_list)
        DB_PARSE.insert_table(protocol, parse_field_values_list)


async def verify_ack(topic, timeout):
    """
    验证网关返回的Ack
    topic:正常的topic是0010/0C:9D:92:5D:BD:FF/Send/RebootAck
          存在redis数据库的key为0010/0C_9D_92_5D_BD_FF/Send/RebootAck
          即把:替换成_的形式
    timeout: 循环等待的时间
    :return: True or False
    """
    Flag = 0
    i = 0
    while i < timeout:
        time.sleep(1)
        redis = redis_resolve()
        value = redis.get_redis(topic)
        if value and value == 1:
            return True
        i += 1
    return Flag


@require_POST
def update_gateway_info(request):
    """
    保存网关信息
    :param request:
    :return:
    """
    gateMac = request.POST["gateMac"]
    params = {
        "gateName": request.POST["gateName"]
    }
    GateInfoModel.objects.filter(gateMac=gateMac).update(**params)
    return restful.ok()


@require_POST
def upgrade_gateway(request):
    """
    网关升级
    :param request:
    :return:
    """
    compID = request.POST["compID"]
    type = request.POST["type"]
    gateMac = eval(request.POST["gateMac"])
    # 记录正在升级的网关id
    idlist = [str(n) for n in eval(request.POST["idlist"])]
    gateMac_dict = dict(zip(idlist, gateMac))
    # 放置升级文件的路径
    upgrade_path = os.path.join(BASE_DIR, "media", "upgradefiles")
    # 请求中正在升级的网关id
    ing_upgrade = []
    for dir in os.listdir(upgrade_path):
        dir_list = [d for d in dir.split("-")]
        ing_upgrade.extend(list(filter(lambda m: m in dir_list, idlist)))
    for i in ing_upgrade:
        idlist.pop(idlist.index(i))
    # 待升级的网关
    to_upgrade = idlist
    msg1 = ""
    msg2 = ""
    if ing_upgrade:
        msg1 = "网关{}已在进行升级！请稍后操作！".format(",".join(ing_upgrade))
    if to_upgrade:
        msg2 = "网关{}开始进行升级！".format(",".join(to_upgrade))
        # 获取升级文件
        file = request.FILES.getlist("file", "")
        if file:
            filename = "-".join(to_upgrade)
            userpath = os.path.join(upgrade_path, filename)
            if not os.path.exists(userpath):
                # 创建升级的临时目录
                os.mkdir(userpath)
                # 将升级文件放置到指定路径
                path = os.path.join(userpath, file[0].name)
                with open(path, 'wb+') as upgrade:
                    for chunk in file[0].chunks():
                        upgrade.write(chunk)

                # 按网关升级
                for t in to_upgrade:
                    to_upgrade_param = {
                        "url": "{0}/media/upgradefiles/{1}/{2}".format(request._current_scheme_host, filename, file[0].name),
                        "time": datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3],
                        "md5code": getHash(path),
                    }
                    send_mqtt(compID, gateMac_dict[t],"Upgrade", to_upgrade_param)


                # 删除临时目录
                shutil.rmtree(userpath)
        else:
            return restful.method_error(message="未找到升级文件！")
    return restful.ok(msg1 + msg2)


def send_mqtt(compID, gateMac, type, values_dict):
    """
    发送消息到mqtt
    :param compID:
    :param gateMac:
    :param type:
    :param values_dict:
    :return:
    """
    # 定义两个有序的字典，网关解析的json包有顺序要求
    payload = collections.OrderedDict()
    payload_tmp = collections.OrderedDict()
    # 生成Payload
    payload["type"] = type
    # 生成Topic
    topic = "{0}/{1}/Set/{2}".format(str(compID).zfill(4), gateMac, payload["type"])
    # 解析Payload["values"]
    for k, v in values_dict.items():
        payload_tmp[k] = v
    payload["values"] = payload_tmp
    payload = json.dumps(payload)
    publish_mqtt(topic, payload)


@require_POST
def del_gateway(request):
    """
    删除网关
    :param request:
    :return:
    """
    return restful.ok()


@require_POST
def reboot_gateway(request):
    """
    网关重启
    :param request:
    :return:
    """
    return restful.ok()


@require_POST
def async_history(request):
    """
    同步历史数据
    :param request:
    :return:
    """
    return restful.ok()
