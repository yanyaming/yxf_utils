#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "install uwsgi"
yum -y install python-devel &&
pip install uwsgi &&
yxf_cp ./uwsgi/uwsgi.ini /etc/uwsgi/uwsgi.ini &&
yxf_cp ./uwsgi/uwsgi.service /usr/lib/systemd/system/uwsgi.service &&
yxf_root /usr/lib/systemd/system/uwsgi.service &&
systemctl enable uwsgi &&
systemctl start uwsgi &&
systemctl status uwsgi &&
firewall-cmd --zone=public --add-port=9090/tcp --permanent &&
firewall-cmd --reload &&
yxf_echo_success "install success"
exit 0
