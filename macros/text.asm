textset: MACRO
if _NARG > 1
db ($f0 | \1)
setcharmap charmap\1
db \2
else
db \1
endc
ENDM

	const_def $e0

	const_next $e2

	const TX_END ; $e2
text_end: MACRO
	db TX_END
ENDM

	const_next $ec

	const TX_PARA ; $ec
para: MACRO
	db TX_PARA, \1
ENDM

	const TX_LINE ; $ed
line: MACRO
	db TX_LINE, \1
ENDM
