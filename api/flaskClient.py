#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : DataCollectionSoftware 
@File       : flaskClient.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2023/8/30 17:02 
@Description: 
"""
# import requests
# import json
# import time
#
# url = 'http://127.0.0.1:8888/query'
# data = {
#     'database': 'OQMD',
#     'collection': 'GeometryOptimization',
#     # 'sort': {'Energy': -1}    # 1: ascending order; -1: descending order
#     # 'skip': 20,     # skip 20 datas
#     'limit': 10000  # 21-30 here
# }
#
# start = time.time()
# response = requests.post(url, data=json.dumps(data))
# entries = json.loads(response.text)['data']
# print(len(entries))
# print('cost time: ', time.time() - start)
# 10,000 data  33.63s
