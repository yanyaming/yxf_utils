#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "install mongodb"
yum -y install mongodb mongodb-server &&
yxf_cp ./mongodb/mongod.service /usr/lib/systemd/system/mongod.service &&
yxf_root /usr/lib/systemd/system/mongod.service &&
firewall-cmd --zone=public --add-port=27017/tcp --permanent &&
firewall-cmd --reload &&
systemctl enable mongod &&
systemctl start mongod &&
systemctl status mongod &&
yxf_echo_success "install success"
#default db path:/var/lib/mongodb
exit 0