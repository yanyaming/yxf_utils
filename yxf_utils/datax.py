#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
通用数据处理代码
"""


# 输入以换行符分隔的列表文本，返回python简单列表对象
def strCarriage_to_pythonList(strr):
    listt = strr.split('\n')
    return listt


# 输入以换行符分隔的列表文本，指定每个列表项的键名称，返回python字典列表对象
def strCarriage_to_pythonDict(strr, key_name):
    listt = strr.split('\n')
    dict_list = []
    for i in listt:
        dict_list.append({key_name: '{0}'.format(i)})
    return dict_list
