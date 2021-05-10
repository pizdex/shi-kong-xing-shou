Func_0cfa::
	ld a, [_BANKNUM]
	push af
	ld a, $27
	rst Bankswitch
	ld a, [wd9d9]
	call LoadMonPicBank
	ld a, [wd9d9]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, MonsterPicPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld bc, $240
	call Func_0b46
	ld a, [wd08a]
	ld e, a
	call Func_0b46
	ld a, [wd08a]
	ld d, a
	pop hl
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_0d2e::
	ld a, [_BANKNUM]
	push af
	ld a, [wd9e5]
	call LoadMonPicBank
	ld a, [wd9e5]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, MonsterPicPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $240
	ld de, $9440
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_0d52::
	ld a, [_BANKNUM]
	push af
	ld a, [wd9e5]
	call LoadMonPicBank
	ld a, [wd9e5]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, MonsterPicPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $240
	ld de, $90d0
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

LoadMonPicBank::
	cp 28
	jr c, .pics1
	cp 56
	jr c, .pics2
	cp 84
	jr c, .pics3
	cp 112
	jr c, .pics4
	cp 140
	jr c, .pics5

; mon >= 140
	ld a, BANK("Pics 6")
	rst Bankswitch
	ret

.pics1
	ld a, BANK("Pics 1")
	rst Bankswitch
	ret

.pics2
	ld a, BANK("Pics 2")
	rst Bankswitch
	ret

.pics3
	ld a, BANK("Pics 3")
	rst Bankswitch
	ret

.pics4
	ld a, BANK("Pics 4")
	rst Bankswitch
	ret

.pics5
	ld a, BANK("Pics 5")
	rst Bankswitch
	ret

Func_0da2::
	ld a, [_BANKNUM]
	push af

; Switch bank
	ld a, [wEnemyMonSpecies]
	call LoadMonPicBank

; Get address
	ld a, [wEnemyMonSpecies]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, MonsterPicPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Load mon pic into VRAM
	ld bc, $240
	ld de, $9310
	call CopyBytesVRAM_Mirror

	pop af
	rst Bankswitch
	ret

INCLUDE "data/monsters/pic_pointers.asm"
