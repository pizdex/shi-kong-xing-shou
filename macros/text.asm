textset: MACRO
if _NARG > 1
	db ($f0 | \2)
	setcharmap charmap\2
	db \1
else
	db \1
endc
ENDM


; Text commands

	const_def $e0

	const TX_INIT ; $e0
text_init: MACRO
; name, face
	db TX_INIT, \1, \2
ENDM

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
