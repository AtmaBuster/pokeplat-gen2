FarChangeStat:
	push af
	ld a, 2
	ld [wFailedMessage], a
	ld a, b
	inc b
	jr nz, .move_script_byte_ok
	farcall2 ReadMoveScriptByte
.move_script_byte_ok
	ld [wLoweredStat], a
	pop af
	ld b, a
	bit STAT_TARGET_F, b
	jr z, .player
	call HasOpponentFainted
	ret z
	jr z, .not_fainted
.player
	call HasUserFainted
	ret z
.not_fainted
	; check miss
	bit STAT_MISS_F, b
	jr z, .no_miss
	ld a, [wAttackMissed]
	and a
	jr z, .no_miss

	; attack missed
	bit STAT_SILENT_F, b
	ret nz
	call CheckAlreadyFailed
	ret nz
	; failed
	farcall AnimateFailedMove
	farcall GetFailureResultText
	ret

.no_miss
	; check secondary
	bit STAT_SECONDARY_F, b
	jr z, .no_secondary
	ld a, [wEffectFailed]
	and a
	ret nz

.no_secondary
	; do target-only checks
	bit STAT_TARGET_F, b
	jr z, .not_target

	push bc
	farcall CheckSubstituteOpp
	pop bc
	jr z, .check_lowering

	bit STAT_SILENT_F, b
	ret nz
	call CheckAlreadyFailed
	ret nz
	; failed
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret

.check_lowering
	bit STAT_LOWER_F, b
	jr z, .not_lower
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyScreens]
	jr z, .got_screens
	ld a, [wPlayerScreens]
.got_screens
	bit SUBSTATUS_MIST, a
	jr z, .not_lower
	bit STAT_SILENT_F, b
	ret nz
	call CheckAlreadyFailed
	ret nz
	farcall AnimateFailedMove
	ld hl, ProtectedByMistText
	jp StdBattleTextbox

.not_target
.not_lower
	bit STAT_TARGET_F, b
	call nz, BattleCommand_SwitchTurn
	push bc
	bit STAT_LOWER_F, b
	jr nz, .lower
	call DoRaiseStat
	jr .stat_done
.lower
	call DoLowerStat
.stat_done
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	pop bc
	bit STAT_TARGET_F, b
	call nz, BattleCommand_SwitchTurn
	ld a, [wFailedMessage]
	and a
	jr z, .check_anim
	bit STAT_SILENT_F, b
	ret nz
	push bc
	ld c, 60
	call DelayFrames
	pop bc
	ld hl, WontRiseAnymoreText
	ld de, WontDropAnymoreText
	or 1
	jp DoPrintStatChange

.check_anim
	bit STAT_SKIPTEXT_F, b
	ret nz
	bit STAT_SILENT_F, b
	push bc
	jr nz, .anim_done
	; farcall StatUpDownAnim
.anim_done
	pop bc
PrintStatChange:
	call GetStatRaiseMessage
DoPrintStatChange:
	push af
	and a
;	call z, PlayStatChangeAnim
	pop af

	bit STAT_TARGET_F, b
	jr z, .do_print
	push af
	call BattleCommand_SwitchTurn
	pop af
	call .do_print
	jp BattleCommand_SwitchTurn

.do_print
	bit STAT_LOWER_F, b
	jr z, .print_msg
	ld h, d
	ld l, e
	push af
	push bc
	call StdBattleTextbox
	pop bc
	pop af
	bit STAT_TARGET_F,b 
	ret z
	and a
	ret nz
	xor a
	ld [wFailedMessage], a
	ret

.print_msg
	jp StdBattleTextbox

GetStatRaiseMessage:
	ld a, [wLoweredStat]
	and $f0
	swap a
	and a
	ld hl, StatRoseText
	ld de, StatFellText
	ret z
	ld hl, StatRoseSharplyText
	ld de, StatHarshlyFellText
	xor a
	ret

GetStatName:
	ld hl, StatNames
	ld c, "@"
.check_name:
	dec b
	jr z, .copy
.get_name:
	ld a, [hli]
	cp c
	jr z, .check_name
	jr .get_name

.copy:
	ld de, wStringBuffer2
	ld bc, wStringBuffer3 - wStringBuffer2
	call CopyBytes
	ret

INCLUDE "data/battle/stat_names.asm"

DoLowerStat:
	or 1
	jr DoChangeStat
DoRaiseStat:
	xor a
DoChangeStat:
	push af
	xor a
	ld [wFailedMessage], a
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerStatLevels
	jr z, .got_levels
	ld hl, wEnemyStatLevels
.got_levels
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc

	; change stat
	ld a, [wLoweredStat]
	and $f0
	swap a
	inc a
	ld c, a
	pop af
	jr nz, .lower_loop

.raise_loop
	ld a, [hl]
	cp MAX_STAT_LEVEL
	jr z, .stat_change_done
	inc [hl]
	inc b
	dec c
	jr nz, .raise_loop
	jr .stat_change_done

.lower_loop
	ld a, [hl]
	dec a
	jr z, .stat_change_done
	dec [hl]
	inc b
	dec c
	jr nz, .lower_loop

.stat_change_done
	; amount of levels changed in b
	ld a, b
	and a
	jr z, .failed
	dec b
	swap b
	ld a, [wLoweredStat]
	and $f
	or b
	ld [wLoweredStat], a
	ret

.failed
	ld a, 1
	ld [wFailedMessage], a
	ret
