#!/bin/sh
# -*- coding: utf-8 -*-
# 读取所有通用代码source，只定义了通用函数，不执行任何操作；唯一操作是切换到scripts目录
source ./_common/_fs.sh
source ./_common/_file.sh
source ./_common/_net.sh
source ./_common/_sys.sh
yxf_echo_success "load common code ok"