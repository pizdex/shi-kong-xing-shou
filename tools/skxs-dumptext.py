#!/usr/bin/python3

chars = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

file = "../shi_kong_xing_shou.gbc"

for line in open("../charmap.asm"):
    # Get charset
    if line.startswith("NEWCHARMAP"):
        charset = int(line[18])

    if line.startswith("\tcharmap "):
        line = line[9:].split(";")[0].split(",")
        if len(line) != 2:
            continue

        char = line[0].strip()[1:-1]
        byte = int(line[1].strip()[1:], 16)

        # Remove duplicates in tuple
        if byte not in chars:
            chars[charset][byte] = char

file = open(file, "rb")
file.seek(0x20542)

def print_text():
    global backup_charset
    done = 0
    while True:
        byte = int.from_bytes(file.read(1), "little")
        if not byte:
            break

        byte_high, new_charset = divmod(byte, 0x10)
        if byte_high == 0xf:
            backup_charset = new_charset
            byte = int.from_bytes(file.read(1), "little")
            char = chars[new_charset][byte]
            print(char, end="")
        elif byte == 0xe2:
            done = 1
            print("\";\ndone;")
            break
        elif byte == 0xec:
            print("\";\npara \"", end="")
        elif byte == 0xed:
            print("\";\nline \"", end="")
        else:
            char = chars[backup_charset][byte]
            print(char, end="")
        
    return done

count = 5

while count != 0:
    byte = int.from_bytes(file.read(1), "little")
    # print("{:02x}".format(byte))
    if not byte:
            print("not byte")
            break

    # get nybbles from byte
    byte_high, charset = divmod(byte, 0x10)
    backup_charset = charset
    if byte == 0xe0:
        arg1 = int.from_bytes(file.read(1), "little")
        arg2 = int.from_bytes(file.read(1), "little")
        print("init $%02x, $%02x; # TEMP" % (arg1, arg2))
    if byte_high == 0xf:
        count -= 1
        print("text \"", end="")
        if print_text():
            print()
        else:
            print("\"")

file.close()
