Func_00a_4000::
	dr $28000, $2805b

unk_00a_405b:
	ld c, 8
	xor a
.asm_405e
	ld [hli], a
	dec c
	jr nz, .asm_405e
	ret

unk_00a_4063::
	dr $28063, $280b3

Func_00a_40b3::
	dr $280b3, $280f9

unk_00a_40f9:
	dr $280f9, $28145

unk_00a_4145:
	dr $28145, $28178

Func_00a_4178::
	dr $28178, $282db

unk_00a_42db:
	dr $282db, $285ce

Func_00a_45ce:
	ld a, [$d08e]
	cp $03
	jr nz, .asm_45e1

	ld hl, $dd18
	ld a, [hl]
	cp $80
	jr nz, .asm_45e1

	ld a, $2b
	jr .asm_45e4

.asm_45e1:
	ld a, [$d08e]

.asm_45e4:
	ld bc, $d86a
	ld de, unk_00a_45fb
	inc a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_45f3
	ld a, [hli]
	ld [bc], a
	inc bc
	cp $ed
	jr nz, .asm_45f3
	ret

unk_00a_45fb::
	dw unk_00a_46b3
	dw unk_00a_46b8
	dw unk_00a_46bf
	dw unk_00a_46c6
	dw unk_00a_46cd
	dw unk_00a_46d3
	dw $46da
	dw $46e1
	dw $46e8
	dw $46ef
	dw $46f6
	dw $46fd
	dw $4703
	dw $4709
	dw $470e
	dw $4715
	dw $471b
	dw $4720
	dw $4727
	dw $472e
	dw $4735
	dw $473c
	dw $4742
	dw $4749
	dw $4750
	dw $4757
	dw $475e
	dw $4765
	dw $476c
	dw $4773
	dw $477a
	dw $4781
	dw $4788
	dw $478e
	dw $4795
	dw $479c
	dw $47a3
	dw $47aa
	dw $47b1
	dw $47b7
	dw $47bd
	dw $47c3
	dw $47ca
	dw $47d3
	dw $47da
	dw $47e1
	dw $47e8
	dw $47ef
	dw $47f6
	dw $47fd
	dw $4804
	dw $480a
	dw $4811
	dw $4818
	dw $481f
	dw $4826
	dw $482d
	dw $4834
	dw $483b
	dw $4842
	dw $4849
	dw $4850
	dw $4857
	dw $485e
	dw $4865
	dw $486b
	dw $4872
	dw $4878
	dw $487f
	dw $4886
	dw $488c
	dw $4893
	dw $489a
	dw $48a1
	dw $48a7
	dw $48ae
	dw $48b5
	dw $48bc
	dw $48c3
	dw $48ca
	dw $48d1
	dw $48d7
	dw $48de
	dw $48e5
	dw $48eb
	dw $48f2
	dw $48f9
	dw $4900
	dw $4907
	dw $490e
	dw $4915
	dw $491c

unk_00a_46b3::
	dr $286b3, $286b8

unk_00a_46b8::
	; $f0, $16, $f4, $23, $f1, $c6, $ed
	textset "巴", 0
	textset "洛", 4
	textset "特", 1
	db TX_LINE

unk_00a_46bf::
	dr $286bf, $286c6

unk_00a_46c6::
	dr $286c6, $286cd

unk_00a_46cd::
	dr $286cd, $286d3

unk_00a_46d3::
	dr $286d3, $28923


SECTION "banknum0a", ROMX[$7fff], BANK[$0a]
	db $0a
