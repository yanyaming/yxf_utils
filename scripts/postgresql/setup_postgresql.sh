#!/bin/sh
# -*- coding: utf-8 -*-
#these commands are from official document. version 10
yum -y install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm &&
yum -y install postgresql10 &&
yum -y install postgresql10-server &&
/usr/pgsql-10/bin/postgresql-10-setup initdb &&
systemctl enable postgresql-10 &&
systemctl start postgresql-10 &&
firewall-cmd --zone=public --add-port=5432/tcp --permanent &&
firewall-cmd --reload &&
systemctl status postgresql-10 &&
#default db path:/var/lib/pgsql/[version]/data/postgresql
exit 0