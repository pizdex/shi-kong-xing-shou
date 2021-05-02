#!/usr/bin/env python3
import math


def get_bank_address(offset):
	offset = file.tell()
	bank = math.floor(offset / 0x4000)
	if bank != 0:
		address = (offset - (bank * 0x4000)) + 0x4000
	else:
		address = (offset - (bank * 0x4000))
	return bank, address


file = "../shi_kong_xing_shou.gbc"

offset = int(input("Enter offset: "), 16)
count = int(input("Enter count: "))

file = open(file, "rb")
file.seek(offset)

while count != 0:
	count -= 1
	bank, address = get_bank_address(file.tell())
	print("Script_%03x_%04x:" % (bank, address))
	while True:
		byte = int.from_bytes(file.read(1), "little")

		if byte == 0x00:
			print("\tscr_cont")

		elif byte == 0x01:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_01 $%02x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x02:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_delay $%02x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x03:
			print("\tscr_03")

		elif byte == 0x04:
			arg = int.from_bytes(file.read(2), "little")
			print("\tscr_04 $%04x ; TEMP" % arg)

		elif byte == 0x05:
			arg = int.from_bytes(file.read(1), "little")
			print("\tscr_face $%02x ; TEMP" % arg)

		elif byte == 0x06:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_06 $%02x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x07:
			print("\tscr_07")

		elif byte == 0x08:
			arg = int.from_bytes(file.read(1), "little")
			print("\tscr_08 $%02x ; TEMP" % arg)

		elif byte == 0x09:
			print("\tscr_end")
			print("")
			break

		elif byte == 0x0a:
			arg1 = int.from_bytes(file.read(2), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			arg3 = int.from_bytes(file.read(2), "little")
			print("\tscr_checkbit $%04x, $%02x, $%04x ; TEMP" % (arg1, arg2, arg3))

		elif byte == 0x0b:
			arg1 = int.from_bytes(file.read(2), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_setbit $%04x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x0c:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_setmap $%02x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x0d:
			arg = int.from_bytes(file.read(2), "little")
			print("\tscr_0d $%04x ; TEMP" % arg)

		elif byte == 0x0e:
			print("\tscr_0e")

		elif byte == 0x0f:
			arg = int.from_bytes(file.read(2), "little")
			print("\tscr_move $%04x ; TEMP" % arg)

		elif byte == 0x10:
			print("\tscr_10")

		elif byte == 0x14:
			arg = int.from_bytes(file.read(2), "little")
			print("\tscr_text $%04x ; TEMP" % arg)

		elif byte == 0x15:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			print("\tscr_emote $%02x, $%02x ; TEMP" % (arg1, arg2))

		elif byte == 0x1c:
			arg = int.from_bytes(file.read(1), "little")
			print("\tscr_1c $%02x ; TEMP" % arg)

		elif byte == 0x1f:
			arg = int.from_bytes(file.read(1), "little")
			print("\tscr_1f $%02x ; TEMP" % arg)

		elif byte == 0x34:
			arg1 = int.from_bytes(file.read(1), "little")
			arg2 = int.from_bytes(file.read(1), "little")
			arg3 = int.from_bytes(file.read(1), "little")
			print("\tscr_34 $%02x, $%02x, $%02x ; TEMP" % (arg1, arg2, arg3))

		elif byte == 0x36:
			print("\tscr_36")

		elif byte == 0x37:
			print("\tscr_37")

		elif byte == 0x44:
			print("\tscr_44")

		elif byte == 0x5e:
			arg = int.from_bytes(file.read(1), "little")
			print("\tscr_5e $%02x ; TEMP" % arg)

file.close()
