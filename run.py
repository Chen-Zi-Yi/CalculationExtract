#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : CalculationExtract 
@File       : run.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2024/5/30 17:08 
@Description: 
"""
import argparse
import yaml

from user_view import vasp_extract, oqmd_db_extract


def getArgument():
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('--source', default='vasp', help='data source: vasp, icsd, oqmd, materialproject, etc.')
    parser.add_argument('--root_dir', default='../test_data/39', help='calculation files root path')
    parser.add_argument('--log',action='store_true', default=False, help='if start log ')
    args = parser.parse_args()
    return args


if __name__ == '__main__':
    file = open('config.yaml')
    paras = yaml.load(file, Loader=yaml.FullLoader)
    file.close()

    args = getArgument()
    if args.source == 'vasp':
        vasp_extract(args.root_dir, args.log)
    elif args.source == 'oqmd':
        # oqmd 数据库解析
        host = paras['mysql']['host']
        port = paras['mysql']['port']
        user = paras['mysql']['user']
        password = paras['mysql']['password']
        database = paras['mysql']['database']
        oqmd_db_extract(host, port, user, password, database, args.log)
    else:
        print('source not found, please run "python run.py --help" ')
    # 其他数据源 补充
    # elif
    # elif