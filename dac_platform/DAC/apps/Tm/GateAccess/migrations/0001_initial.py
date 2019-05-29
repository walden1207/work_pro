# Generated by Django 2.1.7 on 2019-05-06 20:03

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GateInfoModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('compID', models.CharField(blank=True, max_length=50, null=True, verbose_name='公司ID')),
                ('gateMac', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关Mac')),
                ('machID', models.CharField(blank=True, max_length=50, null=True, verbose_name='设备ID')),
                ('gateName', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关名称')),
                ('cpuUsg', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关CPU个数')),
                ('memUsg', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关内存使用')),
                ('gateType', models.CharField(blank=True, max_length=50, null=True, verbose_name='网关类型')),
                ('ifregister', models.IntegerField(verbose_name='是否启用')),
                ('gatherTime', models.DateTimeField(default=datetime.datetime.now, verbose_name='网关刷新时间')),
                ('status', models.CharField(blank=True, max_length=50, null=True, verbose_name='网关状态')),
                ('ServerIP', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关IP')),
                ('protocol', models.CharField(blank=True, max_length=255, null=True, verbose_name='解析协议名称')),
                ('lastoperationType', models.CharField(blank=True, max_length=255, null=True, verbose_name='最新接收到的指令')),
                ('lastBuildTime', models.DateTimeField(default=datetime.datetime.now, verbose_name='最新创建时间')),
                ('parse_version', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关解析文件版本')),
                ('instruct_version', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关指令文件版本')),
                ('config_version', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关配置文件版本')),
                ('system_version', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关系统版本')),
                ('software_version', models.CharField(blank=True, max_length=255, null=True, verbose_name='网关server版本')),
                ('createTime', models.DateTimeField(default=datetime.datetime.now, verbose_name='创建者创建的时间')),
                ('updateTime', models.DateTimeField(default=datetime.datetime.now, verbose_name='更新者更新的时间')),
                ('instructProtocol', models.CharField(blank=True, max_length=255, null=True, verbose_name='指令协议名称')),
            ],
            options={
                'db_table': 'edge_gateinfo',
            },
        ),
        migrations.AlterUniqueTogether(
            name='gateinfomodel',
            unique_together={('gateMac',)},
        ),
    ]
