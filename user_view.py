#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : CalculationExtract 
@File       : user_view.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2024/5/30 17:12 
@Description: 
"""
import sys
import time
import json

from pymongo import MongoClient

from db.mongo.mongo_client import Mongo
from db.sql.conn import SQL
from entries.calculations import CalculateEntries
from entries.oqmd import OQMD
from i_o.oqmd.oqmd_parser import OQMD_Parser
from i_o.vasp.chgcar import Chgcar
from i_o.vasp.doscar import Doscar
from i_o.vasp.eigenval import Eigenval
from i_o.vasp.elfcar import Elfcar
from i_o.vasp.incar import Incar
from i_o.vasp.poscar import Poscar
from i_o.vasp.kpoints import Kpoints
from i_o.vasp.outcar import Outcar
from i_o.vasp.oszicar import Oszicar
from i_o.vasp.locpot import Locpot
from i_o.vasp.procar import Procar
from i_o.vasp.vasprun import Vasprun
import os
from tqdm import tqdm

from i_o.vasp.xdatcar import Xdatcar
from public.calculation_type import CalType

input_files = {'INCAR', 'KPOINTS', 'OSZICAR', 'OUTCAR', 'POSCAR', 'vasprun.xml''XDATCAR', 'DOSCAR',
               'PROCAR', 'ELFCAR', 'CHGCAR', 'EIGENVAL'}


def vasp_extract(root_path: str, log=False):
    """

    :param log:
    :param root_path:
    :return:
    """
    print(os.getcwd())
    s = time.strftime("%Y-%m-%d_%H_%M_%S")
    print('Vasp files extraction task start ..........')

    database = input('please input database name: (default: VaspData)')
    if database == '':
        database = 'VaspData'
    collections = []
    collections_all = [CalType.BandStructure, CalType.StaticCalculation, CalType.GeometryOptimization,
                       CalType.DensityOfStates, CalType.DielectricProperties, CalType.ElasticProperties,
                       CalType.MagneticProperties]
    collect = input(
        'please select collections: \n1.BandStructure, \n2.StaticCalculation, \n3.GeometryOptimization, \n4.DensityOfStates, \n5.DielectricProperties, \n6.ElasticProperties, \n7.MagneticProperties.\n input nums（1 2 4）')
    if collect == '':
        collections = collections_all
    else:
        for i in collect.split():
            collections.append(collections_all[int(i) - 1])
    host = input('please input db host: (default localhost)')
    if host == '':
        host = 'localhost'
    port = input('please input db port: (default 27017)')
    if port == '':
        port = '27017'
    port = int(port)
    user = input('please input source user: (default: vasp)')
    if user == '':
        user = 'vasp'
    group = input(f'please input source user group: (default: {user})')
    if group == '':
        group = user
    path_list_file = os.path.join(root_path, 'path_list.json')
    if os.path.exists(path_list_file):
        with open(path_list_file, 'r', encoding='utf8') as f:
            file_list = json.load(f)
    else:
        file_list = findPaths(root_path)
        with open(path_list_file, 'w', encoding='utf8') as f:
            json.dump(file_list, f)

    user_id, group_id = getUserAndGroup(host, port, user, group)
    if log:
        outfile_path = os.path.join(os.getcwd(), 'log', database + '_' + user + '_' + group + '_' + s + '.txt')
        outFile = open(outfile_path, 'w', encoding='utf8')
        sys.stdout = outFile
    print('Files Dir：', root_path)
    print('Files Number：', len(file_list))
    print('User：', user)
    print('Group：', group)
    print('Database：', database)
    print('Collections：', collections)
    print('host & port：', host, ' ', port)
    # 找到所有的vasp计算文件夹
    mongo = Mongo(host=host, port=port)
    for file in tqdm(file_list, total=len(file_list)):

        file_parsers = {}
        # 遍历目录中所有文件
        total_size = 0
        for file_name in os.listdir(file):
            full_path = os.path.join(file, file_name)
            if file_name.upper() == 'INCAR':
                total_size += get_file_size(full_path)
            elif file_name.lower() == 'vasprun.xml':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'POSCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'OUTCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'LOCPOT':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'KPOINTS':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'OSZICAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'XDATCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'DOSCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'PROCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'ELFCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'CHGCAR':
                total_size += get_file_size(full_path)
            elif file_name.upper() == 'EIGENVAL':
                total_size += get_file_size(full_path)
        if total_size > 20000 * 1024 * 1024:
            raise ValueError("File too big")
        for file_name in os.listdir(file):
            full_path = os.path.join(file, file_name)
            if file_name.upper() == 'INCAR':
                file_parsers['incar'] = Incar(full_path)
            elif file_name.lower() == 'vasprun.xml':
                file_parsers['vasprun'] = Vasprun(full_path)
                file_parsers['vasprun'].setup()
                # 从名字或Incar 和 Vasprun对象中获取计算类型，优先名字
        parm = {}
        if 'vasprun' in file_parsers and 'incar' in file_parsers:
            parm = file_parsers['vasprun'].parameters
            parm = file_parsers['incar'].fill_parameters(parm)
        elif 'vasprun' in file_parsers:
            parm = file_parsers['vasprun'].parameters
        elif 'incar' in file_parsers:
            parm = file_parsers['incar'].fill_parameters(parm)
        else:
            raise ValueError(
                f"INCAR or vasprun.xml file is required to determine the calculation type")
        cal_type = CalType.from_parameters(file, collections, parm)
        for file_name in os.listdir(file):
            full_path = os.path.join(file, file_name)
            if file_name.upper() == 'POSCAR':
                file_parsers['poscar'] = Poscar(full_path)
            elif file_name.upper() == 'OUTCAR':
                file_parsers['outcar'] = Outcar(full_path)
            elif file_name.upper() == 'LOCPOT':
                file_parsers['locpot'] = Locpot(full_path)
            elif file_name.upper() == 'KPOINTS':
                file_parsers['kpoints'] = Kpoints(full_path)
            elif file_name.upper() == 'OSZICAR':
                file_parsers['oszicar'] = Oszicar(full_path)
            elif file_name.upper() == 'XDATCAR':
                file_parsers['xdatcar'] = Xdatcar(full_path)
            elif file_name.upper() == 'DOSCAR':
                file_parsers['doscar'] = Doscar(full_path)
            elif file_name.upper() == 'PROCAR':
                file_parsers['procar'] = Procar(full_path)
            elif file_name.upper() == 'ELFCAR':
                file_parsers['elfcar'] = Elfcar(full_path)
            elif file_name.upper() == 'CHGCAR':
                file_parsers['chgcar'] = Chgcar(full_path)
            elif file_name.upper() == 'EIGENVAL':
                file_parsers['eigenval'] = Eigenval(full_path)
        # 根据计算类型创建计算对象
        cal_entry = CalculateEntries[cal_type](file_parsers)
        bson = cal_entry.to_bson(user_id, group_id)
        # 保存到数据库
        size = get_deep_size(bson)
        if size < 16 * 1024 * 1024:
            id = mongo.save_one(bson, database, cal_type)
        else:
            if 'Properties' in bson:
                properties = bson['Properties']
                file_id = mongo.save_large(properties, database)
                bson['Properties'] = file_id
            id = mongo.save_one(bson, database, cal_type)
        print(id)
    mongo.close()
    if log:
        outFile.close()
        sys.stdout = sys.__stdout__


def findPaths(rootPath):
    total_path = []
    file_list = os.listdir(rootPath)
    if not input_files.intersection(file_list):
        for file in file_list:
            if os.path.isdir(os.path.join(rootPath, file)):
                paths = findPaths(os.path.join(rootPath, file))
                for path in paths:
                    total_path.append(path)
    else:
        total_path.append(rootPath)
        for file in file_list:
            if os.path.isdir(os.path.join(rootPath, file)):
                paths = findPaths(os.path.join(rootPath, file))
                for path in paths:
                    total_path.append(path)
    return total_path


def get_deep_size(obj, seen=None):
    """Recursively finds the total size of an object including its nested objects."""
    if seen is None:
        seen = set()
    obj_id = id(obj)
    if obj_id in seen:
        return 0
    seen.add(obj_id)
    size = sys.getsizeof(obj)
    if isinstance(obj, dict):
        size += sum([get_deep_size(v, seen) for v in obj.values()])
        size += sum([get_deep_size(k, seen) for k in obj.keys()])
    elif hasattr(obj, '__dict__'):
        size += get_deep_size(obj.__dict__, seen)
    elif hasattr(obj, '__iter__') and not isinstance(obj, (str, bytes, bytearray)):
        size += sum([get_deep_size(i, seen) for i in obj])
    return size


def get_file_size(file_path):
    # 获取文件大小（字节）
    file_size = os.path.getsize(file_path)
    return file_size


def oqmd_db_extract(host, port, user, password, database, log=False):
    s = time.strftime("%Y-%m-%d_%H_%M_%S")
    print('OQMD DB Extraction Start ..........')

    mongo_database = input('Please input database name: (default: OQMD)')
    if mongo_database == '':
        mongo_database = 'OQMD'
    collections = []
    collections_all = [CalType.BandStructure, CalType.StaticCalculation, CalType.GeometryOptimization,
                       CalType.DensityOfStates, CalType.DielectricProperties, CalType.ElasticProperties,
                       CalType.MagneticProperties]
    collect = input(
        'please select collections: \n1.BandStructure, \n2.StaticCalculation, \n3.GeometryOptimization, \n4.DensityOfStates, \n5.DielectricProperties, \n6.ElasticProperties, \n7.MagneticProperties.\n input nums（1 2 4）')
    if collect.strip() == '':
        collections = collections_all
    else:
        for i in collect.split():
            collections.append(collections_all[int(i) - 1])
    mongo_host = input('please input db host: (default localhost)')
    if mongo_host == '':
        mongo_host = 'localhost'
    mongo_port = input('please input db port: (default 27017)')
    if mongo_port == '':
        mongo_port = '27017'
    mongo_port = int(mongo_port)
    mongo_user = input('please input source user: (default: oqmd)')
    if mongo_user == '':
        mongo_user = 'oqmd'
    mongo_group = input(f'please input source user group: (default: {mongo_user})')
    if mongo_group == '':
        mongo_group = mongo_user

    user_id, group_id = getUserAndGroup(mongo_host, mongo_port, mongo_user, mongo_group)
    if log:
        outfile_path = os.path.join(os.getcwd(), 'log', mongo_database + '_' + mongo_user + '_' + mongo_group + '_' + s + '.txt')
        outFile = open(outfile_path, 'w', encoding='utf8')
        sys.stdout = outFile

    print('DB：', database)
    print('User：', mongo_user)
    print('Group：', mongo_group)
    print('Database：', mongo_database)
    print('Collections：', collections)
    print('host & port：', mongo_host, ' ', mongo_port)

    client = SQL(host, port, user, password, database)
    entries = client.query('select * from entries')
    entry_ids = []
    mongo = Mongo(host=mongo_host, port=mongo_port)
    for entry in entries:
        entry_ids.append(entry[0])
    for entry_id in entry_ids:
        calculations = client.query(f'select * from calculations where entry_id = {entry_id}')
        for calculation in calculations:
            parser = OQMD_Parser(calculation, client)
            cal_type = parser.cal_type
            oqmd_item = OQMD(parser, user_id, group_id)
            bson = oqmd_item.basicDoc
            id = mongo.save_one(bson, mongo_database, cal_type)
            print(f'{id}')
    mongo.close()
    client.close()
    if log:
        outFile.close()
        sys.stdout = sys.__stdout__




def getUserAndGroup(host, port, user, group):
    """
    Authenticate user and group， return id value，Protect user privacy
    :param host:
    :param port:
    :param user:
    :param group:
    :return: return user_id, group_id
    """
    client = MongoClient(host, port)
    db = client['User']
    user_col = db['user']
    res = user_col.find_one({'user': user})
    if res is None:
        user_id = user_col.insert_one({'user':user}).inserted_id
    else:
        user_id = res['_id']

    group_col = db['group']
    res = group_col.find_one({'group': group})
    if res is None:
        group_id = group_col.insert_one({'group': group}).inserted_id
    else:
        group_id = res['_id']
    return user_id, group_id