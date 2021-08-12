	const_def

	const script_continue ; $00
scr_cont: MACRO
	db script_continue
ENDM

	const script_01 ; $01
scr_01: MACRO
	db script_01
	db \1 ; sprite ID?
	db \2 ; facing
ENDM

	const script_delay ; $02
scr_delay: MACRO
	db script_delay
	db \1 ; mask
	db \2 ; delay
ENDM

	const script_03 ; $03
scr_03: MACRO
	db script_03
ENDM

	const script_04 ; $04
scr_04: MACRO
	db script_04
	dw \1
ENDM

	const script_face ; $05
scr_face: MACRO
	db script_face
	db \1 ; facing
ENDM

	const script_06 ; $06
scr_06: MACRO
	db script_06
	db \1
	db \2
ENDM

	const script_07 ; $07
scr_07: MACRO
	db script_07
ENDM

	const script_08 ; $08
scr_08: MACRO
	db script_08
	db \1
ENDM

	const script_end ; $09
scr_end: MACRO
	db script_end
ENDM

	const script_checkbit ; $0a
scr_checkbit: MACRO
	db script_checkbit
	dw \1
	db \2
	dw \3
ENDM

	const script_setbit ; $0b
scr_setbit: MACRO
	db script_setbit
	dw \1
	db \2
ENDM

	const script_setmap ; $0c
scr_setmap: MACRO
	db script_setmap
	db \1 ; map
	db \2 ; entrance?
ENDM

	const script_0d ; $0d
scr_0d: MACRO
	db script_0d
	dw \1
ENDM

	const script_0e ; $0e
scr_0e: MACRO
	db script_0e
ENDM

	const script_move ; $0f
scr_move: MACRO
	db script_move
	dw \1 ; movement data
ENDM

	const script_10 ; $10
scr_10: MACRO
	db script_10
ENDM

	const_def $14

	const script_text ; $14
scr_text: MACRO
	db script_text
	dw \1 ; text
ENDM

	const script_emote ; $15
scr_emote: MACRO
	db script_emote
	db \1 ; sprite?
	db \2 ; emote
ENDM

	const_def $1a

	const script_1a ; $1a
scr_1a: MACRO
	db script_1a
	db \1, \2, \3, \4
ENDM

	const script_1b ; $1b
scr_1b: MACRO
	db script_1b
	db \1
ENDM

	const script_1c ; $1c
scr_1c: MACRO
	db script_1c
	db \1
ENDM

	const_def $1f

	const script_1f ; $1f
scr_1f: MACRO
	db script_1f
	db \1
ENDM

	const_def $2a

	const script_farjump ; $2a
scr_farjump: MACRO
	db script_farjump
	dba \1
ENDM

	const_def $34

	const script_34 ; $34
scr_34: MACRO
	db script_34
	db \1 ; cutscene
	db \2 ; map number
	db \3 ; warp number
ENDM
	const script_35 ; $35
scr_35: MACRO
	db script_35, \1
ENDM
	const script_36 ; $36
scr_36: MACRO
	db script_36
ENDM

	const script_37 ; $37
scr_37: MACRO
	db script_37
ENDM

	const_def $3b

	const script_3b ; $3b
scr_3b: MACRO
	db script_3b
	dw \1
ENDM

	const_def $44

	const script_44 ; $44
scr_44: MACRO
	db script_44
ENDM

	const_def $48

	const script_48 ; $48
scr_48: MACRO
	db script_48
	db \1
	db \2
ENDM

	const_def $4a

	const script_4a ; $4a
scr_4a: MACRO
	db script_4a
	db \1
ENDM

	const_def $4d

	const script_4d ; $4d
scr_4d: MACRO
	db script_4d
	db \1, \2
ENDM

	const script_4e ; $4e
scr_4e: MACRO
	db script_4e
	db \1
	dw \2
ENDM

	const_def $5e

	const script_5e ; $5e
scr_5e: MACRO
	db script_5e
	db \1 ; follower
ENDM

	const_def $61

	const script_61 ; $65
scr_61: MACRO
	db script_61
	db \1
ENDM

	const_def $62

	const script_62 ; $62
scr_62: MACRO
	db script_62
	db \1, \2
ENDM

	const script_63 ; $63
scr_63: MACRO
	db script_63
	db \1
ENDM

	const_def $65

	const script_65 ; $65
scr_65: MACRO
	db script_65
	db \1
ENDM
