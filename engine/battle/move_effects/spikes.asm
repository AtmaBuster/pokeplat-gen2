BattleCommand_spikes:
; spikes

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerScreens
.asm_3768e

; Fails if 3 layers of spikes are already down

	ld a, [hl]
	and MASK_SPIKES
	cp SPIKES_3
	ret z

; Nothing else stops it from working.

	inc [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	jp FailMove
