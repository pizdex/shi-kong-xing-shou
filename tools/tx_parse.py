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
		('text',			'TX_TEXT'),
		('line',			'TX_LINE'),
		('para',			'TX_PARA'),
		('cont',			'TX_CONT'),
		('end',			 'TX_END'),
		('\d+',			 'DECIMAL_NUMBER'),
		('\$[0-9a-fA-F]+',  'HEXADECIMAL_NUMBER'),
		('\"(\\.|[^\"])*\"|\'(\\.|[^\'])*\'',	 'STRING'),
		('\w+',			 'IDENTIFIER'),
	]
	
	charsets = {
		0: " 死之吻狂咬打擊瘋突防禦破碎催眠術煙幕彈百裂巴掌全力一集氣硬化封印忍耐人攻細綁精神中療傷尖叫犧牲勒緊不放電光閃分身熱血正拳石縮小槍刺洗腦拍翅膀偷吃步先發制角致命殺狼嚎潛哀號沉睡疾風護銅牆鐵壁瞄準劍切斬撞刀兩斷靈二流盾勢瞬間手居合蓄鬥·嵐無雙噸摔地獄車必投擲天寒冰烈焰吸收反亂通火炎噴射旋爆炸鳥翼同歸於盡毒濃泡沫雨飄紅強水柱暴海嘯凍東雪黑暗飛砂走落崩挖洞大震殞巨雷閣延頂磁波星法藤鞭樹汁散葉片太陽花寄魂種子香甜孢麻痺粉猛舌頭舔怨恨衝邪惡侵蝕維音魅惑干",
		1: "嗯",
		2: "入這個~"
	}

	lx = Lexer(rules, skip_whitespace=True)
	with open(sys.argv[1], 'r') as f:
		lx.input(f.read())

	command_buffer = []
	char_set = -999
	prev_char_set = char_set
	try:
		for tok in lx.tokens():
			if tok.type == 'COMMENT':
				print(f';{tok.val[1:]}')
				command_buffer = []
			elif tok.type == 'END_COMMAND':
				p = [x.type for x in command_buffer]
				q = [x.val for x in command_buffer]
				if p == ['ORG', 'DECIMAL_NUMBER', 'DECIMAL_NUMBER']:
					print(f'text_{"{:02x}".format(int(q[1]))}_{hex(int(q[2]))[2:]}::')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'DECIMAL_NUMBER', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'{q[3][1:-1]}::\t;{"{:02x}".format(int(q[1]))}:{hex(int(q[2]))[2:]}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'DECIMAL_NUMBER', 'HEXADECIMAL_NUMBER']:
					print(f'text_{"{:02x}".format(int(q[1]))}_{q[2][1:]}::')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'DECIMAL_NUMBER', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'{q[3][1:-1]}::\t;{"{:02x}".format(int(q[1]))}:{q[2][1:]}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER']:
					print(f'text_{q[1][1:]}_{hex(int(q[2]))[2:]}::')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'{q[3][1:-1]}::\t;{q[1][1:]}:{hex(int(q[2]))[2:]}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'HEXADECIMAL_NUMBER']:
					print(f'text_{q[1][1:]}_{q[2][1:]}::')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'{q[3][1:-1]}::\t;{q[1][1:]}:{q[2][1:]}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER']:
					print(f'text_{q[1][1:]}::')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'HEXADECIMAL_NUMBER', 'LABEL']:
					print(f'{q[2][1:-1]}::\t;{q[1][1:]}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'DECIMAL_NUMBER']:
					print(f'text_{"{:02x}".format(int(q[1]))}')
					char_set = -999
					prev_char_set = char_set
				elif p == ['ORG', 'DECIMAL_NUMBER', 'LABEL']:
					print(f'{q[2][1:-1]}::\t;{"{:02x}".format(int(q[1]))}')
					char_set = -999
					prev_char_set = char_set
				elif p[0] in ['TX_TEXT', 'TX_LINE', 'TX_PARA', 'TX_CONT']:
					if p[0] == 'TX_LINE': print('\tdb TX_LINE')
					if p[0] == 'TX_PARA': print('\tdb TX_PARA')
					if p[0] == 'TX_CONT': print('\tdb TX_CONT')
					buf = ""
					buf += f'\ttextset "'
					for i in q[1][1:-1]:
						for s in charsets:
							if i in charsets[s]:
								char_set = s
						if prev_char_set != char_set:
							buf += f'{i}", {char_set}\n\ttextset "'
							prev_char_set = char_set
						else:
							buf += i
					buf += '"'
					buf = buf.replace('\n\ttextset ""', '')
					print(buf)
				elif p[0] == 'TX_END':
					print('\ttext_end')
				command_buffer = []
			else:
				command_buffer.append(tok)
				#print(tok)
	except LexerError as err:
		print('; LexerError at position %s' % err.pos)


