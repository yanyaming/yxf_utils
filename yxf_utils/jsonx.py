# -*- coding: utf-8 -*-

"""
通用json处理接口
"""

import json


# 输入单引号为边界的类json字符串（内部可能还有双引号），返回单引号为边界的python字典or列表对象。
def singleQuoteJsonStr_to_PythonObj(strr):
    jsonObj = eval(strr)  # 不能用内置函数解析。只能模拟执行。
    return jsonObj  # dict or list


# 输入完全正规的json字符串（键-值边界为双引号），返回单引号为边界的python字典or列表对象。
def jsonStr_to_PythonObj(strr):
    jsonObj = json.loads(strr)
    return jsonObj  # dict or list


# 输入python列表或字典（边界为单引号的类json对象），返回边界为双引号的json字符串且双引号加斜杠转义。
def pythonObj_to_jsonStr(obj):
    jsonStr = json.dumps(obj)
    return jsonStr  # str
