Func_01e_4000::
	dr $78000, $78083

Func_01e_4083::
	dr $78083, $78125

Func_01e_4125::
	dr $78125, $78194

Func_01e_4194::
	dr $78194, $781bf

Func_01e_41bf::
	dr $781bf, $781e8

Func_01e_41e8::
	dr $781e8, $78266

Func_01e_4266::
	dr $78266, $78275

Func_01e_4275::
	ld l, d
	ld h, 0
	ld de, unk_01e_4ec3
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_0b65
	ret

Func_01e_4284:
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wd0c1], a
	ret

Func_01e_4290::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wdce8], a
	and $0f ; ?
	ld l, a
	ld h, 0
	ld de, TypeNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $3c
	ld [wd08b], a
	ld a, $40
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	call Func_0b65
	ret

Func_01e_42ba:
	dr $782ba, $782e4

Func_01e_42e4:
	ld l, d
	ld a, d ; @bad
	ld h, 0
	ld de, unk_01e_551f
	add hl, de
	ld a, [hl]
	ld [wd8ff], a
	ret

Func_01e_42f1:
	dr $782f1, $7831f

Func_01e_431f::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c3]
	sla a
	sla a
	add $80
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $0f
	or $80
	ld d, a
	ld bc, $40
	call CopyBytesVRAM
	ret

Func_01e_434d:
	dr $7834d, $787fb

Func_01e_47fb:
	dr $787fb, $78ec3

unk_01e_4ec3:
	dr $78ec3, $7947f

INCLUDE "data/monsters/menu_icons.asm"

unk_01e_551f:
	dr $7951f, $795ae

TypeNames:
	dw text_1e_55c0
	dw text_1e_55c3
	dw text_1e_55c6
	dw text_1e_55c9
	dw text_1e_55cc
	dw text_1e_55cf
	dw text_1e_55d2
	dw text_1e_55d5
	dw text_1e_55d8

INCLUDE "data/text/mon_types.asm"

INCLUDE "data/icon_pointers.asm"

PointerTable_01e_57ed:
	dw text_1e_5829
	dw text_1e_582a
	dw text_1e_5836
	dw text_1e_5841
	dw text_1e_584f
	dw text_1e_585f
	dw text_1e_586c
	dw text_1e_5875
	dw text_1e_587d
	dw text_1e_5888
	dw text_1e_5890
	dw text_1e_5898
	dw text_1e_58a5
	dw text_1e_58b1
	dw text_1e_58c1
	dw text_1e_58d4
	dw text_1e_58f0
	dw text_1e_58fb
	dw text_1e_5907
	dw text_1e_591f
	dw text_1e_592c
	dw text_1e_5947
	dw text_1e_595f
	dw text_1e_5971
	dw text_1e_597a
	dw text_1e_598b
	dw text_1e_599b
	dw text_1e_59a9
	dw text_1e_59b7
	dw text_1e_59c4

INCLUDE "data/text/bank1e_misc.asm"

PointerTable_01e_59cc:
	dr $799cc, $79aa0

INCLUDE "data/text/bank1e_misc2.asm"

text_01e_buffer2:
	dr $79c3f, $7af00


SECTION "banknum1e", ROMX[$7fff], BANK[$1e]
	db $1e
