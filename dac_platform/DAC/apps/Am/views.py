# encoding: utf-8
from django.views.decorators.http import require_POST
from .models import AlgorithmDetailsModel, AlgorithmTypeModel
from apps.Public import restful
from django.db.models import Q


@require_POST
def get_algorithm_details(request):
    """
    算法详情页展示
    :param request: keywords:搜索关键字
    :return: {"算法类型":[{"id":"算法id", "name": "算法名称", "synopsis":"算法简介", "contents": "算法内容", "icon": "图标"}...]...}
    """
    # 用来存储算法类型的字典变量
    algorithmDict = {}
    keywords = request.POST['keywords']
    if keywords == '':
        algorithmType = AlgorithmTypeModel.objects.filter().all()
        for i in algorithmType:
            # 用来存储算法详情的列表变量
            algorithmList = []
            algorithmDetails = AlgorithmDetailsModel.objects.filter(type=i.id).all()
            for j in algorithmDetails:
                algorithmList.append({"id": j.id, "name": j.name, "synopsis": j.synopsis[0:28], "contents": j.contents,
                                      "icon": j.icon})
            # 为了让前端展示方便，给前端添加一个_am来辨识
            algorithmDict[i.name + "_am" + str(i.id)] = algorithmList
    else:
        algorithmDetails = AlgorithmDetailsModel.objects.filter(Q(name__icontains=keywords)).all()
        if algorithmDetails:
            algorithmIDs = [(i.type.name, i.id, i.type_id) for i in algorithmDetails]
            algorithmIDs = set(algorithmIDs)
            for i in algorithmIDs:
                algorithmList = []
                algorithm = algorithmDetails.get(id=i[1])
                data = {"id": algorithm.id, "name": algorithm.name, "synopsis": algorithm.synopsis[0:28], "contents": algorithm.contents,
                                      "icon": algorithm.icon}
                if (str(i[0]) + "_am" + str(i[2])) in algorithmDict:
                    algorithmList = algorithmDict[str(i[0]) + "_am" + str(i[2])]
                algorithmList.append(data)
                algorithmDict[str(i[0]) + "_am" + str(i[2])] = algorithmList
    result = restful.ok(data=algorithmDict)
    return result


@require_POST
def get_details(request):
    name = request.POST["name"]
    algorithmDetails = AlgorithmDetailsModel.objects.filter(name=name)[0]
    data = {
        "type": algorithmDetails.type.name,
        "name": name,
        "nameEn": algorithmDetails.nameEn,
        "content": algorithmDetails.synopsis,
        "inputFormat": algorithmDetails.inputFormat,
        "inputJson": algorithmDetails.inputJson,
        "outputJson": algorithmDetails.outputJson,
        "outputContent": algorithmDetails.outputContent,
        "api": algorithmDetails.api
    }
    return restful.ok(data=data)