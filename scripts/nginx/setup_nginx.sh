#!/bin/sh
#install nginx
sudo yum -y install nginx &&
sudo systemctl enable nginx &&
echo "check service:" &&
systemctl status nginx &&
#install config file
cp -f ./default.conf /etc/nginx/default.d/default.conf &&
#firewall
firewall-cmd --zone=public --add-port=80/tcp --permanent &&
firewall-cmd --reload &&
exit 0
