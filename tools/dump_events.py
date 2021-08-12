#!/usr/bin/python3

import sys
import re

def determine_address(s):
# Takes both GB addresses (e.g. 02:4006)
# and ROM addresses (e.g. 8006)
	rom_addr = re.match('([0-9a-fA-F]{2}):([0-9a-fA-F]{4})', s)
	
	if rom_addr:
		bank = int(rom_addr.group(1), 16)
		addr = int(rom_addr.group(2), 16)
		if bank > 0:
			addr -= 0x4000
		return (bank * 0x4000) + addr
	else:
		return int(s, 16)

def loc2addr(n):
	bank, addr = divmod(n, 0x4000)
	if bank > 0:
		addr += 0x4000
	return (bank, addr)

def print_events(file):
	done = 0
	while True:
		byte = int.from_bytes(file.read(1), "little")

		if byte == 0xff:
			print('\tdb -1')
			done = 1
			break
		else:
			x = byte
			if x == 0xee:
				x = "ABSOLUTE"
			
			y = int.from_bytes(file.read(1), "little")
			if y == 0xee:
				y = "ABSOLUTE"
			
			ev_type = int.from_bytes(file.read(1), "little")
			param_1 = int.from_bytes(file.read(1), "little")
			param_2 = int.from_bytes(file.read(1), "little")
			param_3 = int.from_bytes(file.read(1), "little")
			
			if ev_type == 0x00:
				print(f'\twarp_event {x}, {y}', end='')
				print(', $%02x, $%02x, $%02x ; TEMP' %
					(param_1, param_2, param_3))
			elif  ev_type == 0x02:
				print(f'\tsignpost_event {x}, {y}', end='')
				print(f', $%02x' %
					(param_1))
			else:
				print(f'\tevent {x}, {y}', end='')
				print(f', $%02x, $%02x, $%02x, $%02x' %
					(ev_type, param_1, param_2, param_3))
			
			
	return done

makelabel = lambda a: "unk_%02x_%04x" % a

with open("../baserom.gbc", "rb") as baserom:
	start = sys.argv[1]
	count = int(sys.argv[2])
	
	baserom.seek(determine_address(start))
	
	while count > 0:
		print(f"{makelabel(loc2addr(baserom.tell()))}::")
		
		if print_events(baserom):
			print()
		count -= 1
