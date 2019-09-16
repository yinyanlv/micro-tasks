#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

from apscheduler.schedulers.blocking import BlockingScheduler
from datetime import datetime
from config import conf


def job():
    print(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))


scheduler = BlockingScheduler()
# 每天24:00:00触发，cron来源于希腊语chronos（时间），tab全称是table（表）
scheduler.add_job(job, 'cron', day_of_week='0-6', hour=0, minute=0, second=0)
app_name = conf.get('app', 'name')
print(app_name + 'is running!')
scheduler.start()
