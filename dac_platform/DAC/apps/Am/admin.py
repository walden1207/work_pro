from django.contrib import admin
from apps.Am.models import AlgorithmDetailsModel, AlgorithmTypeModel

admin.site.register(AlgorithmDetailsModel)
admin.site.register(AlgorithmTypeModel)