# encoding: utf-8
import uuid

# 短信接口
message_url = "https://www.i-plc.cn/api/request"

# redis IP 和 port
REDIS_IP = "192.168.6.111"
REDIS_PORT = 6379

# emq配置信息
EMQ_USERNAME = "admin"
EMQ_PASSWORD = "public"
EMQ_IP = "192.168.6.111"
EMQ_PORT = 1883
EMQ_CLIENT_ID = "channels-" + str(uuid.uuid4())

# 配置订阅的公司ID的范围
startID = 0
endID = 100
qos = 0

# 订阅的消息类型
protocol_type = [
    "/+/Send/Login",
    "/+/Send/Ntp",
    "/+/Send/Heartbeat",
    "/+/Send/UpgradeScriptsAck",
    "/+/Send/ConfigRarAck",
]


class HttpCode(object):
    """
    状态码
    """
    # 请求成功
    ok = 200
    # 参数错误
    paramserror = 400
    # 未经授权
    unauth = 401
    # 方法错误
    methoderror = 405
    # 服务器内部错误
    servererror = 500