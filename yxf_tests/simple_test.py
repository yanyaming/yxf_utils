# -*- coding: utf-8 -*-

"""
简单代码测试
"""


def simple_test():
    # 导入标准库
    import os  # 系统操作
    import json  # json操作
    import sys  # 编程语言操作
    import datetime
    # sys.path.append('..')  # 默认path（标准库+当前路径），添加上级路径
    # sys.path.append('../somedir')  # 添加其他路径
    # TEST_BASE_DIR = os.path.dirname(os.path.abspath(__file__))  # 测试的基础路径
    # TEST_WORK_DIR = os.path.join(TEST_BASE_DIR, 'workdir')+'/filename'  # 测试的工作路径

    # 在这里导入你的待测试代码依赖的库

    pass


# 被导入时不执行，直接打开时执行
if __name__ == '__main__':
    simple_test()
