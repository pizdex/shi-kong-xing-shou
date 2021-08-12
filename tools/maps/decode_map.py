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

get_number = lambda x, y: int.from_bytes(x.read(y), byteorder='little')
get_address = lambda a, b: "unk_%03x_%04x" % loc2addr(get_number(a, 2) + (b*0x4000))
has_label = lambda a: "unk_%03x_%04x" % loc2addr(a.tell())

with open("baserom.gbc", "rb") as baserom:
	start = sys.argv[1]
	baserom.seek(determine_address(start))
	for i in range(100):
		this_bank = int(baserom.tell() / 0x4000)-1
		print(f'{has_label(baserom)}:')
		print(f'\tdb {get_number(baserom, 1)}, ', end='')
		print(f'{get_number(baserom, 1)}')
		print(f'\tdw {get_address(baserom, this_bank)}_layout')
		print(f'\tdw {get_address(baserom, this_bank)}_blocks')
		print(f'\tdw {get_address(baserom, this_bank)}_metatiles')
		print(f'\tdw {get_address(baserom, this_bank)}_attrmap')
		print(f'\tdw {get_address(baserom, this_bank)}_palettes')
		print(f'\tdw unk_006_{hex(get_number(baserom, 2))[2:]}')
		print(f'\tdw unk_006_{hex(get_number(baserom, 2))[2:]}')
		print(f'\tdw {hex(get_number(baserom, 2))[2:]}')
		print(f'\tdw {get_address(baserom, this_bank)}_collision')
		print()
	#print(f'; {hex(baserom.tell())}')
	if False:
		print(f'w: {get_number(baserom, 1)}')
		print(f'h: {get_number(baserom, 1)}')
		print(f'layout: {get_address(baserom, this_bank)}')
		print(f'blocks: {get_address(baserom, this_bank)}')
		print(f'mtiles: {get_address(baserom, this_bank)}')
		print(f'attrib: {get_address(baserom, this_bank)}')
		print(f'pallet: {get_address(baserom, this_bank)}')
		print(f'tiset1 (bank6): {hex(get_number(baserom, 2))[2:]}')
		print(f'tiset2 (bank6): 06:{hex(get_number(baserom, 2))[2:]}')
		print(f'unknow: {hex(get_number(baserom, 2))[2:]}')
		print(f'collis: {get_address(baserom, this_bank)}')
