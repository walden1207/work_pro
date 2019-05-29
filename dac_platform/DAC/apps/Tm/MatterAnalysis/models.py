#!/usr/bin/python
# coding:utf-8

from django.db import models
from datetime import datetime


class DeviceTemplates(models.Model):
    """
    采集项模板表模型
    """
    id = models.AutoField(primary_key=True)
    TemplateName = models.CharField("模板名称", unique=True, max_length=50, blank=True, null=True)
    TypeList = models.CharField("支持协议", max_length=255, blank=True, null=True)
    proType = models.CharField("协议类型", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("是否启用标识符", default=9)
    createTime = models.DateTimeField("创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新的时间", default=datetime.now)

    class Meta:
        db_table = "device_templates"
        verbose_name = "采集项模板"
        verbose_name_plural = verbose_name


class ProtocolType(models.Model):
    """
    协议类型表
    """
    id = models.AutoField(primary_key=True)
    DeviceType = models.CharField("协议类型", max_length=50, blank=True, null=True)
    TypeList = models.CharField("协议名称_设备版本", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("是否启用标识符", default=9)
    createTime = models.DateTimeField("创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新的时间", default=datetime.now)

    class Meta:
        db_table = "protocol_type"
        verbose_name = "协议类型"
        verbose_name_plural = "协议"

    def __str__(self):
        return self.TypeList


class ProtocolPLC(models.Model):
    """
    PLC协议解析表模型, PLC采集项需要分隔成一个instruct.db指令文件和parse.db解析文件
    """
    id = models.AutoField(primary_key=True)
    gateMac = models.CharField("网关Mac", max_length=50, blank=True, null=True)
    deviceType = models.CharField("协议名称", max_length=50, blank=True, null=True)
    serialNum = models.CharField("网关串口号", max_length=50, blank=True, null=True)
    deviceID = models.CharField("采集设备的协议ID号", max_length=50, blank=True, null=True)
    deviceIP = models.CharField("采集设备的IP", max_length=50, blank=True, null=True)
    functionCode = models.CharField("功能码", max_length=50, blank=True, null=True)
    startAddress = models.CharField("读取寄存器的起始地址", max_length=50, blank=True, null=True)
    len = models.CharField("读取的寄存器个数", max_length=20, blank=True, null=True)
    operationFlag = models.IntegerField("是否有效标识符", default=9)
    delayMs = models.CharField("每次读取数据的延时时间，单位ms", max_length=50, blank=True, null=True)
    dataType = models.ForeignKey(ProtocolType, related_name="proPLC", on_delete=models.SET_NULL, null=True)
    machCode = models.CharField("设备编码", max_length=50, blank=True, null=True)
    name = models.CharField("变量名字", max_length=50, blank=True, null=True)
    type = models.CharField("变量类型", max_length=50, blank=True, null=True)
    Multiple = models.CharField("倍数运算", max_length=50, blank=True, null=True)
    offset = models.CharField("补偿运算", max_length=50, blank=True, null=True)
    maxValue = models.CharField("最大值", max_length=50, blank=True, null=True)
    minValue = models.CharField("最小值", max_length=50, blank=True, null=True)
    des = models.CharField("为对应指令描述", max_length=100, blank=True, null=True)
    operationUnit = models.CharField("变量单位", max_length=50, blank=True, null=True)
    template = models.IntegerField("模板ID", default=-1)
    createTime = models.DateTimeField("创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新的时间", default=datetime.now)

    class Meta:
        db_table = "protocol_plc"
        unique_together = ("name", "gateMac", "template", "machCode","deviceType")
        verbose_name = "PLC采集项"
        verbose_name_plural = verbose_name


class ProtocolDNC(models.Model):
    """
    DNC协议解析表模型
    """
    id = models.AutoField(primary_key=True)
    gateMac = models.CharField("网关Mac", max_length=50, blank=True, null=True)
    type = models.CharField("变量类型", max_length=50, blank=True, null=True)
    operationValue = models.CharField("变量名称", max_length=50, blank=True, null=True)
    operationUnit = models.CharField("变量单位", max_length=50, blank=True, null=True)
    Description = models.CharField("采集项名称的描述", max_length=255, blank=True, null=True)
    deviceIP = models.CharField("设备IP", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("是否启用标识符", default=9)
    upload = models.IntegerField("是否上传DAC", default=0)
    configValue = models.CharField("端口号", max_length=50, blank=True, null=True)
    deviceType = models.ForeignKey(ProtocolType, related_name="proDNC", on_delete=models.SET_NULL, null=True)
    machCode = models.CharField("设备编码", max_length=50, blank=True, null=True)
    template = models.IntegerField("模板ID", default=-1)
    createTime = models.DateTimeField("创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新的时间", default=datetime.now)

    class Meta:
        db_table = "protocol_dnc"
        unique_together = ("gateMac", "operationValue", "machCode", "template", "deviceType")
        verbose_name = "DNC采集项"
        verbose_name_plural = verbose_name


class DeviceModal(models.Model):
    """
    物影子表模型
    """
    id = models.AutoField(primary_key=True)
    compID = models.CharField("公司ID", max_length=50, blank=True, null=True)
    modalName = models.CharField("设备名称", max_length=50, blank=True, null=True)
    machCode = models.CharField("设备编码", unique=True, max_length=50, blank=True, null=True)
    des = models.CharField("设备描述", max_length=255, blank=True, null=True)
    gateMac = models.CharField("网关Mac", max_length=50, blank=True, null=True)
    protocol = models.CharField("协议名称", max_length=100, blank=True, null=True)
    serialPort = models.CharField("端口号", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("标志位", default=9)
    status = models.CharField("设备状态", max_length=20, blank=True, null=True)
    createTime = models.DateTimeField("创建时间", default=datetime.now)
    updateTime = models.DateTimeField("更新时间", default=datetime.now)

    class Meta:
        db_table = "edge_devicemodal"
        verbose_name = "物影子"
        verbose_name_plural = verbose_name


class Variables(models.Model):
    """
    变量表模型
    """
    id = models.AutoField(primary_key=True)
    compID = models.CharField("公司ID", max_length=20, blank=True, null=True)
    machID = models.ForeignKey(DeviceModal, related_name="devices", db_column="machID", on_delete=models.SET_NULL,
                               null=True)
    machCode = models.CharField("设备编码", max_length=100, blank=True, null=True)
    gateMac = models.CharField("网关Mac", max_length=100, blank=True, null=True)
    Protocol = models.CharField("协议名称", max_length=20, blank=True, null=True)
    gateWayIP = models.CharField("网关采集的设备IP", max_length=50, blank=True, null=True)
    serial_num = models.CharField("串口号", max_length=20, blank=True, null=True)
    gateWayID = models.CharField("网关采集的设备ID", max_length=50, blank=True, null=True)
    dataType = models.CharField("数据类型", max_length=50, blank=True, null=True)
    operationValue = models.CharField("变量", max_length=50, blank=True, null=True)
    operationData = models.CharField("变量值", max_length=50, blank=True, null=True)
    operationUnit = models.CharField("变量单位", max_length=50, blank=True, null=True)
    gatherTime = models.CharField("数据上传时间", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("数据标志位", default=9)
    cpu_usage = models.CharField("CPU使用率", max_length=50, blank=True, null=True)
    mem_usage = models.CharField("CPU使用率", max_length=50, blank=True, null=True)
    createTime = models.DateTimeField("创建时间", default=datetime.now)
    updateTime = models.DateTimeField("更新时间", default=datetime.now)

    class Meta:
        db_table = "dac_variables"
        unique_together = ('machCode', 'operationValue', 'Protocol')
        verbose_name = "变量表"
        verbose_name_plural = verbose_name


class ProtocolParamsDNC(models.Model):
    """
    DNC协议采集项
    """
    id = models.AutoField(primary_key=True)
    ProType = models.CharField("协议名称", max_length=50, blank=True, null=True)
    operationValue = models.CharField("采集项名称", max_length=50, blank=True, null=True)
    Description = models.CharField("采集项名称的描述", max_length=255, blank=True, null=True)
    type = models.CharField("字段类型", max_length=50, blank=True, null=True)
    configValue = models.CharField("端口号", max_length=50, blank=True, null=True)
    operationUnit = models.CharField("采集项单位", max_length=50, blank=True, null=True)
    operationFlag = models.IntegerField("标识符", default=9)
    upload = models.IntegerField("是否上传DAC", default=0)
    createTime = models.DateTimeField("创建的时间", default=datetime.now)
    updateTime = models.DateTimeField("更新的时间", default=datetime.now)

    class Meta:
        db_table = "protocol_params_dnc"
        verbose_name = "DNC协议采集项模板"
        verbose_name_plural = verbose_name
        unique_together = ("ProType", "operationValue")

    def __str__(self):
        return self.operationValue
