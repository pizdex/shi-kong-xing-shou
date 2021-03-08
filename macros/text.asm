textset: MACRO
db ($f0 | \1)
SETCHARMAP charmap\1
db \2
ENDM

TX_END EQU $ed
