yxf_utils : 通用工具
=========================================================

1.软件环境的安装脚本scripts  
2.python通用代码yxf_utils  
3.python测试yxf_tests  

## 开发

项目主题：python通用工具

开发环境：Windows&linux-centos7，python3.6

编程语言：python&shell

项目框架：无

项目根目录：./

## 手动操作项

### osenv:
无

### pythonenv:
无  

### shadowsocks:
需要提前修改shandowsocks.json的IP到服务器的公网IP，以及密码。  

### postgresql:
安装后默认生成一个OS用户postgres和一个数据库管理员postgres。  
默认数据库路径为/var/lib/pgsql/[version]/data/postgresql。  

1.切换到OS的postgres用户：   
 
	su postgres  
	
2.使用数据库的postgres进入psql，修改数据库管理员密码：  

	psql -U postgres  
	ALTER USER postgres WITH PASSWORD '[pwd]';  

3.修改配置文件，允许远程管理：  
配置文件/var/lib/pgsql/10/data/postgresql.conf：   
 
	listen_addresses = ‘localhost’ # 改为listen_addresses=’*’   
	
配置文件/var/lib/pgsql/10/data/pg_hba.conf 添加如下语句，同时其余全改为trust:  

	host    all            all      0.0.0.0/0（允许任何计算机远程）  trust  

新建数据库和用户：  

	CREATE DATABASE mysite;  
	CREATE USER mysiteuser CREATEDB LOGIN PASSWORD '[pwd]';  
	GRANT ALL ON DATABASE mysite TO mysiteuser;  

### nginx:
配置文件/etc/nginx.conf设置user root;  
配置文件/etc/nginx.conf注释掉两个log文档路径，把server{}字段注释掉；  
视情况修改自定义default.conf配置文件（可配置多个服务）。  

### uwsgi:
视情况修改自定义uwsgi.ini配置文件（可新建多个ini文件配置多个服务，配置后需要修改service文件）。  

### django:
无  