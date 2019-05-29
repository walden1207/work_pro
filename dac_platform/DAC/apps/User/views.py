# encoding: utf-8
from django.shortcuts import render
import requests
from django.views.decorators.http import require_POST

from apps.Public.config import message_url
from .models import UserModel
from apps.Public import restful
from django.contrib.auth import login
from django.contrib.auth import get_user_model
from django.db.models import Q
import uuid

User = get_user_model()


def index(request):
    """
    首页
    """
    return render(request, 'index.html')


@require_POST
def Login(request):
    """
    用户登录
    """
    username = request.POST["username1"]
    password = request.POST["password1"]
    user = UserModel.objects.filter(Q(username=username) | Q(telephone=username)).all()
    if user:
        user = user[0]
        if user.check_password(password):
            if user.is_active:
                login(request, user)
                result = restful.ok(data={"token": user.token})
            else:
                result = restful.params_error(message="telephone")
        else:
            result = restful.params_error(message="password")
    else:
        result = restful.params_error(message="telephone")
    return result


@require_POST
def register(request):
    """
    用户注册
    """
    name = request.POST["username"]
    telephone = request.POST["telephone"]
    email = request.POST["email"]
    password = request.POST["password"]
    token = uuid.uuid4()
    if UserModel.objects.filter(telephone=telephone):
        return restful.params_error(message="this user is exist!")
    try:
        user = UserModel.objects.create_user(username=name, telephone=telephone, email=email,
                                             password=password, token=token, is_active=1)
        user.compID = user.id
        user.save()
        login(request, user)
        result = restful.ok()
    except Exception as e:
        result = restful.server_error(message="this telephone or email is exist!")
    return result


@require_POST
def send_identifying_code(request):
    """
    生成6位随机数并发送给用户
    """
    try:
        telephone = request.POST["telephone"]
        data = {
            "phoneNum": telephone,
            "rname": "i_plc.Page.register.register.getSMS_login"
        }
        res = requests.post(message_url, data=data).json()
        if res["success"]:
            result = restful.ok()
        else:
            result = restful.params_error(message="failure to send verification code")
    except Exception as e:
        result = restful.server_error(message=e)
    return result


@require_POST
def get_identifying_code(request):
    """
    根据手机号从redis获取验证码，前端表单值与redis存储的验证码进行比对
    """
    telephone = request.POST["telephone"]
    cache_code = request.POST["cache_code"]
    user = UserModel.objects.filter(phoneNum=telephone)
    data = {
        "phoneNum": telephone,
        "verificationCode": cache_code,
        "rname": "i_plc.Page.register.register.verifyCode"
    }
    res = requests.post(message_url, data=data).json()
    if not user:
        if res["success"]:
            result = restful.params_error(message="telephone")
        else:
            result = restful.params_error(message="both")
    else:
        if res["success"]:
            result = restful.ok()
        else:
            result = restful.params_error(message="cache_code")
    return result


@require_POST
def chage_passwd(request):
    """
    更改登录密码
    """
    new_passwd = request.POST["new_passwd"]
    telephone = request.POST["telephone"]
    user = UserModel.objects.filter(telephone=telephone)
    if user:
        user = user[0]
        user.set_password(new_passwd)
        user.save()
        result = restful.ok()
    else:
        result = restful.server_error(message="failed to change password")
    return result
