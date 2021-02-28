FarCall_de::
; Call a:de.
; Preserves other registers.

	ldh [hBuffer], a
	ldh a, [hROMBank]
	push af
	ldh a, [hBuffer]
	rst Bankswitch
	call .de
	jr ReturnFarCall

.de
	push de
	ret

FarCall_hl::
; Call a:hl.
; Preserves other registers.

	ldh [hBuffer], a
	ldh a, [hROMBank]
	push af
	ldh a, [hBuffer]
	rst Bankswitch
	call FarJump_hl

ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.

	ld a, b
	ld [wFarCallBCBuffer], a
	ld a, c
	ld [wFarCallBCBuffer + 1], a

; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch

	ld a, [wFarCallBCBuffer]
	ld b, a
	ld a, [wFarCallBCBuffer + 1]
	ld c, a
	ret

FarJump_hl::
	jp hl

FarCall_stack::
	push af ; inc sp * 2
	push af ; inc sp * 2
	push af ; inc sp * 2
	push af
	push bc
	push de
	push hl
	ld hl, sp+14
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	dec hl
	ldh a, [hROMBank]
	ldd [hl], a
	dec hl
	ld [hl], HIGH(FarCallReturn_stack)
	dec hl
	ld [hl], LOW(FarCallReturn_stack)
	dec hl
	dec de
	ld a, [de]
	dec de
	ld [hld], a
	ld a, [de]
	dec de
	ld [hl], a
	ld a, [de]
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	pop hl
	pop de
	pop bc
	pop af
	ret

FarCallReturn_stack:
	ldh [hBuffer], a
	pop af
	rst Bankswitch
	ldh a, [hBuffer]
	ret
