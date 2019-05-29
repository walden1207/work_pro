#!/usr/bin/python
#coding:utf-8

from django.contrib import admin
from apps.Tm.MatterAnalysis.models import ProtocolParamsDNC, ProtocolType

admin.site.register(ProtocolParamsDNC)
admin.site.register(ProtocolType)
