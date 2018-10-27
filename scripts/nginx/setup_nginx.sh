#!/bin/sh
# -*- coding: utf-8 -*-
yum -y install nginx &&
systemctl enable nginx &&
systemctl status nginx &&
cp -vfR ./default.conf /etc/nginx/conf.d/default.conf &&
firewall-cmd --zone=public --add-port=80/tcp --permanent &&
firewall-cmd --reload &&
exit 0
