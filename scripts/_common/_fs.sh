#!/bin/sh
# -*- coding: utf-8 -*-
# 文件系统操作
#新建目录
yxf_mkdir() {
	mkdir -vp $1
}
#新建文件：文件所在目录不存在时自动创建目录
yxf_mkfile() {
	if [ -d $1 ];then
		touch -f $1/$2
		echo "touch: $1/$2"
	else
		mkdir -vp $1
		touch -f $1/$2
		echo "touch: $1/$2"
	fi
}
#删除：递归删除文件或目录
yxf_rm() {
	rm -vrf $1
}
#复制：复制文件或目录，不存在时可自动创建
yxf_cp() {
	cp -vfR $1 $2
}
#备份复制：复制文件或目录，且给旧文件或目录重命名备份
yxf_cp_bakup() {
	rename -v $2 $2~ $2
	cp -vfR $1 $2
}
#遍历：遍历所有目录和文件包括隐藏的
yxf_ls(){  
    for element in `ls -a $1`  
    do  
        if [ x"$element" != x"." -a x"$element" != x".." ];then  
            if [ -d "$1/$element" ];then  
                echo "$1/$element"  
                yxf_ls "$1/$element"  
			else
				echo "$1/$element" 
            fi  
        fi  
    done  
}
#更新：简单使用cp的功能，新增则新增，修改则覆盖，不变则不动，问题在删除（删除不会自动删除）
yxf_cp_update() {
	cp -uvR $1 $2
}  
#移动：先把文件或目录复制过去，再删除源，目标目录若不存在则自动创建
yxf_mv() {
	cp -vfR $1 $2
	rm -vrf $1
}
#改名：文件或目录改名，不会像mv那样误操作
yxf_rename() {
	rename -v $1 $2 $1
}
#切换文件目录到root状态
yxf_root() {
	chmod -vR 754 $1
	chown -vR root $1
	chgrp -vR root $1
}
#切换工作路径到当前脚本所在目录：外部调用的输入参数固定为$0
yxf_cd_curpath() {
	curpath=$(cd "$(dirname "$1")"; pwd)
	cd $curpath
}
