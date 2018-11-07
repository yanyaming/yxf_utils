#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "#install frps"
firewall-cmd --zone=public --add-port=8003/tcp --permanent &&
firewall-cmd --zone=public --add-port=8004/tcp --permanent &&
firewall-cmd --zone=public --add-port=8005/tcp --permanent &&
firewall-cmd --zone=public --add-port=8006/tcp --permanent &&
firewall-cmd --reload &&
yxf_root ./frp/frps &&
yxf_cp ./frp/frps /opt/frps &&
yxf_cp ./frp/frps.service /usr/lib/systemd/system/frps.service &&
systemctl enable frps &&
systemctl start frps &&
systemctl status frps &&
yxf_echo_success "install success"
exit 0