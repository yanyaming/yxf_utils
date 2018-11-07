#!/bin/sh
# -*- coding: utf-8 -*-
if [ -d /opt/yxf_myspider_py_scrapy ]
then
	cd /opt/yxf_myspider_py_scrapy
	git pull
else
	cd /opt
	# git bug!!!cannot download
	git clone -b master https://www.github.com/yanyaming/yxf_myspider_py_scrapy.git
fi

if [ -d /opt/yxf_utils ]
then
	cd /opt/yxf_utils
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_utils.git
fi
