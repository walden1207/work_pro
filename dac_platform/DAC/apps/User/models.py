# encoding: utf-8
from django.db import models
import uuid
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager


class UserManager(BaseUserManager):
    """
    创建用户类
    """
    def _create_user(self, telephone, username, password, **kwargs):
        if not telephone:
            raise ValueError("请输入手机号!")
        if not username:
            raise ValueError("请输入用户名!")
        if not password:
            raise ValueError("请输入密码!")
        user = self.model(telephone=telephone, username=username, **kwargs)
        user.set_password(password)
        user.save()
        return user

    def create_user(self, telephone, username, password, **kwargs):
        kwargs['is_superuser'] = False
        return self._create_user(telephone, username, password, **kwargs)

    def create_superuser(self, telephone, username, password, **kwargs):
        kwargs['is_superuser'] = True
        kwargs['is_staff'] = True
        kwargs["compID"] = -1
        kwargs["compName"] = "超级管理员"
        kwargs["token"] = uuid.uuid4()
        return self._create_user(telephone, username, password, **kwargs)


class UserModel(AbstractBaseUser, PermissionsMixin):
    """
    用户模型
    """
    compID = models.IntegerField("公司ID", blank=True, null=True)
    compName = models.CharField("公司名称", max_length=255, blank=True, null=True)
    telephone = models.CharField("手机号", max_length=11, unique=True)
    email = models.EmailField("邮箱", unique=True, null=True)
    username = models.CharField("用户名", max_length=100, unique=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    is_active = models.BooleanField("激活状态", default=True)
    is_staff = models.BooleanField("允许登录后台", default=False)
    data_joined = models.DateTimeField(auto_now_add=True)
    token = models.CharField("前后端密令", max_length=255, unique=True)
    # url = models.CharField("i-work地址", max_length=100, blank=True, null=True)

    # 登录验证字段
    USERNAME_FIELD = 'username'
    # create_superuser时需要写入的必填字段，会自动的加上登录验证字段telephone和password字段
    REQUIRED_FIELDS = ['telephone']
    # 给用户发送邮件指定字段
    EMAIL_FIELD = 'email'

    objects = UserManager()

    class Meta:
        db_table = "edge_users"
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name