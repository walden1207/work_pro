"""DAC URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from apps.User import views
from apps.Am import views
from apps.Tm.GateAccess import views
from apps.Public import views
from apps.DjangoUeditor import urls as DjangoUeditor_urls
from django.urls import path, include
from . import settings
import xadmin
from xadmin.plugins import xversion

xadmin.autodiscover()
xversion.register_models()

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('xadmin/', xadmin.site.urls),
    path('ueditor/', include(DjangoUeditor_urls)),
    path('api/', include('rest_framework.urls', namespace='rest_framework')),
    path('', include("apps.User.urls")),
    path('am/', include("apps.Am.urls")),
    path('tm/', include("apps.Tm.GateAccess.urls")),
    path('tm/', include("apps.Tm.MatterAnalysis.urls")),
    path('tm/', include("apps.Tm.GateManage.urls")),
    path('public/', include("apps.Public.urls")),
]

if settings.DEBUG:
    from django.conf.urls.static import static
    urlpatterns += static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT
    )