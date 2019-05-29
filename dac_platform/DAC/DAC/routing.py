from channels.routing import ProtocolTypeRouter

from DAC.consumers import MyConsumer

application = ProtocolTypeRouter({
    "mqtt": MyConsumer,
})