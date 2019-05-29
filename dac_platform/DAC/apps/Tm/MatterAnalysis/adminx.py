import xadmin
from xadmin import views
from apps.Tm.MatterAnalysis.models import ProtocolType, ProtocolParamsDNC


# 增加xadmin 页面主题栏
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


# 更改xadmin 的页面标题
class GlobalSettings(object):
    site_title = "DAC后台管理系统"
    site_footer = "展湾信息在线"
    menu_style = "accordion"



class ProtocolParamsDNCAdmin(object):
    list_display = ['ProType', 'operationValue', 'Description', 'type',
                    'configValue', 'operationUnit']
    search_fields = ['ProType', 'operationValue', 'Description', 'type',
                     'configValue', 'operationUnit', 'operationFlag', 'upload', 'createTime', 'updateTime']
    list_editable = ['ProType', 'operationValue', 'Description', 'type',
                     'configValue', 'operationUnit', 'operationFlag', 'upload', 'createTime', 'updateTime']
    list_filter = ['ProType', 'operationValue', 'Description', 'type',
                   'configValue', 'operationUnit', 'operationFlag', 'upload', 'createTime', 'updateTime']
    style_fields = {'content': 'ueditor'}
    model_icon = 'fa fa-heart'


class ProtocolTypeAdmin(object):
    list_display = ["DeviceType", 'TypeList', 'operationFlag', 'createTime', 'updateTime']
    search_fields = ['DeviceType', 'TypeList', 'operationFlag', 'createTime', 'updateTime']
    list_editable = ['DeviceType', 'TypeList', 'operationFlag', 'createTime', 'updateTime']
    list_filter = ['DeviceType', 'TypeList', 'operationFlag', 'createTime', 'updateTime']
    style_fields = {'content': 'ueditor'}
    readonly_fields = ["DeviceType", 'TypeList',]

xadmin.site.register(ProtocolType, ProtocolTypeAdmin)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(ProtocolParamsDNC, ProtocolParamsDNCAdmin)
