OAMDMACode:
; This code is defined in ROM, but
; copied to and called from HRAM.
LOAD "OAM DMA", HRAM[$ff80]
hTransferVirtualOAM::
	di
; initiate DMA
	ld a, $c0
	ldh [rDMA], a
; wait for DMA to finish
	ld a, 40
.wait
	dec a
	jr nz, .wait
	ei
	ret
ENDL

WriteOAMDMACodeToHRAM:
	ld bc, hTransferVirtualOAM
	ld hl, OAMDMACode
	ld e, $10
.copy
	ld a, [hli]
	ld [bc], a
	inc bc
	dec e
	jr nz, .copy
	ret
