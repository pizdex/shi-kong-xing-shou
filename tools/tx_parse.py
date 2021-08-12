#!/usr/bin/python3

import re
import sys

tokens = [
	('#.+',			 'COMMENT'),
	(';|:',			   'END_COMMAND'),
	(',',			   'SEP'),
	('@org',			'ORG'),
	('\((\\.|[^\(\)])*\)',		  'LABEL'),
	('textmap', 'TXMAP'),
	('forcemap', 'FORCEMAP'),
	('text',			'TX_TEXT'),
	('para',			'TX_PARA'),
	('line',			'TX_LINE'),
	('cont',			'TX_CONT'),
	('init',			'TX_INIT'),
	('signpost',		'TX_SIGN'),
	('done',			'TX_END'),
	('\d+',			 'DECIMAL_NUMBER'),
	('\$[0-9a-fA-F]+',  'HEXADECIMAL_NUMBER'),
	('\"(\\.|[^\"])*\"|\'(\\.|[^\'])*\'',	 'STRING'),
	('\w+',			 'IDENTIFIER'),
]

# populate the charmap
charsets = {}
with open("charmap.asm", "r") as charmap:
	ccm = -999
	x = charmap.readline()
	while x:
		if re.match(r'\s{0,}NEWCHARMAP\s+charmap(\d+)', x):
			ccm = re.match(r'\s{0,}NEWCHARMAP\s+charmap(\d+)', x).group(1)
		if re.match(r'\s{0,}charmap\s+\"(\\.|[^\"])*\"', x):
			if ccm not in charsets.keys():
				charsets[ccm] = ""
			charsets[ccm] += re.match(r'\s{0,}charmap\s+\"(\\.|[^\"])*\"', x).group(1)
		x = charmap.readline()

with open(sys.argv[1], "r") as h:
	tt = h.read()

ws = re.compile('\s{0,}')
p = ws.match(tt).end(0)
t = []
char_set = -999
prev_char_set = char_set
while p < len(tt):
	match = None
	for token in tokens:
		pattern, ident = token
		match = re.compile(f'({pattern})').match(tt, p)
		if match:
			#print(match, match.end(0))
			p = match.end(0)
			p = ws.match(tt, p).end(0)
			t.append((ident, match))

b = []
for l in t:
	ident, match = l
	if ident == 'END_COMMAND':
		#print(b)
		comm = b[0][0]
		
		if comm == 'ORG':
			char_set = -999
			prev_char_set = char_set
			bank = b[1][1][1]
			address = b[3][1][1]
			for q in b[1:]:
				if q[0] == 'DECIMAL_NUMBER':
					label = ("text_%s_%s" % (bank[1:].zfill(2), address[1:].zfill(4)))
				elif q[0] == 'HEXADECIMAL_NUMBER':
					label = ("text_%s_%s" % (bank[1:].zfill(2), address[1:].zfill(4)))
				elif q[0] == 'LABEL':
					label = q[1].group(1)[1:-1]
			print(f'\n{label}::')
			
		elif comm == 'TX_INIT':
			ll = []
			for q in b[1:]:
				if q[0] in ['IDENTIFIER', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER']:
					ll.append(q[1].group(1))
			print(f'\ttext_init {", ".join(ll)}')
			
		elif comm in ['TX_TEXT', 'TX_PARA', 'TX_LINE', 'TX_CONT']:
			p = ""
			tx_sets = []
			if comm in ['TX_PARA', 'TX_LINE', 'TX_CONT']:
				char_set = -999
				prev_char_set = char_set
			if comm == 'TX_PARA':
				print('\tpara')
			if comm == 'TX_LINE':
				print('\tline')
			if comm == 'TX_CONT':
				print('\tcont')
			for q in b[1:]:
				if q[0] == 'STRING':
					p = ""
					for i in q[1].group(1)[1:-1]:
						for ci in charsets:
							if i in charsets[ci]:
								char_set = ci
								if char_set != prev_char_set:
									if p: tx_sets.append((p, None))
									tx_sets.append((i, char_set))
									prev_char_set = char_set
									p = ""
								else:
									p += i
			if p: tx_sets.append((p, None))
			for ii in tx_sets:
				print(f'\ttext "{ii[0]}"', end="")
				if ii[1]:
					print(f', {ii[1]}')
				else:
					print()
		
		elif comm == 'TXMAP':	# manual textmap override
			strr = ""
			cset = 0
			for q in b[1:]:
				if q[0] == 'STRING':
					strr = q[1].group(1)[1:-1]
				elif q[0] == 'DECIMAL_NUMBER':
					cset = int(q[1].group(1))
			print(f'\ttext "{strr}"', end="")
			if int(cset) != int(char_set):
					print(f', {cset}')
			else:
				print()
		
		elif comm == 'TX_END':
			print(f'\tdone')
		
		elif comm == 'TX_SIGN':
			print(f'\ttext_sign')
			
		elif comm == 'FORCEMAP':
			strr = ""
			cset = 0
			for q in b[1:]:
				if q[0] == 'STRING':
					strr = q[1].group(1)[1:-1]
				elif q[0] == 'DECIMAL_NUMBER':
					cset = int(q[1].group(1))
			print(f'\ttext "{strr}", {cset}')
		
		else:
			#print(b)
			print()
		b = []
	elif ident == 'COMMENT':
		print(f'; {match.group(1)}')
	else:
		b.append(l)
