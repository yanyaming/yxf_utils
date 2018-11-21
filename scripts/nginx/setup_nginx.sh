#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "install nginx"
yum -y install nginx &&
yxf_echo_info "generate sslkey"
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout ./nginx/mysite.key -out ./nginx/mysite.crt
#数字证书内容：
#Country Name (2 letter code) [AU]:CN ← 国家代号，中国输入CN 
#State or Province Name (full name) [Some-State]:BeiJing ← 省的全名，拼音 
#Locality Name (eg, city) []:BeiJing ← 市的全名，拼音 
#Organization Name (eg, company) [Internet Widgits Pty Ltd]:MyCompany Corp. ← 公司英文名 
#Organizational Unit Name (eg, section) []: ← 可以不输入 
#Common Name (eg, YOUR name or your server's hostname) []:domain.com ← 网站域名 
#Email Address []:admin@mycompany.com ← 电子邮箱，可随意填
#注意：自己给自己颁发的证书不受浏览器信任，要受信任可通过IE安装或从机构获取
yxf_mkdir /etc/nginx/ssl &&
yxf_mv ./nginx/mysite.crt /etc/nginx/ssl/mysite.crt &&
yxf_mv ./nginx/mysite.key /etc/nginx/ssl/mysite.key &&
yxf_echo_info "start server"
yxf_cp ./nginx/default.conf /etc/nginx/conf.d/default.conf &&
firewall-cmd --zone=public --add-port=80/tcp --permanent &&
firewall-cmd --zone=public --add-port=443/tcp --permanent &&
firewall-cmd --reload &&
systemctl enable nginx &&
systemctl start nginx &&
systemctl status nginx &&
yxf_echo_success "install success"
exit 0
