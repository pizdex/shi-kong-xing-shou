text: MACRO
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

	const TX_SIGN
text_sign: MACRO
	db TX_SIGN
ENDM

	const TX_END ; $e2
done: MACRO
	db TX_END
ENDM

	const_next $e5

	const TX_GETCHOICE ; $e5
getchoice: MACRO
; address to choice text
	db TX_GETCHOICE
	dw \1
ENDM

	const TX_CHOICE ; $e6
choice: MACRO
	db TX_CHOICE
ENDM

	const_next $ec

	const TX_PARA ; $ec
para: MACRO
if _NARG == 0
	db TX_PARA
else
	db TX_PARA, \1
endc
ENDM

	const TX_LINE ; $ed
line: MACRO
if _NARG == 0
	db TX_LINE
else
	db TX_LINE, \1
endc
ENDM

	const TX_CONT ; $ee
cont: MACRO
if _NARG == 0
	db TX_CONT
else
	db TX_CONT, \1
endc
ENDM


; Menu text commands

	const_def $e4

	const MENUTX_END ; $e4
menu_done: MACRO
	db MENUTX_END
ENDM

	const_next $ed

	const MENUTX_END2 ; $ed
menu_done2: MACRO
	db MENUTX_END2
ENDM
