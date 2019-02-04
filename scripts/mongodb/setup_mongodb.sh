#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "install mongodb"
yxf_echo_info "download mongodb rpm"
wget https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/RPMS/mongodb-org-server-4.0.5-1.el7.x86_64.rpm &&
rpm -ivh mongodb-org-server-4.0.5-1.el7.x86_64.rpm --force --nodeps &&
systemctl disable mongod &&
yxf_rm mongodb-org-server-4.0.5-1.el7.x86_64.rpm &&
yxf_cp ./mongodb/mongod.service /usr/lib/systemd/system/mongod.service &&
yxf_root /usr/lib/systemd/system/mongod.service &&
systemctl daemon-reload &&
systemctl enable mongod &&
systemctl start mongod &&
systemctl status mongod &&
firewall-cmd --zone=public --add-port=27017/tcp --permanent &&
firewall-cmd --reload &&
yxf_echo_success "install success"
#default db path:/var/lib/mongodb
exit 0