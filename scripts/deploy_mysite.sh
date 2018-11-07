#!/bin/sh
# -*- coding: utf-8 -*-
if [ -d /opt/yxf_mysite_py_django ]
then
	cd /opt/yxf_mysite_py_django
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_mysite_py_django.git
fi

if [ -d /opt/yxf_yixue_py ]
then
	cd /opt/yxf_yixue_py
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_yixue_py.git
fi

if [ -d /opt/yxf_utils ]
then
	cd /opt/yxf_utils
	git pull
else
	cd /opt
	git clone -b master https://www.github.com/yanyaming/yxf_utils.git
fi
