BattleCommand_checkfuturesight:
; checkfuturesight

	ld hl, wPlayerFutureSightCount
	ld de, wPlayerFutureSightDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyFutureSightCount
	ld de, wEnemyFutureSightDamage
.ok

	ld a, [hl]
	and a
	ret z
	cp 1
	ret nz

	ld [hl], 0
	ld a, [de]
	inc de
	ld [wCurDamage], a
	ld a, [de]
	ld [wCurDamage + 1], a
	ld b, futuresight_command
	jp SkipToBattleCommand

BattleCommand_futuresight:
; futuresight

	call CheckUserIsCharging
	jr nz, .AlreadyChargingFutureSight
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
.AlreadyChargingFutureSight:
	ld hl, wPlayerFutureSightCount
	ld de, wPlayerFutureSightMode
	ldh a, [hBattleTurn]
	and a
	jr z, .GotFutureSightCount
	ld hl, wEnemyFutureSightCount
	ld de, wEnemyFutureSightMode
.GotFutureSightCount:
	ld a, [hl]
	and a
	jr nz, .failed
	ld a, 4
	ld [hl], a
	ld a, b
	ld [de], a
	call BattleCommand_lowersub
	call BattleCommand_movedelay
	call .ShowAttackMessage
	call BattleCommand_raisesub
	ld de, wPlayerFutureSightDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .StoreDamage
	ld de, wEnemyFutureSightDamage
.StoreDamage:
	ld hl, wCurDamage
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	inc hl
	inc de
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	jp EndMoveEffect

.failed
	call ResetDamage
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect

.ShowAttackMessage:
	ld a, b
	push bc
	ld bc, FUTURE_SIGHT
	call CompareMove
	pop bc
	ld hl, ForesawAttackText
	jr z, .got_message
	ld hl, DoomDesireText
.got_message
	jp StdBattleTextbox
