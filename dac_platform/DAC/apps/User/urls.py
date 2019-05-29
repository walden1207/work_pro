# encoding: utf-8
from django.urls import path
from . import views


app_name = 'User'

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.Login, name='login'),
    path('send_identifying_code', views.send_identifying_code, name='send_identifying_code'),
    path('get_identifying_code', views.get_identifying_code, name='get_identifying_code'),
    path('chage_passwd', views.chage_passwd, name='chage_passwd'),
    path('register', views.register, name='register'),
]