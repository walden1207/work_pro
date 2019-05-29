# encoding: utf-8
from rest_framework import serializers
from .models import AlgorithmDetailsModel, AlgorithmTypeModel


class AlgorithmTypeSerializer(serializers.ModelSerializer):

    class Meta:
        model = AlgorithmTypeModel
        fields = ('id', 'name')


class AlgorithmDetailsSerializer(serializers.ModelSerializer):
    type = AlgorithmTypeSerializer()

    class Meta:
        model = AlgorithmDetailsModel
        fields = ('id', 'name', 'type', 'synopsis', 'contents', 'icon')







