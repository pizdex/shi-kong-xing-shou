	const_def

	const script_continue ; $00
scr_cont: MACRO
	db script_continue
ENDM

	const_skip

	const script_delay ; $02
scr_delay: MACRO
	db script_delay
	db \1 ; mask
	db \2 ; delay
ENDM

	const_def $05

	const script_face ; $05
scr_face: MACRO
	db script_face
	db \1 ; facing
ENDM

	const_def $09

	const script_end ; $09
scr_end: MACRO
	db script_end
ENDM

	const_def $0c

	const script_setmap ; $0c
scr_setmap: MACRO
	db script_setmap
	db \1 ; map
	db \2 ; entrance?
ENDM

	const_def $0f

	const script_move ; $0f
scr_move: MACRO
	db script_move
	dw \1 ; movement data
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
	db \1 ; unknown
	db \2 ; emote
ENDM

	const_def $1f

	const script_1f ; $1f
scr_1f: MACRO
	db script_1f
	db \1
ENDM

	const_def $5e

	const script_5e ; $5e
scr_5e: MACRO
	db script_5e
	db \1 ; follower
ENDM
