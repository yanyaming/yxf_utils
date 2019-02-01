#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "#install python3 requirments"
yum -y install zlib-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel &&
cd ~
yxf_echo_info "download python3 sourcecode"
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz && tar -xvf Python-3.6.5.tgz &&
yxf_rm /usr/local/Python-3.6.5 && 
yxf_mv Python-3.6.5 /usr/local &&
yxf_mkdir /usr/local/python3 &&
cd /usr/local/Python-3.6.5 &&
yxf_echo_info "configure:"
./configure --prefix=/usr/local/python3 --enable-optimizations &&
yxf_echo_info "make:"
make &&
yxf_echo_info "make install:"
make install &&
ln -s /usr/local/python3/bin/python3  /usr/bin/python3 &&
cd ~ &&
yxf_rm Python-3.6.5 && yxf_rm Python-3.6.5.tgz &&
python3 --version
yxf_echo_success "install python3 ok"
yxf_echo_info "install setuptools"
cd ~ &&
wget --no-check-certificate  https://pypi.python.org/packages/source/s/setuptools/setuptools-19.6.tar.gz#md5=c607dd118eae682c44ed146367a17e26 && 
tar -zxvf setuptools-19.6.tar.gz &&
cd setuptools-19.6 &&
python3 setup.py build &&
python3 setup.py install &&
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3 &&
cd ~ &&
yxf_rm setuptools-19.6 && yxf_rm setuptools-19.6.tar.gz &&
yxf_echo_info "upgrade pip3"
pip3 install --upgrade pip &&
pip3 --version
#virtualenv(python2)
#usage:
#cd [my_project_path];virtualenv [my_project_env] -----------init independent env in this path, use system default python version
#cd [my_project_path];virtualenv -p /usr/bin/python3 [my_project_env] ---------init and use custom python version
#cd [my_project_path];source my_project_env/bin/activate ---------active this new v-version
#cd [my_project_path];deactivate -----------deactive this new v-version
#pip install virtualenv
yxf_echo_success "install success"
exit 0
