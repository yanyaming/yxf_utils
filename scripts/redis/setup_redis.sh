#!/bin/sh
# -*- coding: utf-8 -*-
yum -y install redis &&
systemctl enable redis &&
systemctl start redis &&
systemctl status redis &&
firewall-cmd --zone=public --add-port=6379/tcp --permanent &&
firewall-cmd --reload &&
#default db path:/var/lib/redis
exit 0
