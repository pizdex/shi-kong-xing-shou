#!/usr/bin/python
#-------------------------------------------------------------------------------
# lexer.py
#
# A generic regex-based Lexer/tokenizer tool.
# See the if __main__ section in the bottom for an example.
#
# Eli Bendersky (eliben@gmail.com)
# This code is in the public domain
# Last modified: August 2010
#-------------------------------------------------------------------------------
import re
import sys

class Token(object):
	""" A simple Token structure.
		Contains the token type, value and position.
	"""
	def __init__(self, type, val, pos):
		self.type = type
		self.val = val
		self.pos = pos

	def __str__(self):
		return '%s(%s) at %s' % (self.type, self.val, self.pos)


class LexerError(Exception):
	""" Lexer error exception.

		pos:
			Position in the input line where the error occurred.
	"""
	def __init__(self, pos):
		self.pos = pos


class Lexer(object):
	""" A simple regex-based lexer/tokenizer.

		See below for an example of usage.
	"""
	def __init__(self, rules, skip_whitespace=True):
		""" Create a lexer.

			rules:
				A list of rules. Each rule is a `regex, type`
				pair, where `regex` is the regular expression used
				to recognize the token and `type` is the type
				of the token to return when it's recognized.

			skip_whitespace:
				If True, whitespace (\s+) will be skipped and not
				reported by the lexer. Otherwise, you have to
				specify your rules for whitespace, or it will be
				flagged as an error.
		"""
		# All the regexes are concatenated into a single one
		# with named groups. Since the group names must be valid
		# Python identifiers, but the token types used by the
		# user are arbitrary strings, we auto-generate the group
		# names and map them to token types.
		#
		idx = 1
		regex_parts = []
		self.group_type = {}

		for regex, type in rules:
			groupname = 'GROUP%s' % idx
			regex_parts.append('(?P<%s>%s)' % (groupname, regex))
			self.group_type[groupname] = type
			idx += 1

		self.regex = re.compile('|'.join(regex_parts))
		self.skip_whitespace = skip_whitespace
		self.re_ws_skip = re.compile('[^\r\n\t\f\v ,]')

	def input(self, buf):
		""" Initialize the lexer with a buffer as input.
		"""
		self.buf = buf
		self.pos = 0

	def token(self):
		""" Return the next token (a Token object) found in the
			input buffer. None is returned if the end of the
			buffer was reached.
			In case of a lexing error (the current chunk of the
			buffer matches no rule), a LexerError is raised with
			the position of the error.
		"""
		if self.pos >= len(self.buf):
			return None
		else:
			if self.skip_whitespace:
				m = self.re_ws_skip.search(self.buf, self.pos)

				if m:
					self.pos = m.start()
				else:
					return None

			m = self.regex.match(self.buf, self.pos)
			if m:
				groupname = m.lastgroup
				tok_type = self.group_type[groupname]
				tok = Token(tok_type, m.group(groupname), self.pos)
				self.pos = m.end()
				return tok

			# if we're here, no rule matched
			raise LexerError(self.pos)

	def tokens(self):
		""" Returns an iterator to the tokens found in the buffer.
		"""
		while 1:
			tok = self.token()
			if tok is None: break
			yield tok


if __name__ == '__main__':
	rules = [
		('#.+',			 'COMMENT'),
		(';|:',			   'END_COMMAND'),
		('@org',			'ORG'),
		('\((\\.|[^\(\)])*\)',		  'LABEL'),
		('textmap', 'TXMAP'),
		('text',			'TX_TEXT'),
		('line',			'TX_LINE'),
		('para',			'TX_PARA'),
		('cont',			'TX_CONT'),
		('init',       'TX_INIT'),
		('done',			 'TX_END'),
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

	lx = Lexer(rules, skip_whitespace=True)
	with open(sys.argv[1], 'r') as f:
		lx.input(f.read())

	command_buffer = []
	char_set = -999
	prev_char_set = char_set
	buf = ""
	try:
		for tok in lx.tokens():
			if tok.type == 'COMMENT':
				print(f';{tok.val[1:]}')
				command_buffer = []
			elif tok.type == 'END_COMMAND':
				p = [x.type for x in command_buffer]
				q = [x.val for x in command_buffer]
				if p[0] == 'TX_INIT':
					print(f'\ttext_init {", ".join(q[1:])}')
				if p == ['ORG', 'DECIMAL_NUMBER', 'DECIMAL_NUMBER']:
					print(f'\ntext_{"{:02x}".format(int(q[1]))}_{hex(int(q[2]))[2:]}::')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'DECIMAL_NUMBER', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[3][1:-1]}::\t;{"{:02x}".format(int(q[1]))}:{hex(int(q[2]))[2:]}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'DECIMAL_NUMBER', 'HEXADECIMAL_NUMBER']:
					print(f'\ntext_{"{:02x}".format(int(q[1]))}_{q[2][1:]}::')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'DECIMAL_NUMBER', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[3][1:-1]}::\t;{"{:02x}".format(int(q[1]))}:{q[2][1:]}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER']:
					print(f'\ntext_{q[1][1:]}_{hex(int(q[2]))[2:]}::')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[3][1:-1]}::\t;{q[1][1:]}:{hex(int(q[2]))[2:]}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'HEXADECIMAL_NUMBER']:
					print(f'\ntext_{q[1][1:]}_{q[2][1:]}::')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[3][1:-1]}::\t;{q[1][1:]}:{q[2][1:]}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER']:
					print(f'\ntext_{q[1][1:]}::')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[2][1:-1]}::\t;{q[1][1:]}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'DECIMAL_NUMBER']:
					print(f'\ntext_{"{:02x}".format(int(q[1]))}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p == ['ORG', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'\n{q[2][1:-1]}::\t;{"{:02x}".format(int(q[1]))}')
					char_set = -999
					prev_char_set = char_set
					buf = ""
				elif p[0] in ['TX_TEXT', 'TX_LINE', 'TX_PARA', 'TX_CONT', 'TXMAP']:
					if p[0] == 'TX_LINE':
						print('\tline')
						char_set = -999
						prev_char_set = char_set
					if p[0] == 'TX_PARA':
						print('\tpara')
						char_set = -999
						prev_char_set = char_set
					if p[0] == 'TX_CONT':
						print('\tcont')
						char_set = -999
						prev_char_set = char_set
					if p[0] == 'TXMAP':
						char_set = q[2]
						if char_set == prev_char_set:
							print(f'\ttext "{q[1][1:-1]}"')
						else:
							print(f'\ttext "{q[1][1:-1]}, {char_set}"')
					else:
						if len(p) > 1:
							for i in q[1][1:-1]:
								for s in charsets:
									if i in charsets[s]:
										char_set = s
										if char_set != prev_char_set:
											if buf != "":
												print(f'\ttext "{buf}"')
											print(f'\ttext "{i}", {s}')
											prev_char_set = char_set
											buf = ""
										else:
											buf += i
				elif p[0] == 'TX_END':
					if buf != "":
						print(f'\ttext "{buf}"')
					print('\tdone')
				command_buffer = []
			else:
				command_buffer.append(tok)
				#print(tok)
	except LexerError as err:
		print('; LexerError at position %s' % err.pos)


