# encoding: utf-8
import logging
from apps.Public import config
from channels.layers import get_channel_layer
import asyncio
import configparser
import os
import tarfile
import sqlite3
from redis import StrictRedis
from .config import REDIS_IP, REDIS_PORT
import hashlib


def logger():
    """
    日志打印
    用法：logger().debug(msg=message)
    message即错误信息
    """
    logger = logging.getLogger('apps.app')
    return logger


def sub_topic():
    """
    返回所有需要订阅的topic
    :param startID: 起始公司ID
    :param endID: 终止公司ID
    :param type: 订阅的topic范围
    :param qos: qos连接设置(0, 1, 2)
    :return:
    """
    topic = []
    for i in range(config.startID, config.endID + 1):
        for j in config.protocol_type:
            tuple1 = (str(i).zfill(4) + j, config.qos)
            topic.append(tuple1)
    return topic


channel_layer = get_channel_layer()


async def send_message(topic, payload):
    """
    发布mqtt消息到emq服务器
    :return:
    """
    await channel_layer.send("mqtt", {
        "type": "mqtt.pub",
        'text': {
            'topic': topic,
            'payload': payload,
            'qos': 0,
            'retain': False
        }
    })


def publish_mqtt(topic, payload):
    """
    通过协程的方式调用channel_layer来达到异步发送消息的目的
    :param topic:
    :param payload:
    :return:
    """
    asyncio.set_event_loop(asyncio.new_event_loop())
    loop = asyncio.get_event_loop()
    loop.run_until_complete(send_message(topic, payload))
    loop.close()


class MyConfigParser(configparser.ConfigParser):
    """
    重写configparser的optionxform方法,原来的optionxform方法会自动将options大写改为小写，现在的需求是不改变原文件的大小写
    """

    def __init__(self, defaults=None):
        configparser.ConfigParser.__init__(self, defaults=defaults)

    def optionxform(self, optionstr):
        return optionstr


class rwini(object):
    """
    解析.ini文件
    """

    def __init__(self, filename):
        self.filename = filename
        self.abspath = os.path.dirname(os.path.realpath(__file__))
        self.cfgpath = os.path.join(self.abspath, self.filename)

    def getFile(self):
        """
        读取 ini
        """
        item_list = []
        conf = MyConfigParser()
        conf.read(self.cfgpath, encoding='utf-8')
        sections = conf.sections()
        for section in sections:
            items = conf.items(section)
            item_list.append(items)
        return item_list

    def appoint_sections_key(self, sect, key):
        """
        读取指定节点下的指定key的值
        """
        i = 0
        conf = MyConfigParser()
        conf.read(self.cfgpath, encoding='utf-8')
        if sect in conf.sections():
            for keys in conf.items(sect):
                i += 1
                if key in keys[0]:
                    return conf.items(sect)[i - 1][-1]
        else:
            return "section is error"

    def remove_opt(self, sect, opt):
        """
        移除某一结点下的小节点
        """
        conf = MyConfigParser()
        conf.read(self.cfgpath, encoding='utf-8')
        if sect in conf.sections():
            for item in conf.items(sect):
                if opt in item:
                    conf.remove_option(sect, opt)

                    with open(self.cfgpath, 'w', encoding='utf-8') as fp:
                        conf.write(fp)
                else:
                    return 'error'
        else:
            return 'section is error'

    def add_section(self, sect):
        """
        增加节点
        """
        conf = MyConfigParser()
        conf.read(self.cfgpath, encoding='utf-8')
        if sect in conf.sections():
            return '{} already exists'.format(sect)
        else:
            conf.add_section(sect)
            with open(self.cfgpath, 'w', encoding='utf-8') as fp:
                conf.write(fp)

    def add_section_key_value(self, sect, key, value):
        """
        增加子节点
        """
        conf = MyConfigParser()
        conf.read(self.cfgpath, encoding='utf-8')
        if sect in conf.sections():
            conf.set(sect, key, value)
            with open(self.cfgpath, 'w', encoding='utf-8') as fp:
                conf.write(fp)
        else:
            return 'section is error'

    def mod_opt(self, sect, key, value):
        """
        修改小节点
        """
        self.add_section_key_value(sect, key, value)


