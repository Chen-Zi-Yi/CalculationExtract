#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@Project    : CalculationExtract-main 
@File       : oqmd_parser.py
@IDE        : PyCharm 
@Author     : zychen@cnic.cn
@Date       : 2024/10/15 18:09 
@Description: 
"""
import json

from db.sql.conn import SQL
from public.calculation_type import CalType
from public.composition import Composition
from public.lattice import Lattice
from public.sites import Atom, Site
from public.structure import Structure


class OQMD_Parser:
    def __init__(self, calculation, client: SQL):
        self.client = client

        cal_type = CalType.StaticCalculation
        label = calculation[2]
        input_id = calculation[7]
        output_id = calculation[9]
        parameters = calculation[8]
        total_energy = calculation[10]
        energy_pa = calculation[11]
        composition_id = calculation[5]
        band_gap = calculation[15]
        if 'relax' in label:
            cal_type = CalType.GeometryOptimization
        elif 'static' in label:
            cal_type = CalType.StaticCalculation
        elif 'band' in label:
            cal_type = CalType.BandStructure
        elif 'dos' in label:
            cal_type = CalType.DensityOfStates
        elif 'elastic' in label:
            cal_type = CalType.ElasticProperties
        elif 'dielectric' in label:
            cal_type = CalType.DielectricProperties
        elif 'magnetic' in label:
            cal_type = CalType.MagneticProperties
        else:
            cal_type = CalType.StaticCalculation

        # 输入结构，输出结构
        self.input_structure = self.getStructure(input_id, composition_id)
        self.output_structure = self.getStructure(output_id, composition_id)
        parameters = parameters.replace('\'', '\"')
        parameters = parameters.replace('False', 'false')
        parameters = parameters.replace('True', 'true')
        print(parameters)
        self.parameters = json.loads(parameters)
        self.energy = total_energy
        self.energy_pa = energy_pa
        self.cal_type = cal_type
        self.band_gap = band_gap



    def getStructure(self, input_id, composition_id):
        if input_id is None:
            return None
        structure = self.client.query(f"select * from structures where id = {input_id}")[0]
        atoms = self.client.query(
            f"select a.*, e.z,e.mass from atoms as a left join elements as e on a.element_id = e.symbol where a.structure_id = {input_id}")
        atoms_count = {}
        atoms_mass = {}
        atoms_num = {}
        compositions = []
        sites = []
        for atom in atoms:
            symbol = atom[3]
            atoms_count[symbol] = atoms_count.get(symbol, 0) + 1
            atoms_mass[symbol] = atom[17]
            atoms_num[symbol] = atom[16]
            x = atom[5]
            y = atom[6]
            z = atom[7]
            force_x = atom[8]
            force_y = atom[9]
            force_z = atom[10]
            a = Atom(symbol)
            coords = [x, y, z]
            force = [force_x, force_y, force_z]
            site = Site(coords, a, force, occupancy=atom[14], magmom=atom[11])
            sites.append(site)

        assert len(atoms_count) == len(atoms_mass) == len(atoms_num)
        for symbol, count in atoms_count.items():
            compositions.append(Composition(symbol, atoms_num[symbol], atoms_mass[symbol], count))
        lattice_list = [structure[10], structure[11], structure[12], structure[13],
                        structure[14], structure[15], structure[16], structure[17],
                        structure[18]]
        lattice = Lattice(lattice_list)
        _Structure = Structure(lattice, compositions, sites)
        _Structure.setup()
        generalformula = self.client.query(f"select * from compositions where formula = '{composition_id}' ")[0][1]
        _Structure.generalFormula = generalformula
        return _Structure