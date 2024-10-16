#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : CalculationExtract-main 
@File       : oqmd.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2024/10/15 20:44 
@Description: 
"""
import time

from i_o.oqmd.oqmd_parser import OQMD_Parser


class OQMD:
    def __init__(self, parser: OQMD_Parser, user, group):
        self.parser = parser
        work_time = time.strftime("%Y-%m-%d %H:%M:%S")
        thermo_dynamic_properties = {
            'TotalEnergy': self.parser.energy,
            'FermiEnergy': 'N/A',
            'EnergyPerAtom': self.parser.energy_pa,
            'FormationEnergy': 'N/A'
        }
        band_gap = self.parser.band_gap
        properties = {
            'ThermodynamicProperties': thermo_dynamic_properties,
            'BandGap': band_gap
        }
        self.basicDoc = {
                'InputStructure': self.parser.input_structure.to_bson(),
                'OutputStructure': self.parser.output_structure.to_bson(),
                'Parameters': self.parser.parameters,
                'Software': {},
                'StartTime': {},
                'ResourceUsage': {},
                'ProcessData': {},
                'Properties': properties,
                'Files': ['OQMD DB'],
                'User': {
                    'user': user,
                    'group': group
                },
                'DataCreated': work_time,
                'CalculationType': self.parser.cal_type,
            }
