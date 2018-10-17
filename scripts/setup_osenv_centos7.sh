#!/bin/sh
#CentOS
#update software lib
sudo yum -y install epel-release &&
sudo yum makecache &&
#install gcc
sudo yum -y install gcc &&
#install some tools
sudo yum -y install net-tools &&
sudo yum -y install tree &&
sudo yum -y install pandoc &&
#install pip
#usage:
#pip freeze -----------see all installed site-packages and versions
#pip freeze > requirments.txt -----------------dump requirments
#pip -r requirments.txt -------------------install all the requiments
#pip list -------------see all installed site-packages
#pip install [somepack] ------------------install
#pip install --upgrade [somepack] ---------------upgrade
#pip uninstall [somepack] ----------------uninstall
sudo yum -y install python-pip &&
pip install --upgrade pip &&
pip install setuptools &&
echo "python version in this CentOS:" &&
python --version &&
echo "pip version in this CentOS:" &&
pip --version &&
exit 0
