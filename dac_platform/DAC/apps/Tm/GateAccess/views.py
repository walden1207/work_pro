# encoding: utf-8
import json
from django.db.models import Q
import collections
from django.views.decorators.http import require_POST

from apps.Public.common import publish_mqtt
from apps.Tm.GateAccess.models import GateInfoModel
from apps.User.models import UserModel
from apps.Public import restful
from datetime import datetime


@require_POST
def gateinfo(request):
    """
    获取网关信息，展示在网关接入界面
    :param request:
    :return:
    """
    token = request.POST["token"]
    # 当前查看页
    page = int(request.POST["page"])
    # 每页显示的条数
    limit = int(request.POST["limit"])
    # 搜索关键字, ""表示查询所有
    searchKey = request.POST["searchKey"]
    # 升降序
    order = request.POST["order"]
    # 排序字段
    orderProp = request.POST["orderProp"]
    # 取每一页的第一行和最后一行数的下标
    start = (page - 1) * limit
    end = start + limit
    user = UserModel.objects.filter(token=token).all()
    if user:
        compID = user[0].compID
    else:
        compID = ""
    if compID:
        # 管理员
        if compID == -1:
            # 所有网关
            gateInfos = GateInfoModel.objects.filter()
        else:
            # 根据公司来查询
            compID = str(compID).zfill(4)
            # 该公司所有网关
            gateInfos = GateInfoModel.objects.filter(compID=compID)
        if not searchKey:
            gateInfo1 = gateInfos.filter()
        else:
            if searchKey in ["已启用", "未激活", "启用", "激活"]:
                if searchKey in ["已启用", "启用"]:
                    searchKey = 1
                else:
                    searchKey = 0
                gateInfo1 = gateInfos.filter(ifregister=searchKey)
            else:
                # id字段是对数据库中查询出来的主键ID进行的排序结果，故不支持ID搜索
                gateInfo1 = gateInfos.filter((Q(gateMac__icontains=searchKey) |
                                              Q(compID__icontains=searchKey) |
                                              Q(ServerIP__icontains=searchKey) |
                                              Q(gateType__icontains=searchKey) |
                                              Q(software_version__icontains=searchKey) |
                                              Q(lastBuildTime__startswith=searchKey)))
        # 前端展示的字段是status, 后端数据字段是ifregister, 当排序status字段时需要转换成ifregister
        if orderProp == "status":
            orderProp = "ifregister"
        if orderProp == "compName":
            orderProp = "compID"
        # 升降序排序
        if order == "ascending":
            gateInfo1 = gateInfo1.order_by(orderProp)
        else:
            gateInfo1 = gateInfo1.order_by("-" + orderProp)
        gateInfo2 = gateInfo1[start:end]
        gate_list = []
        for index, i in enumerate(gateInfo2):
            try:
                compName = UserModel.objects.filter(compID=int(i.compID))[0].compName
            except:
                compName = None
            data = {
                "id": i.id,
                "compID": i.compID,
                "compName": compName,
                "gateMac": i.gateMac,
                "ServerIP": i.ServerIP,
                "gateType": i.gateType,
                "software_version": i.software_version,
                "status": i.ifregister,
                "lastBuildTime": i.lastBuildTime.strftime("%Y-%m-%d %H:%M:%S"),
            }
            gate_list.append(data)
        # 总的网关数
        totalCount = len(gateInfo1)
        # 启用的网关数
        allowCount = len(gateInfo1.filter(ifregister=1))
        # 禁用的网关数
        forbidCount = len(gateInfo1.filter(ifregister=9))
        result = restful.ok(
            data={
                "items": gate_list,
                "totalCount": totalCount,
                "allowCount": allowCount,
                "forbidCount": forbidCount
            }
        )
    else:
        result = restful.params_error(message="token is worng!")
    return result


