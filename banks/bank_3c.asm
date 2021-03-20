unk_03c_4000:
	dr $f0000, $f00d2

Func_03c_40d2::
	dr $f00d2, $f0343

Func_03c_4343::
	dr $f0343, $f0c74

Func_03c_4c74::
	dr $f0c74, $f2c70


SECTION "banknum3c", ROMX[$7fff], BANK[$3c]
	db $3c
