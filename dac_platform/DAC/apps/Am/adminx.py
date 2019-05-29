import xadmin
from apps.Am.models import AlgorithmTypeModel, AlgorithmDetailsModel


class AlgorithmTypeAdmin(object):
    list_display = ['name']
    list_editable = ['name']
    list_filter = ['name']


class AlgorithmDetailsAdmin(object):
    list_display = ['name', 'type', 'icon', 'nameEn', 'synopsis', 'contents', 'inputFormat', 'inputJson', 'outputJson',
                    'outputContent', 'api']
    list_editable = ['name', 'type', 'icon', 'nameEn', 'synopsis', 'contents', 'inputFormat', 'inputJson', 'outputJson',
                    'outputContent', 'api']
    list_filter = ['name', 'type', 'icon', 'nameEn', 'synopsis', 'contents', 'inputFormat', 'inputJson', 'outputJson',
                    'outputContent', 'api']

    # 需要富文本渲染的字段
    style_fields = {
        'contents': 'ueditor',
        'inputFormat': 'ueditor',
        'inputJson': 'ueditor',
        'outputJson': 'ueditor',
        'outputContent': 'ueditor',
        'api': 'ueditor',
    }


xadmin.site.register(AlgorithmTypeModel, AlgorithmTypeAdmin)
xadmin.site.register(AlgorithmDetailsModel, AlgorithmDetailsAdmin)
