#!/bin/sh
# -*- coding: utf-8 -*-
yum -y install mongodb &&
yum -y install mongodb-server &&
systemctl enable mongod &&
systemctl start mongod &&
systemctl status mongod &&
firewall-cmd --zone=public --add-port=27017/tcp --permanent &&
firewall-cmd --reload &&
#default db path:/var/lib/mongodb
exit 0