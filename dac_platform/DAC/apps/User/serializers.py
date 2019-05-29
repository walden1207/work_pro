# encoding: utf-8
from rest_framework import serializers
from .models import UserModel


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = ('name', 'phoneNum', 'password', 'emailAddr', 'url', 'token')