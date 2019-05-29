#!/usr/bin/python
#coding:utf-8

"""
@author: walden
@contact: walden1207@163.com
@software: PyCharm
@file: ProtocolConfig.py
@time: 2019/4/30 10:05
"""


# 协议所需参数
protocol_config = {
    "ABB": ["machineip", "serialport", "updatetime"],
    "OPCUA": ["machineid", "machineip", "machineport", "username", "password", "updatetime"],
    "KUKA": ["machineip"],
    "Focas": ["machineid", "machineip", "machineport", "updatetime", "collecttype"],
    "OPCDA": ["machineip", "machineport", "overtime"],
    "Hanslaser": ["machineip", "machineport", "overtime", "machinePlcPort"],
}
configmap = {
    "machineip": "",
    "machineport": "8193",
    "serialport": "com1",
    "updatetime": "30",
    "machineid": "123",
    "overtime": "10",
    "collecttype": "1",
    "username": "",
    "password": "",
    "machinePlcPort": "2002",
}