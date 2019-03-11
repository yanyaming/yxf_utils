#!/bin/sh
# -*- coding: utf-8 -*-
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
cd ..
source ./_common/_common.sh
yxf_echo_info "install shadowsocks"
pip install shadowsocks &&
yxf_mkdir /etc/shadowsocks &&
yxf_cp ./shadowsocks/shadowsocks.json /etc/shadowsocks/shadowsocks.json
read -p "please input your server ip:" ip
read -p -s "please set your server password:" password
yxf_echo_info "set ip and pwd to file"
sed -i 's/\[publicIP\]/'${ip}'/g' /etc/shadowsocks/shadowsocks.json &&
sed -i 's/\[pwd\]/'${password}'/g' /etc/shadowsocks/shadowsocks.json &&
yxf_echo_info "set service"
yxf_cp ./shadowsocks/shadowsocks.service /usr/lib/systemd/system/shadowsocks.service &&
yxf_root /usr/lib/systemd/system/shadowsocks.service &&
systemctl enable shadowsocks &&
yxf_echo_info "firewall"
firewall-cmd --zone=public --add-port=8010/tcp --permanent &&
firewall-cmd --reload &&
systemctl start shadowsocks &&
systemctl status shadowsocks &&
yxf_echo_success "install success"
exit 0
