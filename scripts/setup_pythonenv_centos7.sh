#!/bin/sh
#CentOS
#Install multi python env
#python3
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz &&
sudo yum install zlib-devel &&
tar -xvf Python-3.6.5.tgz &&
mv Python-3.6.5 /usr/local &&
mkdir /usr/local/python3 &&
cd /usr/local/Python-3.6.5 &&
./configure --prefix=/usr/local/python3 --enable-optimizations &&
make &&
make install &&
ln -s /usr/local/python3/bin/python3  /usr/bin/python3 &&
cd /
python3 --version
#pip3
sudo yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel &&
wget --no-check-certificate  https://pypi.python.org/packages/source/s/setuptools/setuptools-19.6.tar.gz#md5=c607dd118eae682c44ed146367a17e26 &&
tar -zxvf setuptools-19.6.tar.gz &&
cd setuptools-19.6 &&
python3 setup.py build &&
python3 setup.py install &&
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3 &&
cd /
pip3 --version
#virtualenv(python2)
#usage:
#cd [my_project_path];virtualenv [my_project_env] -----------init independent env in this path, use system default python version
#cd [my_project_path];virtualenv -p /usr/bin/python3 [my_project_env] ---------init and use custom python version
#cd [my_project_path];source my_project_env/bin/activate ---------active this new v-version
#cd [my_project_path];deactivate -----------deactive this new v-version
pip install virtualenv
exit 0
