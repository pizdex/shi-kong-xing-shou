	const_def $05

	const script_face ; $05
scr_face: MACRO
	db script_face
	db \1 ; facing
ENDM

	const_def $14

	const script_text ; $14
scr_text: MACRO
	db script_text
	dw \1 ; text
ENDM
