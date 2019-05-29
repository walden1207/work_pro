# encoding: utf-8
from django.urls import path
from . import views


app_name = 'GateAccess'

urlpatterns = [
    path('gateinfo', views.gateinfo, name='gateinfo'),
    path('enable_gate', views.enable_gate, name='enable_gate'),
    path('disabled_gate', views.disabled_gate, name='disabled_gate'),
    path('chage_gatename', views.chage_gatename, name='chage_gatename'),
]