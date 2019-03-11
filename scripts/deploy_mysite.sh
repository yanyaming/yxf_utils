#!/bin/sh
# -*- coding: utf-8 -*-
sudo yum -y install git
if [ -d /opt/yxf_mysite_py_django ]
then
	cd /opt/yxf_mysite_py_django
	git fetch --all
	git reset --hard origin/master
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_mysite_py_django.git
fi

if [ -d /opt/yxf_yixue_py ]
then
	cd /opt/yxf_yixue_py
	git fetch --all
	git reset --hard origin/master
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_yixue_py.git
fi

if [ -d /opt/yxf_utils ]
then
	cd /opt/yxf_utils
	git fetch --all
	git reset --hard origin/master
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_utils.git
fi

chmod 777 -vR /opt/yxf_utils
chmod 777 -vR /opt/yxf_mysite_py_django
chmod 777 -vR /opt/yxf_yixue_py

firewall-cmd --zone=public --add-port=80/tcp --permanent  #nginx web
firewall-cmd --zone=public --add-port=443/tcp --permanent  #nginx web
firewall-cmd --zone=public --add-port=5432/tcp --permanent  #postgresql
#firewall-cmd --zone=public --add-port=9090/tcp --permanent  #uwsgi local
firewall-cmd --zone=public --add-port=8002/tcp --permanent  #yixue
firewall-cmd --zone=public --add-port=8003/tcp --permanent  #frps
firewall-cmd --zone=public --add-port=8004/tcp --permanent  #frps
firewall-cmd --zone=public --add-port=8005/tcp --permanent  #frps
firewall-cmd --zone=public --add-port=8006/tcp --permanent  #frps
firewall-cmd --zone=public --add-port=8007/tcp --permanent  #websocket
firewall-cmd --zone=public --add-port=8010/tcp --permanent  #shadowsocks
firewall-cmd --zone=public --add-port=50008/tcp --permanent  #tcpsocket
firewall-cmd --reload
