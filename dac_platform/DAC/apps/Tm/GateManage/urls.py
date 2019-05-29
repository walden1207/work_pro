#!/usr/bin/python
#coding:utf-8

from django.urls import path
from apps.Tm.GateManage import views

app_name = 'GateManage'

urlpatterns = [
    path('dispatch', views.dispatch, name='dispatch'),
    path('update_gateway_info', views.update_gateway_info, name='update_gateway_info'),
    path('upgrade_gateway', views.upgrade_gateway, name='upgrade_gateway'),
    path('del_gateway', views.del_gateway, name='del_gateway'),
    path('reboot_gateway', views.reboot_gateway, name='reboot_gateway'),
    path('async_history', views.async_history, name='async_history'),
    ]