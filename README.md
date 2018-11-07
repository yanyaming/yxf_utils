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

### 操作系统环境配置osenv:
CentOS-GUI取消自动休眠：  

	settings->privacy->screen lock->off；
	settings->power->blank screen->never;
	settings->power->automatic suspend->off;  

CentOS-GUI自动登录：  
修改配置文件/etc/gdm/custom.conf，在[daemon]下添加  

	AutomaticLoginEnable=true
	AutomaticLogin=root

ssh远程登录（默认端口22）：  

	ssh [ip] -l [user]
	(input password)

### Python环境配置pythonenv:
程序名python3,pip3  

### 正向代理服务器shadowsocks: 
端口50003  

### 反向代理内网穿透服务器frp:
域名配置：frps不设置，frpc设置custom_domains为某个实际域名的二级域名，交给域名服务商解析（需要提前添加*.domain解析）  
端口8003:web
端口8004:dashboard  
端口8005:ssh  
端口8006:staticfile   

### 反向代理网络应用服务器nginx:
配置文件/etc/nginx/nginx.conf设置user root，注释掉两个log文档路径，把server{}字段注释掉；  
视情况修改自定义default.conf配置文件（可配置多个服务）。  
端口80  

### 应用网关服务器uwsgi:
视情况修改自定义uwsgi.ini配置文件（可新建多个ini文件配置多个服务，配置后需要修改service文件）。  
端口9090  

### 关系数据库postgresql:
安装后默认生成一个OS用户postgres和一个数据库管理员postgres。  
默认数据库路径为/var/lib/pgsql/[version]/data/postgresql。  
端口5432  

1.切换到OS的postgres用户：   
 
	su postgres  
	
2.使用数据库的postgres进入psql，修改数据库管理员密码：  

	psql -U postgres  
	>ALTER USER postgres WITH PASSWORD '[pwd]';  

3.修改配置文件，允许远程管理：  
配置文件/var/lib/pgsql/10/data/postgresql.conf：   
 
	listen_addresses = 'localhost' # 取消注释并改为listen_addresses='*'   
	
配置文件/var/lib/pgsql/10/data/pg_hba.conf 添加如下语句，同时其余全改为trust:  

	host    all            all      0.0.0.0/0（允许任何计算机远程）  trust  

新建数据库和用户：  

	CREATE DATABASE mysite;  
	CREATE USER mysiteuser CREATEDB LOGIN PASSWORD '[pwd]';  
	GRANT ALL ON DATABASE mysite TO mysiteuser;  

### 内存数据库redis:	
配置文件/etc/redis.conf，network栏目里注释掉bind 127.0.0.1，设置protected-mode no关闭保护模式；  
配置文件/etc/redis.conf，security栏目里#requirepass foobared取消注释，把foobared修改为自己的密码。  
远程密码登录连接>redis-cli -h [host] -p [port] -a [password]。  
端口6379  
