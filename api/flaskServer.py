#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : DataCollectionSoftware 
@File       : flaskServer.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2023/8/30 16:51 
@Description: 
"""
import pymongo
from flask import Flask, jsonify, request  # 需自行下载Flask包，并导入这几个内容
from pymongo import MongoClient
import json
app = Flask(__name__)


# 初始化生成一个app对象，这个对象就是Flask的当前实例对象，后面的各个方法调用都是这个实例
# Flask会进行一系列自己的初始化，比如web API路径初始化，web资源加载，日志模块创建等。然后返回这个创建好的对象给你


@app.route("/")  # 自定义路径
def index():
    return 'Hello!'


@app.route("/query", methods=["POST"])  # 自定义query路径
def query():
    data = json.loads(request.get_data())

    # print(data)
    if 'database' not in data and 'collection' not in data:
        res = {'error': 1, 'message': 'database or collection not exist!'}
        return jsonify(res)
    database = data['database']
    collect = data['collection']

    clint = MongoClient(host='localhost', port=27017)
    db = clint[database]
    collection = db[collect]

    if 'filter' in data:
        querySet = collection.find(data['filter'])
    else:
        querySet = collection.find({})
    if 'sort' in data:
        sort = data['sort']
        for key, val in sort.items():
            querySet = querySet.sort(key, val)
    if 'skip' in data:
        querySet = querySet.skip(int(data['skip']))
    if 'limit' in data:
        querySet = querySet.limit(int(data['limit']))

    responseData = []
    for entry in querySet:
        entry['_id'] = str(entry['_id'])
        entry['User'] = str(entry['User'])
        responseData.append(entry)
    return jsonify({'error': 0, 'message': 'success', 'data': responseData})
    # return 'QUERY'


if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=8000)  #
# flask默认是没有开启debug模式的，开启debug模式，可以帮助我们查找代码里面的错误
# host = '127.0.0.1' 表示设置的ip，如果需要连接手机等设备，可以将手机和电脑连接同一个热点，将host设置成对应的ip
# port 为端口号，可自行设置
