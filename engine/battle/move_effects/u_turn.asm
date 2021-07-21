BattleCommand_uturn:
	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	farcall CheckAnyOtherAlivePartyMons
	jp z, FailedUTurn

	call UpdateBattleMonInParty

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu_NoLoop

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call UTurn_LinkPlayerSwitch

	ld hl, PassedBattleMonEntrance
	call CallBattleCore2

	call ResetUTurnStatusPlayer
	ret

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedUTurn

	farcall CheckAnyOtherAliveEnemyMons
	jp z, FailedUTurn

	call UpdateEnemyMonInParty
	call UTurn_LinkEnemySwitch

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore2
	ld hl, ResetBattleParticipants
	call CallBattleCore2
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore2

	ld hl, DoEntryHazards
	call CallBattleCore2

	jr ResetUTurnStatusEnemy

UTurn_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore2
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

UTurn_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore2

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jr c, .switch

.baton_pass
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow

FailedUTurn:
	ret

ResetUTurnStatusPlayer:
	ld hl, wPlayerSubStatus1
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wPlayerRolloutCount
	ld bc, 20
	call ByteFill
	ld hl, wPlayerStatLevels
	ld bc, wPlayerStatLevelsEnd - wPlayerStatLevels
	ld a, BASE_STAT_LEVEL
	call ByteFill
	ret

ResetUTurnStatusEnemy:
	ld hl, wEnemySubStatus1
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wEnemyRolloutCount
	ld bc, 20
	call ByteFill
	ld hl, wEnemyStatLevels
	ld bc, wPlayerStatLevelsEnd - wPlayerStatLevels
	ld a, BASE_STAT_LEVEL
	call ByteFill
	ret
