#!/usr/bin/python3

import sys
import xml.dom.minidom

if len(sys.argv) < 3:
	print('tmx2data.py [input file] [output file]')
	exit()

tmx = xml.dom.minidom.parse(sys.argv[1])

csv = tmx.getElementsByTagName('data')
values = csv[0].firstChild.nodeValue

values = [value.replace('\n','').strip() for value in values.split(',')]

with open(sys.argv[2], 'wb') as out:
	for i in values:
		out.write((int(i)-1).to_bytes(1, byteorder='little'))
