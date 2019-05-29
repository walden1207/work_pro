# encoding: utf-8
from django.db import models
from apps.DjangoUeditor.models import UEditorField


class AlgorithmTypeModel(models.Model):
    """
    算法类型模型
    """
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, null=True, verbose_name="算法类型")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "algorithm_type"
        verbose_name = "算法类型"
        verbose_name_plural = verbose_name


class AlgorithmDetailsModel(models.Model):
    """
    算法详情模型
    """
    id = models.AutoField(primary_key=True)
    name = models.CharField("算法名称", max_length=255, null=True)
    type = models.ForeignKey(AlgorithmTypeModel, related_name="algorithm_types", on_delete=models.SET_NULL, null=True)
    synopsis = models.TextField("算法简介", blank=True, null=True)
    contents = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                            toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={},
                            verbose_name="算法内容")
    icon = models.CharField("图标", max_length=255, blank=True, null=True)
    nameEn = models.CharField("算法英文名称", max_length=255, blank=True, null=True)
    inputFormat = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                               toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={},
                               verbose_name="输入格式")
    inputJson = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                             toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={},
                             verbose_name="输入json文件样式")
    outputJson = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                              toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={},
                              verbose_name="输出json文件")
    outputContent = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                                 toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={},
                                 verbose_name="输出内容")
    api = UEditorField(width=624, height=300, default=u'', blank=True, imagePath="images/", filePath="files/",
                       toolbars="full", upload_settings={"imageMaxSize": 1204000}, settings={}, verbose_name="API")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "algorithm_details"
        verbose_name = "算法详情"
        verbose_name_plural = verbose_name
