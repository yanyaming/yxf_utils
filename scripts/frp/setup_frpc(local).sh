#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "#install frpc"
firewall-cmd --zone=public --add-port=80/tcp --permanent &&
firewall-cmd --reload &&
yxf_cp ./frp/frpc /opt/frpc &&
yxf_cp ./frp/frpc.service /usr/lib/systemd/system/frpc.service &&
systemctl enable frpc &&
systemctl start frpc &&
systemctl status frpc &&
yxf_echo_success "install success"
exit 0