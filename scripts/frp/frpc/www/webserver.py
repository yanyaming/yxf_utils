#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals, print_function
import sys
import web
from urllib2 import urlopen
import json

urls = (
	'/', 'index',
	'/myip', 'myip',
)


class index:
	def GET(self):
		return '''<!DOCTYPE html>
					<html lang="zh-CN">
						<head>
						</head>
						<body>
							<h1>这是个人电脑上运行的http服务首页。</h1>
							<a href='/myip'>点击查看个人电脑的公网IP</a>
						</body>
					</html>'''
					
					
class myip:
	def GET(self):
		my_ip = json.load(urlopen('http://httpbin.org/ip'))['origin']  # python获取自己的公网IP需要通过第三方，否则只能获得内网IP没有用
		return '''<!DOCTYPE html>
					<html lang="zh-CN">
						<head>
						</head>
						<body>
							<p>个人电脑的公网IP：{ip}</p>
						</body>
					</html>'''.format(ip=my_ip)


if __name__ == "__main__":
	sys.argv.append('0.0.0.0:80')
	app = web.application(urls, globals())
	app.run()
