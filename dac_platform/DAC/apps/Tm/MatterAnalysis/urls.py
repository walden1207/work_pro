#!/usr/bin/python
# coding:utf-8

from django.urls import path
from apps.Tm.MatterAnalysis import views

app_name = 'MatterAnalysis'

urlpatterns = [
    path('new_device', views.new_device, name='new_device'),
    path('get_protocols', views.get_protocols, name='get_protocols'),
    path('get_templateList', views.get_templateList, name='get_templateList'),
    path('get_params_infos', views.get_params_infos, name='get_params_infos'),
    path('get_MatterAnalysis', views.get_MatterAnalysis, name='get_MatterAnalysis'),
    path('get_deviceList', views.get_deviceList, name='get_deviceList'),
    path('get_dnc_params', views.get_dnc_params, name='get_dnc_params'),
    path('delete_device', views.delete_device, name='delete_device'),
    path('get_plc_params', views.get_plc_params, name='get_plc_params'),
    path('new_template', views.new_template, name='new_template'),
    path('del_device', views.del_device, name='del_device'),
    path('new_dnc_params', views.new_dnc_params, name='new_dnc_params'),
    path('del_template', views.del_template, name='del_template'),
    path('bulk_import_dnc_params', views.bulk_import_dnc_params, name='bulk_import_dnc_params'),
    path('bulk_export_to_excel', views.bulk_export_to_excel, name='bulk_export_to_excel'),
    path('update_device', views.update_device, name='update_device'),
]
