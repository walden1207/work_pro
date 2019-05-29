# encoding: utf-8
from django.urls import path
from . import views


app_name = 'Am'

urlpatterns = [
    path('get_algorithm_details', views.get_algorithm_details, name='get_algorithm_details'),
    path('get_details', views.get_details, name='get_details'),
]