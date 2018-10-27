#!/bin/sh
# -*- coding: utf-8 -*-
# 文件内容操作
# sed '1,2a newstr' filename.txt——在1-3行后面追加字符串
# sed '1d' filename.txt——删除第1行
# sed '$d' filename.txt——删除最后1行
# sed '1,5c newstr' filename.txt——把1-5行替换为新字符串
# sed 's/oldstr_re/newstr/g' filename.txt——用re搜索字符串并替换
# sed -i 's/oldstr_re/newstr/g' filename.txt——直接修改原文件
# nl filename | sed '/str_list/{s/oldstr_re/newstr/;p}'——nl打开文件并自动添加行号，以分号分隔多列显示
# sed -n '/root/{s/bash/blueshell/;p}'——不仅显示而且执行
file_append_line() {
	echo ""
}
file_insert_line() {
	echo ""
}
file_replace_str() {
	echo ""
}
file_delete_line() {
	echo ""
}
file_renew() {
	echo ""
}
