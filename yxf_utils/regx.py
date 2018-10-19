# -*- coding: utf-8 -*-

"""
通用正则表达式接口
"""

import re


# 匹配通用数据格式
re_intNumber_pattern = re.compile(r'^-?[1-9]\d*$')  # 匹配整数
re_numberInString_pattern = re.compile(r'(?!\D)\d+(?=\D)')  # 匹配字符串中的数字
re_positiveIntNumber_pattern = re.compile(r'^[1-9]\d*$')  # 匹配正整数
re_floatNumber_pattern = re.compile(r'^-?[1-9]\d*\.\d*|0\.\d*[1-9]\d*$')  # 匹配浮点数
re_chineseCharacter_pattern = re.compile(r'[\u4e00-\u9fa5]')  # 匹配中文字符
re_numberInDoubleQuote_pattern = re.compile(r'\"\d\"')  # 匹配双引号中的数字


# 匹配特定信息
res_url_pattern = re.compile(r'[a-zA-z]+://[^\s]*')  # 匹配url网址
res_phoneNum_pattern = re.compile(r'^1\d{10}$')  # 匹配手机号
res_email_pattern = re.compile(  # 匹配email地址
    "[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?"
)
res_standardDate_pattern = re.compile(  # 匹配标准格式日期：yyyy-mm-dd
    r'([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))'
)
res_htmlNote_pattern = re.compile(r'<[!?]?[^>]+-->')  # 匹配html注释
res_htmlTag_pattern = re.compile(r'')  # 匹配html标签
res_htmlId_pattern = re.compile(r'')  # 匹配htmlId
res_htmlClass_pattern = re.compile(r'')  # 匹配htmlClass
res_htmlAttr_pattern = re.compile(r'')  # 匹配html属性
res_ipv4Adress_pattern = re.compile(r'(\d{1,3}\.){3}\d')  # 匹配ipv4地址
res_macAdress_pattern = re.compile(r'([A-Fa-f0-9]{2}\:){5}[A-Fa-f0-9]')  # 匹配mac地址
