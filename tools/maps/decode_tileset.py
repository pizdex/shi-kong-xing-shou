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
get_address = lambda a, b: "gfx_%03x_%04x" % loc2addr(a + ((b-1)*0x4000))
has_label = lambda a: "Tileset_%03x_%04x" % loc2addr(a.tell())

with open("baserom.gbc", "rb") as baserom:
	start = sys.argv[1]
	baserom.seek(determine_address(start))
	
	print(f'{has_label(baserom)}:')
	bank = get_number(baserom, 1)
	
	while bank != 255:
		vram = get_number(baserom, 2)
		byte = get_number(baserom, 2)
		src_ = get_number(baserom, 2)
		
		print(f'\ttileset_fragment {get_address(src_, bank)}, ${hex(vram)[2:]}, ${hex(byte)[2:]}')
		
		bank = get_number(baserom, 1)
	
	print(f'\tend_tileset')
	print(f'; {hex(baserom.tell())}')
