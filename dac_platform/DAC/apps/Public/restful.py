# encoding: utf-8
from django.http import JsonResponse
from .config import HttpCode


def result(code=HttpCode.ok, message="", data=None, kwargs=None):
    """
    :param code:状态码
    :param message:错误信息
    :param data:返回的数据
    :param kwargs:其他的参数
    :return:{"code": code, "message": message, "data": data}
    """
    json_dict = {"code": code, "message": message, "data": data}

    if kwargs and isinstance(kwargs, dict) and kwargs.keys():
        json_dict.update(kwargs)

    return JsonResponse(json_dict)


def ok(data=None):
    return result(data=data)


def params_error(message="", data=None):
    """
    参数错误
    :param message:错误信息
    :param data:返回的数据
    :return:{"code": code, "message": message, "data": data}
    """
    return result(code=HttpCode.paramserror, message=message, data=data)


def unauth(message="", data=None):
    """
    没有授权
    :param message:
    :param data:
    :return:
    """
    return result(code=HttpCode.unauth, message=message, data=data)


def method_error(message="", data=None):
    """
    方法错误
    :param message:
    :param data:
    :return:
    """
    return result(code=HttpCode.methoderror, message=message, data=data)


def server_error(message="", data=None):
    """
    服务器内部错误
    :param message:
    :param data:
    :return:
    """
    return result(code=HttpCode.servererror, message=message, data=data)