def make_targz_one_by_one(output_filename, source_dir, fileType):
    """
    # 逐个添加文件打包，未打包空子目录。可过滤文件
    # 不保留原目录结构，tar只显示所有需要打包的文件
    # 如果只打包不压缩，将"w:gz"参数改为"w:"或"w"即可
    # 压缩文件的路径跟tarfile.add()中的路径完全一致，所以需要在add时需要转换到当前目录
    :param output_filename: 需要打包成的目标tar包名
    :param source_dir: 需要打包的目录
    :param fileType: 需要打包的文件类型，即后缀['.ini', '.txt', '', ...] ''代表该文件无后缀
    :return:
    """
    print("Start packing files")
    cur_path = os.getcwd()
    full_fname_out = os.path.join(cur_path, output_filename)
    full_path_in = os.path.join(cur_path, source_dir)
    os.chdir(full_path_in)
    tar = tarfile.open(full_fname_out, "w:")
    for root, dir, files in os.walk(full_path_in):
        for file in files:
            for i in fileType:
                if file.endswith(i):
                    fullpath = file
                    tar.add(fullpath, recursive=False)
    tar.close()
    print("File pack finished")


class rwSqlliteDB(object):
    """
    对.db文件的操作
    """
    def __init__(self, dbFile):
        self.dbFile = dbFile
        self.abspath = os.path.dirname(os.path.realpath(__file__))
        self.dbpath = os.path.join(self.abspath, self.dbFile)

    def create_table(self, tableName, field_list):
        """
        执行sql语句，可以是建表语句，也可以执行普通的sql语句
        field_list里面存储的是元祖，[(field, type, size), ('deviceID', 'varchar', 50),  ...]
        field: 字段名
        type: 字段类型
        size: 字段长度，可为空
        tableName: 表名
        """
        # 连接数据库
        conn = sqlite3.connect(self.dbpath)
        c = conn.cursor()
        try:
            sql = "CREATE TABLE %s(" % tableName
            for index, field_tuple in enumerate(field_list):
                if field_tuple[2]:
                    if index == len(field_list) - 1:
                        sql += (field_tuple[0] + " " + field_tuple[1] + "(%s)") % field_tuple[2]
                    else:
                        sql += (field_tuple[0] + " " + field_tuple[1] + "(%s),") % field_tuple[2]
                else:
                    if index == len(field_list) - 1:
                        sql += field_tuple[0] + " " + field_tuple[1]
                    else:
                        sql += field_tuple[0] + " " + field_tuple[1] + ","
            sql += ");"
            # 执行sql语句
            c.execute(sql)
            # 提交事务并关闭连接
            conn.commit()
            conn.close()
        except Exception as e:
            print(u"表%s创建失败!" % tableName)

    def insert_table(self, tableName, insert_values):
        """
        写入数据到.db文件
        insert_values:存储的是写入数据库的每条数据的值，列表中的每条数据也是列表
            [['value1_field1', 'value1_field2', ...], ['value2_field1', 'value2_field2', ...], ...]
        tableNames: 列表存储多个表名
        """
        # 连接数据库
        conn = sqlite3.connect(self.dbpath)
        c = conn.cursor()
        sql = "INSERT INTO %s VALUES " % tableName
        for index1, values in enumerate(insert_values):
            sql1 = ""
            for index2, i in enumerate(values):
                if not i:
                    i = ""
                if index2 == len(values) - 1:
                    sql1 += "\'%s\'" % str(i)
                else:
                    sql1 += "\'%s\'" % str(i) + ","
            if index1 == len(insert_values) - 1:
                sql += "(" + sql1 + ");"
            else:
                sql += "(" + sql1 + "),"
        try:
            # 执行sql语句
            c.execute(sql)
            # 提交事务并关闭连接
            conn.commit()
            conn.close()
        except Exception as e:
            print(u"sql语句: %s 执行失败!\n报错信息：%s" % (sql, e))


class redis_resolve(object):
    """
    redis相关读写操作
    """
    def __init__(self, host=REDIS_IP, port=REDIS_PORT, db=0):
        """
        初始化redis配置信息
        :param host: redis的IP
        :param port: redis的端口
        :param db: redis的库，默认第0个库
        """
        self.host = host
        self.port = port
        self.db = db

    def _connect_redis(self):
        """
        连接redis数据库
        :return: redis
        """
        redis = StrictRedis(host=self.host, port=self.port, db=self.db)
        return redis

    def set_redis(self, key, value, timeout):
        """
        写redis 数据
        """
        try:
            redis = self._connect_redis()
            redis.set(key, value)
            # 设置过期时间
            redis.expire(key, timeout)
            return True
        except Exception as e:
            return False

    def get_redis(self, key):
        """
        读redis数据
        :param key:
        :return:
        """
        redis = self._connect_redis()
        value = redis.get(key)
        return value


def getHash(file_path):
    """
    获取文件内容的MD5值
    :param file_path: 文件的绝对路径
    :return:
    """
    if not os.path.isfile(file_path):
        return
    f = open(file_path, 'rb')
    md5_obj = hashlib.md5()
    while True:
        b = f.read(8096)
        if not b:
            break
        md5_obj.hexdigest()
    f.close()
    return md5_obj.hexdigest()