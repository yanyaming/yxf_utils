#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yum -y install python-devel &&
pip install uwsgi &&
yxf_cp ./uwsgi/uwsgi.ini /etc/uwsgi/uwsgi.ini &&
yxf_cp ./uwsgi/uwsgi.service /usr/lib/systemd/system/uwsgi.service &&
yxf_root /usr/lib/systemd/system/uwsgi.service &&
systemctl enable uwsgi &&
systemctl status uwsgi &&
firewall-cmd --zone=public --add-port=9090/tcp --permanent &&
firewall-cmd --reload &&
exit 0
