import datetime
from apscheduler.schedulers.background import BackgroundScheduler
from django_apscheduler.jobstores import DjangoJobStore, register_events, register_job
from apps.Tm.GateAccess.models import GateInfoModel
import socket



try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind(("127.0.0.1", 47200))
except socket.error:
    print("!!!scheduler already started, DO NOTHING")
else:
    # 实例化调度器
    scheduler = BackgroundScheduler()
    # 开启定时工作
    try:
        # 调度器使用DjangoJobStore()
        scheduler.add_jobstore(DjangoJobStore(), "default")
        # 设置定时任务，选择方式为interval，时间间隔为30s
        # 另一种方式为每天固定时间执行任务，对应代码为：
        # @register_job(scheduler, 'cron', day_of_week='mon-fri', hour='9', minute='30', second='10',id='task_time')

        @register_job(scheduler, "interval", seconds=30)
        def judge_gate_status():
            """
            判断网关是否在线，并且更新网关状态
            :return:
            """
            now = datetime.datetime.now()
            gateinfos = GateInfoModel.objects.filter().all()
            for i in gateinfos:
                try:
                    total_interval_time = (now - i.gatherTime).total_seconds()
                    if total_interval_time > 3*60:
                        i.status = "offline"
                    else:
                        i.status = "online"
                    i.save()
                except Exception as e:
                    print(e)
            # print("Update Gateway Status Timing Task Executed Successfully！")

        @register_job(scheduler, "interval", seconds=180)
        def del_gate_for_not_register():
            """
            定期清理未注册，也一直处于未登陆的网关
            :return:
            """
            now = datetime.datetime.now()
            gateinfos = GateInfoModel.objects.filter(ifregister=0).all()
            for i in gateinfos:
                try:
                    total_interval_time = (now - i.updateTime if i.updateTime else now).total_seconds()
                    if total_interval_time > 3*60:
                        i.delete()
                except Exception as e:
                    print(e)

        register_events(scheduler)
        scheduler.start()
    except Exception as e:
        print(e)
        # 有错误就停止定时器
        scheduler.shutdown()