@require_POST
def enable_gate(request):
    """
    网关启用
    :param request:
    :return:
    """
    gateMac = []
    gateMacs = request.POST
    for key, value in gateMacs.items():
        gateMac.append(value)
    gateinfo = GateInfoModel.objects.filter(gateMac__in=gateMac).all()
    try:
        for i in gateMac:
            if GateInfoModel.objects.filter(gateMac=i, ifregister=1):
                continue
            compID = gateinfo.filter(gateMac=i)[0].compID
            topic = str(compID).zfill(4) + '/' + i + '/' + 'Set/LoginAck'
            # 定义payload为一个有序字典
            payload = collections.OrderedDict()
            # payload = {}
            payload["type"] = "LoginAck"
            payload["values"] = []
            # 定义payload_tmp为一个有序字典
            payload_tmp = collections.OrderedDict()
            payload_tmp["result"] = "1"
            payload_tmp["time"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            payload["values"].append(payload_tmp)
            payload = json.dumps(payload)
            # 发送publish消息
            publish_mqtt(topic=topic, payload=payload)
    except:
        pass
    # 更改网关状态字段ifregister=1
    gateinfo.update(ifregister=1)
    return restful.ok()


@require_POST
def disabled_gate(request):
    """
    网关禁用
    :param request:
    :return:
    """
    gateMac = []
    gateMacs = request.POST
    for key, value in gateMacs.items():
        gateMac.append(value)
    gateinfo = GateInfoModel.objects.filter(gateMac__in=gateMac).all()
    gateinfo.update(ifregister=9)
    return restful.ok()


@require_POST
def chage_gatename(request):
    """
    更改网关名称
    :param request:
    :return:
    """
    gateMac = request.POST["gateMac"]
    gateName = request.POST["gateName"]
    gateinfo = GateInfoModel.objects.filter(gateMac=gateMac).all()[0]
    gateinfo1 = GateInfoModel.objects.filter(gateName=gateName)
    if gateinfo1:
        result = restful.params_error(message="this gateName is exist!")
    else:
        gateinfo.gateName = gateName
        gateinfo.save()
        result = restful.ok()
    return result


def ifregister(event):
    """
    判断网关是否已经注册
    1、网关mac地址在数据库有记录，但是处于未激活状态，给网关回复的Ack为0
    2、网关mac地址在数据库有记录，处于已启用状态，给网关回复的Ack为1
    3、网关mac地址在数据库没有记录，给网关回复的Ack为0，并且在数据库中新增这条mac数据
    :param event:
    :return:
    """
    gateMac = event["text"]["topic"].split("/")[1]
    compID = event["text"]["topic"].split("/")[0]
    user = UserModel.objects.filter(compID=int(compID))
    # result == 2代表user表没有接入这个公司，即这个公司下面的网关均不接入
    if not user:
        result = 2
        return result
    gateinfo = GateInfoModel.objects.filter(gateMac=gateMac)
    if gateinfo:
        ifregister = gateinfo[0].ifregister
        if ifregister == 0:
            result = 0
        else:
            result = 1
    else:
        result = 0
    # 从消息体payload中获取信息，写入到数据库
    data = {}
    compID = event["text"]["topic"].split("/")[0]
    payload_value = event["text"]["payload"]["values"][0]
    # 将需要的字段放在列表中，循环遍历从payload_value获取，只适用于payload_value中的字段与数据库字段一致的情况下
    values = ["software_version", "config_version", "system_version", "instruct_version", "parse_version"]
    for i in values:
        if i in payload_value:
            data[i] = payload_value[i]
    # 判断字段是否在payload_value中，如果在则放进data中，最后写入数据库
    if "ip" in payload_value:
        data["ServerIP"] = payload_value["ip"].split(':')[-1]
    if "time" in payload_value:
        data["lastBuildTime"] = payload_value["time"]
    if "gw_type" in payload_value:
        data["gateType"] = payload_value["gw_type"]
    if "cpu_usage" in payload_value:
        data["cpuUsg"] = payload_value["cpu_usage"]
    if 'mem_usage' in payload_value:
        data['memUsg'] = payload_value['mem_usage'].split('%')[0]
    data["compID"] = compID
    data["gateMac"] = gateMac
    # 在gateinfo表中新增一条网关信息
    try:
        data["ifregister"] = 0
        data["status"] = None
        data["gatherTime"] = datetime.now()
        data["updateTime"] = datetime.now()
        data["createTime"] = datetime.now()
        GateInfoModel.objects.create(**data)
    except:
        del data["ifregister"]
        del data["status"]
        del data["gatherTime"]
        data["updateTime"] = datetime.now()
        gateinfo.update(**data)
    return result