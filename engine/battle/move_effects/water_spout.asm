BattleCommand_lifepower:
; lifepower
	push bc
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHP
.ok
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, [hl]
	and a
	jr z, .lt256
	ld c, 2
	cp 1
	jr z, .lt512
	ld c, 4
	rrca
	rr b
.lt512
	rrca
	rr b
	; a should be 0
	ld a, c
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
.lt256
	ld a, b
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld d, a
	pop bc
	ret
