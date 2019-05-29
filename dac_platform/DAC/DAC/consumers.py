import collections
from channels.consumer import SyncConsumer
import apps.ChannelsMqtt.settings
from apps.Tm.GateAccess.views import ifregister
from apps.Public.common import sub_topic
from apps.Tm.GateAccess.models import GateInfoModel
from datetime import datetime
from apps.Public.common import redis_resolve


class MyConsumer(SyncConsumer):
    """
    存储要订阅的topic, 以元祖的形式存储到列表中
    """
    # TOPICS = [('0010/#', 0), ]
    TOPICS = sub_topic()

    def mqtt_sub(self, event):
        print("consumer SUB {}".format(event))

    def mqtt_pub(self, event):
        print("consumer PUB {}".format(event))

    def mqtt_top(self, event):
        print("consumer TOP {}".format(event))
        # 网关发送的消息类型
        sub_type = event["text"]["payload"]["type"]
        gateMac = event["text"]["topic"].split("/")[1]
        compID = event["text"]["topic"].split("/")[0]
        # 处理网关登录
        if sub_type == "Login":
            try:
                result = ifregister(event)
                # result == 2代表user表没有接入这个公司，即这个公司下面的网关均不接入
                if result != 2:
                    topic = compID + "/" + gateMac + '/Set/LoginAck'
                    # 定义payload为一个有序字典
                    payload = collections.OrderedDict()
                    payload["type"] = "LoginAck"
                    payload_tmp = collections.OrderedDict()
                    payload_tmp["result"] = result
                    payload_tmp["time"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3]
                    payload["values"] = []
                    payload["values"].append(payload_tmp)
                    self.send({
                        'type': apps.ChannelsMqtt.settings.MQTT_PUBLISH,
                        'text': {
                            'topic': topic,
                            'payload': payload,
                            'qos': 0,
                            'retain': False
                        }
                    })
            except Exception as e:
                print(e)
        # 处理Ntp校时
        if sub_type == "Ntp":
            try:
                topic = compID + '/' + gateMac + '/Set/Ntp'
                payload = collections.OrderedDict()
                payload["type"] = "Ntp"
                payload["values"] = []
                payload_tmp = collections.OrderedDict()
                payload_tmp["value"] = datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3]
                payload["values"].append(payload_tmp)
                self.send({
                    'type': apps.ChannelsMqtt.settings.MQTT_PUBLISH,
                    'text': {
                        'topic': topic,
                        'payload': payload,
                        'qos': 0,
                        'retain': False
                    }
                })
            except Exception as e:
                pass
        # 处理网关心跳
        if sub_type == "Heartbeat":
            data = {}
            payload_value = event["text"]["payload"]["values"][0]
            if "cpu_usage" in payload_value:
                data["cpuUsg"] = payload_value["cpu_usage"]
            if "mem_usage" in payload_value:
                data["memUsg"] = payload_value["mem_usage"]
            data["gatherTime"] = datetime.now()
            try:
                GateInfoModel.objects.filter(gateMac=gateMac).update(**data)
            except:
                pass

        # 处理下发采集项，网关的反馈消息
        if sub_type in ["ConfigRarAck", "UpgradeScriptsAck"]:
            if sub_type == "1":
                # 将Ack存储到redis中
                redis = redis_resolve()
                redis.set_redis(compID + '/' + gateMac.replace(':', '_') + '/' + sub_type, 1, 60)