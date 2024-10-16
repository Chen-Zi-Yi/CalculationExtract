#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : CalculationExtract-main 
@File       : conn.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2024/10/15 18:04 
@Description: 
"""
import pymysql


class SQL:
    def __init__(self, host, port, user, password, database):
        self.conn = pymysql.connect(host=host, port=port, user=user, password=password, database=database)

    def query(self, sql):
        cursor = self.conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        return result

    def insert(self, sql):
        cursor = self.conn.cursor()
        cursor.execute(sql)
        self.conn.commit()
        cursor.close()

    def close(self):
        self.conn.close()