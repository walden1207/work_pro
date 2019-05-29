# encoding: utf-8
from django.db import models
from apps.User.models import UserModel
from datetime import datetime


class GateInfoModel(models.Model):
    id = models.AutoField(primary_key=True)
    compID = models.CharField("公司ID", max_length=50, blank=True, null=True)
    gateMac = models.CharField("网关Mac", max_length=255, blank=True, null=True)
    machID = models.CharField("设备ID", max_length=50, blank=True, null=True)
    gateName = models.CharField("网关名称", max_length=255, blank=True, null=True)
    cpuUsg = models.CharField("网关CPU个数", max_length=255, blank=True, null=True)
    memUsg = models.CharField("网关内存使用", max_length=255, blank=True, null=True)
    gateType = models.CharField("网关类型", max_length=50, blank=True, null=True)
    ifregister = models.IntegerField("是否启用")
    gatherTime = models.DateTimeField("网关刷新时间", default=datetime.now)
    status = models.CharField("网关状态", max_length=50, blank=True, null=True)
    ServerIP = models.CharField("网关IP", max_length=255, blank=True, null=True)
    protocol = models.CharField("解析协议名称", max_length=255, blank=True, null=True)
    lastoperationType = models.CharField("最新接收到的指令", max_length=255, blank=True, null=True)
    lastBuildTime = models.DateTimeField("最新创建时间", default=datetime.now)
    parse_version = models.CharField("网关解析文件版本", max_length=255, blank=True, null=True)
    instruct_version = models.CharField("网关指令文件版本", max_length=255, blank=True, null=True)
    config_version = models.CharField("网关配置文件版本", max_length=255, blank=True, null=True)
    system_version = models.CharField("网关系统版本", max_length=255, blank=True, null=True)
    software_version = models.CharField("网关server版本", max_length=255, blank=True, null=True)
    createTime = models.DateTimeField("创建者创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新者更新的时间", default=datetime.now)
    instructProtocol = models.CharField("指令协议名称", max_length=255, blank=True, null=True)

    class Meta:
        db_table = "edge_gateinfo"
        unique_together = ("gateMac",)
