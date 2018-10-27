#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "#close selinux"
yxf_cp ./osenv/config /etc/selinux/config &&
yxf_echo_info "#update software lib"
yum -y install epel-release &&
yum makecache &&
yxf_echo_info "#install gcc"
yum -y install gcc &&
yxf_echo_info "#install some tools"
yum -y install net-tools &&
yum -y install wget &&
yum -y install git &&
yum -y install tree &&
yum -y install pandoc &&
yum -y install telnet &&
yxf_echo_info "#install pip"
#usage:
#pip freeze -----------see all installed site-packages and versions
#pip freeze > requirments.txt -----------------dump requirments
#pip -r requirments.txt -------------------install all the requiments
#pip list -------------see all installed site-packages
#pip install [somepack] ------------------install
#pip install --upgrade [somepack] ---------------upgrade
#pip uninstall [somepack] ----------------uninstall
yum -y install python-pip &&
pip install --upgrade pip &&
pip install setuptools &&
python --version
pip --version
yxf_echo_success "#install success"
exit 0