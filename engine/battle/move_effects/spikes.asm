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
	jr z, .failed

; Nothing else stops it from working.

	inc [hl]

	call AnimateCurrentMove2

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	jp FailMove

BattleCommand_stealthrock:
; stealthrock

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerScreens
.asm_3768e

; Fails if already set
	bit SCREENS_STEALTH_ROCK, [hl]
	jr nz, .failed

; Nothing else stops it from working.

	set SCREENS_STEALTH_ROCK, [hl]

	call AnimateCurrentMove2

	ld hl, StealthRockText
	jp StdBattleTextbox

.failed
	jp FailMove

BattleCommand_toxicspikes:
; toxicspikes

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerScreens
.asm_3768e

; Fails if 2 layers of toxic spikes are already down

	ld a, [hl]
	and MASK_TOXIC_SPIKES
	cp TOXIC_SPIKES_2
	jr z, .failed

; Nothing else stops it from working.

	ld a, [hl]
	add TOXIC_SPIKES_1
	ld [hl], a

	call AnimateCurrentMove2

	ld hl, ToxicSpikesText
	jp StdBattleTextbox

.failed
	jp FailMove
