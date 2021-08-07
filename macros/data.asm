; Borrowed from pret/pokegold

dr: MACRO
	INCBIN "baserom.gbc", \1, \2 +- \1
ENDM

lb: MACRO ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

ln: MACRO ; r, hi, lo
	ld \1, ((\2) & $f) << 4 | ((\3) & $f)
ENDM


; Constant data (db, dw, dl) macros

dwb: MACRO
	dw \1
	db \2
ENDM

dbw: MACRO
	db \1
	dw \2
ENDM

dbbw: MACRO
	db \1, \2
	dw \3
ENDM

dbww: MACRO
	db \1
	dw \2, \3
ENDM

dbwww: MACRO
	db \1
	dw \2, \3, \4
ENDM

dn: MACRO ; nybbles
rept _NARG / 2
	db ((\1) << 4) | (\2)
	shift 2
endr
ENDM

dc: MACRO ; "crumbs"
rept _NARG / 4
	db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
	shift 4
endr
ENDM

dx: MACRO
x = 8 * ((\1) - 1)
rept \1
	db ((\2) >> x) & $ff
x = x - 8
endr
ENDM

dt: MACRO ; three-byte (big-endian)
	dx 3, \1
ENDM

dd: MACRO ; four-byte (big-endian)
	dx 4, \1
ENDM

bigdw: MACRO ; big-endian word
	dx 2, \1 ; db HIGH(\1), LOW(\1)
ENDM

dba: MACRO ; dbw bank, address
rept _NARG
	dbw BANK(\1), \1
	shift
endr
ENDM

dab: MACRO ; dwb address, bank
rept _NARG
	dwb \1, BANK(\1)
	shift
endr
ENDM

bcd: MACRO
rept _NARG
	dn ((\1) % 100) / 10, (\1) % 10
	shift
endr
ENDM

sine_table: MACRO
; \1 samples of sin(x) from x=0 to x<32768 (pi radians)
x = 0
rept \1
	dw (sin(x) + (sin(x) & $ff)) >> 8 ; round up
x = x + DIV(32768, \1) ; a circle has 65536 "degrees"
endr
ENDM

dsprite: MACRO
; \1 y tile
; \2 y pxl
; \3 x tile
; \4 x pxl
; \5 tile number
; \6 flags + attributes
	db LOW(\1 * 8) + \2
	db LOW(\3 * 8) + \4
	db \5, \6
ENDM
