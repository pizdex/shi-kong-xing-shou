#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 covfefe.py [*.map] [coverage.png]

Generate a short overview of the amount of space the disasm covers to stdout.
"""

import sys
from mapreader import MapReader

def main():
    mapfile = sys.argv[1] if len(sys.argv) >= 2 else 'shi_kong_xing_shou.map'

    num_banks = 0x40
    bank_size = 0x4000 # bytes

    r = MapReader()
    with open(mapfile, 'r', encoding='utf-8') as f:
        l = f.readlines()
    r.read_map_data(l)

    default_bank_data = {'sections': [], 'used': 0, 'slack': bank_size}
    for bank in range(num_banks):
        data = r.bank_data['rom bank'].get(bank, default_bank_data)
        
        try:
            last_address = data['sections'][-1]['end'] + 1
        except:
            last_address = 0
        
        last_address = last_address + (bank * bank_size)
        
        if data['slack'] < 1:
            print(f"ROMX ${hex(bank)[2:].zfill(2)} coverage complete")
        else:
            print(f"ROMX ${hex(bank)[2:].zfill(2)}\t{(data['slack']):>5} bytes to go\t{ (bank_size - data['slack']) / bank_size * 100 :>5.2f}%\tContinue from: {hex(last_address)}")
    

if __name__ == '__main__':
    main()
