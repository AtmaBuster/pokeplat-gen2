GetMoveAttribute::
; Return attribute a of move l in a; clobbers hl.
; Replaces the old GetMoveAttr (renamed to avoid confusion).
	sub 1
	push bc
	ld c, a
	ld a, l
	jr c, .done
	call GetMoveAddress
	ld b, 0
	add hl, bc
	call GetFarByte
.done
	pop bc
	ret

GetMoveAddress::
; Get the far address for move a's attributes in a:hl.
; This structure will not contain the animation byte! All MOVE_* constants must be reduced by 1 when indexing.
	push bc
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, Moves
	ld a, BANK(Moves)
	call LoadIndirectPointer
	pop bc
	ret

GetMoveData::
; Copy move struct a to de.
	ld [de], a
	inc de
	call GetMoveAddress
	ld bc, MOVE_LENGTH - 1
	jp FarCopyBytes

IsStatusMove::
; returns carry if move a is a status move
; preserves all registers
	ldh [hBuffer2], a
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop hl
	and CATEGORY_MASK
	cp STATUS
	ldh a, [hBuffer2]
	ccf
	ret

IsHealingMove::
	ldh [hBuffer2], a
	push hl
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	pop hl
	cp EFFECT_HEAL
	ret z
	cp EFFECT_LUNAR_DANCE
	ret z
	cp EFFECT_HEALING_WISH
	ret z
	cp EFFECT_MOONLIGHT
	ret z
	cp EFFECT_MORNING_SUN
	ret z
	cp EFFECT_SYNTHESIS
	ret z
	cp EFFECT_HEAL
	ret

IsGravityMove::
	ldh [hBuffer2], a
	push hl
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	pop hl
	cp EFFECT_BOUNCE
	ret z
	cp EFFECT_FLY
	ret z
	cp EFFECT_SPLASH
	ret z
	cp EFFECT_MAGNET_RISE
	ret z
	cp EFFECT_JUMP_KICK
	ret
