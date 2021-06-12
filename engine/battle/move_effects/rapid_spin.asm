BattleCommand_clearhazards:
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_leeched
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextbox
.not_leeched

	ld hl, wPlayerScreens
	ld de, wPlayerWrapCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_wrap
	ld hl, wEnemyScreens
	ld de, wEnemyWrapCount
.got_screens_wrap
	ld a, [hl]
	and MASK_ENTRY_HAZARDS
	and a
	jr z, .no_hazards
	ld a, [hl]
	and $ff - MASK_ENTRY_HAZARDS
	ld [hl], a
	ld hl, ClearedHazardsText
	push de
	call StdBattleTextbox
	pop de
.no_hazards
	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp StdBattleTextbox
