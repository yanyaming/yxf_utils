#!/bin/sh
# -*- coding: utf-8 -*-
sudo yum -y install git
if [ -d /opt/yxf_myspider_py_scrapy ]
then
	cd /opt/yxf_myspider_py_scrapy
	git fetch --all
	git reset --hard origin/master
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_myspider_py_scrapy.git
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
chmod 777 -vR /opt/yxf_myspider_py_scrapy

firewall-cmd --zone=public --add-port=50003/tcp --permanent  #shadowsocks
firewall-cmd --zone=public --add-port=5432/tcp --permanent  #postgresql
firewall-cmd --zone=public --add-port=27017/tcp --permanent  #mongodb
firewall-cmd --zone=public --add-port=6379/tcp --permanent  #redis
firewall-cmd --zone=public --add-port=8001/tcp --permanent  #ipproxypool
firewall-cmd --zone=public --add-port=8080/tcp --permanent  #web.py spiderdataapi
firewall-cmd --zone=public --add-port=6800/tcp --permanent  #scrapyd spidermanager
#firewall-cmd --zone=public --add-port=8050/tcp --permanent  #scrapy-splash spiderdownloader local
firewall-cmd --reload
