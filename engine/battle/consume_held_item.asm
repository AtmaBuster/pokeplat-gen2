ConsumeHeldItem:
	push hl
	push de
	push bc
	ldh a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Item
	ld bc, wEnemyRecycleMemory
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
	jr z, .theirturn
	ld hl, wPartyMon1Item
	ld bc, wPlayerRecycleMemory
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]

.theirturn
	push hl
	ld h, 0
	ld l, a
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	push hl
	push af
	push bc
	ld a, [de]
	ld b, a
	farcall GetItemHeldEffect
	ld hl, ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop bc
	pop af
	pop hl
	pop bc
	pop de
	pop hl
	ret

.ok	
	pop bc
	ld a, [de]
	ld [bc], a
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ldh a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], NO_ITEM

.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/battle/held_consumables.asm"
