SECTION "Effect Commands", ROMX

CompareMove:
	; checks if the move ID in a matches the move in bc
	push hl
	call GetMoveIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret

GetOppUnderwaterAddr:
	call BattleCommand_switchturn
	call GetUserUnderwaterAddr
	jp BattleCommand_switchturn

GetUserUnderwaterAddr:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerUnderwater
	ret z
	ld hl, wEnemyUnderwater
	ret

DoPlayerTurn:
	call SetPlayerTurn

	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ret nz

	jr DoTurn

DoEnemyTurn:
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jr z, DoTurn
	cp BATTLEACTION_SWITCH1
	ret nc

	; fallthrough

DoTurn:
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wTurnEnded], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wTurnEnded]
	and a
	ret nz

	call UpdateMoveData

DoMove:
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
	ld a, BANK(MoveEffectsPointers)
	call GetFarHalfword

	ld de, wBattleScriptBuffer

.GetMoveEffect:
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp endmove_command
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, wBattleScriptBuffer
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a

.ReadMoveEffectCommand:
; ld a, [wBattleScriptBufferAddress++]
	call ReadMoveScriptByte

; endturn_command (-2) is used to terminate branches without ending the read cycle.
	cp endturn_command
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarBankAddress

	rst FarCall

	jr .ReadMoveEffectCommand

ReadMoveScriptByte:
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	pop af
	ret

CheckTurn:
BattleCommand_checkturn:
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, EndTurn

	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld [wKickCounter], a
	ld [wAlreadyDisobeyed], a
	ld [wAlreadyFailed], a
	ld [wSomeoneIsRampaging], a
	ld [wWonderGuardMiss], a

	ld a, EFFECTIVE
	ld [wTypeModifier], a

	ldh a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn

CheckPlayerTurn:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wBattleMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [wBattleMonStatus], a
	and SLP
	jr z, .woke_up

	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextbox

	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurPlayerMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wBattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurPlayerMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wPlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wPlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wDisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wPlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, wPlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wPlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wPlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wPlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wBattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

CantMove:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and $ff ^ (1 << SUBSTATUS_BIDE | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_CHARGED)
	ld [hl], a

	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	res SUBSTATUS_UPROAR, [hl]

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	ret nc

	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call GetUserUnderwaterAddr
	xor a
	ld [hl], a
	jp AppearUserRaiseSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw DIVE
	dw BOUNCE
	dw SHADOW_FORCE
	dw -1

OpponentCantMove:
	call BattleCommand_switchturn
	call CantMove
	jp BattleCommand_switchturn

CheckEnemyTurn:
	ld hl, wEnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [wEnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurEnemyMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wEnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurEnemyMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wEnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wEnemyDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wEnemyDisabledMove], a

	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wEnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, wEnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox

	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wEnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextbox

	call HitSelfInConfusion
	call BattleCommand_damagecalc
	call BattleCommand_lowersub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .no_flicker
	call GetOppUnderwaterAddr
	ld a, [hl]
	and a
	jr nz, .no_flicker

	call z, PlayFXAnimID

.no_flicker

	ld c, TRUE
	call DoEnemyDamage
	call BattleCommand_raisesub
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wEnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	call CantMove

	; fallthrough

EndTurn:
	ld a, $1
	ld [wTurnEnded], a
	jp ResetDamage

MoveDisabled:
	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextbox

HitConfusion:
	ld hl, HurtItselfText
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

	call HitSelfInConfusion
	call BattleCommand_damagecalc
	call BattleCommand_lowersub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .no_flicker
	call GetOppUnderwaterAddr
	ld a, [hl]
	and a
	jr z, .no_flicker
	call z, PlayFXAnimID
.no_flicker

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld c, TRUE
	call DoPlayerDamage
	jp BattleCommand_raisesub

BattleCommand_checkobedience:
; checkobedience

	; Enemy can't disobey
	ldh a, [hBattleTurn]
	and a
	ret nz

	call CheckUserIsCharging
	ret nz

	; If we've already checked this turn
	ld a, [wAlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [wAlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, MON_ID
	call BattlePartyAttr

	ld a, [wPlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	ret z

.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, wJohtoBadges

	; risingbadge
	bit RISINGBADGE, [hl]
	ld a, MAX_LEVEL + 1
	jr nz, .getlevel

	; stormbadge
	bit STORMBADGE, [hl]
	ld a, 70
	jr nz, .getlevel

	; fogbadge
	bit FOGBADGE, [hl]
	ld a, 50
	jr nz, .getlevel

	; hivebadge
	bit HIVEBADGE, [hl]
	ld a, 30
	jr nz, .getlevel

	; no badges
	ld a, 10

.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [wBattleMonLevel]
	ld d, a

	add b
	ld b, a

; No overflow (this should never happen)
	jr nc, .checklevel
	ld b, $ff

.checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc

; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	call IgnoreSleepOnly
	ret c

; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead

; No hope of using a move now.

; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextbox
	call HitConfusion
	jp .EndDisobedience

.Nap:
	call BattleRandom
	add a
	swap a
	and SLP
	jr z, .Nap

	ld [wBattleMonStatus], a

	ld hl, BeganToNapText
	jr .Print

.DoNothing:
	; 4 random choices
	call BattleRandom
	and %11

	ld hl, LoafingAroundText
	and a ; 0
	jr z, .Print

	ld hl, WontObeyText
	dec a ; 1
	jr z, .Print

	ld hl, TurnedAwayText
	dec a ; 2
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print:
	call StdBattleTextbox
	jp .EndDisobedience

.UseInstead:
; Can't use another move if the monster only has one!
	ld a, [wBattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [wDisabledMove]
	and a
	jr nz, .DoNothing

	ld hl, wBattleMonPP
	ld de, wBattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP:
	ld a, [hli]
	and PP_MASK
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP

.CheckMovePP:
	ld hl, wBattleMonPP
	ld a, [wCurMoveNum]
	ld e, a
	ld d, 0
	add hl, de

; Can't use another move if only one move has PP.
	ld a, [hl]
	and PP_MASK
	cp b
	jr z, .DoNothing

; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [wAlreadyDisobeyed], a

	ld a, [w2DMenuNumRows]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [wCurMoveNum]
	ld c, a
	push af

.RandomMove:
	call BattleRandom
	maskbits NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [wCurMoveNum], a
	ld hl, wBattleMonPP
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and PP_MASK
	jr z, .RandomMove

; Use it.
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove

; Restore original move choice.
	pop af
	ld [wCurMoveNum], a

.EndDisobedience:
	xor a
	ld [wLastPlayerMove], a
	ld [wLastPlayerCounterMove], a

	; Break Encore too.
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [wPlayerEncoreCount], a

	jp EndMoveEffect

IgnoreSleepOnly:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	; Snore and Sleep Talk bypass sleep.
	ld hl, .sleep_moves
	call CheckMoveInList
	ret nc

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextbox

	call EndMoveEffect

	scf
	ret

.sleep_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

BattleCommand_usedmovetext:
; usedmovetext
	farcall CheckUserTruant
	ret c

	farcall DisplayUsedMoveText
	ret

CheckUserIsCharging:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret

BattleCommand_doturn:
	call CheckUserIsCharging
	ret nz

	call CheckUserImprisonedMove
	jp c, .imprison

	ld hl, wBattleMonPP
	ld de, wPlayerSubStatus3
	ld bc, wPlayerTurnsTaken

	ldh a, [hBattleTurn]
	and a
	jr z, .proceed

	ld hl, wEnemyMonPP
	ld de, wEnemySubStatus3
	ld bc, wEnemyTurnsTaken

.proceed

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	ret nz
	inc de
	inc de
	inc de
	ld a, [de]
	bit SUBSTATUS_UPROAR, a
	ret nz

	call .consume_pp
	ld a, b
	and a
	jp nz, EndMoveEffect

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and CATEGORY_MASK
	cp STATUS
	jr nz, .not_status_move

	ld a, [de]
	dec de
	bit SUBSTATUS_TAUNT, a
	jp nz, .taunt_fail

.not_status_move
	; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	farcall SetLastResortFlag

	ldh a, [hBattleTurn]
	and a

	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	jr z, .player

; mimic this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]

.player
	call GetPartyLocation
	push hl
	call CheckMimicUsed
	pop hl
	ret c

.consume_pp
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay
	ld a, [wCurEnemyMoveNum]

.okay
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .out_of_pp
	dec [hl]
	ld b, 0
	ret

.wild
	ld hl, wEnemyMonMoves
	ld a, [wCurEnemyMoveNum]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr z, .mimic
	ld hl, wWildMonMoves
	add hl, de
	ld a, [hl]
	call CompareMove
	ret z

.mimic
	ld hl, wWildMonPP
	call .consume_pp
	ret

.out_of_pp
	call BattleCommand_movedelay
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextbox
	ld b, 1
	ret

.continuousmoves
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_BIDE
	db EFFECT_RAMPAGE
	db -1

.imprison
.taunt_fail
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect

CheckMimicUsed:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .player
	ld a, [wCurEnemyMoveNum]

.player
	ld c, a
	ld a, MON_MOVES
	call UserPartyAttr

	ld b, 0
	add hl, bc
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr nz, .mimic

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	call CompareMove
	jr z, .mimic

	scf
	ret

.mimic
	and a
	ret

CheckUserImprisonedMove:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonMoves
	ld a, [wEnemySubStatus2]
	jr z, .go
	ld hl, wBattleMonMoves
	ld a, [wPlayerSubStatus2]
.go
	bit SUBSTATUS_IMPRISON, a
	jr z, .nope

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	jr z, .nope

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	ld c, 4

.loop
	ld a, [hli]
	cp b
	jr z, .yep
	dec c
	jr nz, .loop

.nope
	and a
	ret

.yep
	scf
	ret

BattleCommand_critical:
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonItem
	ld a, [wEnemyMonSpecies]
	jr nz, .Item
	ld hl, wBattleMonItem
	ld a, [wBattleMonSpecies]

.Item:
	ld c, 0
	ld b, [hl]
	call GetPokemonIndexFromID

	ld a, l
	sub LOW(CHANSEY)
	if HIGH(CHANSEY) == 0
		or h
	else
		jr nz, .Farfetchd
		if HIGH(CHANSEY) == 1
			dec h
		else
			ld a, h
			cp HIGH(CHANSEY)
		endc
	endc
	jr nz, .Farfetchd
	ld a, b
	cp LUCKY_PUNCH
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.Farfetchd:
	ld a, l
	sub LOW(FARFETCH_D)
	if HIGH(FARFETCH_D) == 0
		or h
	else
		jr nz, .FocusEnergy
		if HIGH(FARFETCH_D) == 1
			dec h
		else
			ld a, h
			cp HIGH(FARFETCH_D)
		endc
	endc
	jr nz, .FocusEnergy
	ld a, b
	cp STICK
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.FocusEnergy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call GetMoveIndexFromID
	ld de, 2
	ld hl, CriticalHitMoves
	push bc
	ld b, h
	ld c, l
	call IsInHalfwordArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens:
	push bc
	call GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Tally

; +1 critical level
	inc c

.Tally:
	ld hl, CriticalHitChances
	ld b, 0
	add hl, bc
	call BattleRandom
	cp [hl]
	ret nc
	ld a, 1
	ld [wCriticalHit], a
	ret

INCLUDE "data/moves/critical_hit_moves.asm"

INCLUDE "data/battle/critical_hit_chances.asm"

INCLUDE "engine/battle/move_effects/triple_kick.asm"

CheckAnyTypeMatchup:
	ld hl, wTypeMatchupBuffer
	push hl
	push de
	push bc
	ld a, [wTypeMatchupBuffer + 2]
	jr CheckTypeMatchup_join

BattleCheckTypeMatchup:
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, wBattleMonType1
CheckTypeMatchup:
; There is an incorrect assumption about this function made in the AI related code: when
; the AI calls CheckTypeMatchup (not BattleCheckTypeMatchup), it assumes that placing the
; offensive type in a will make this function do the right thing. Since a is overwritten,
; this assumption is incorrect. A simple fix would be to load the move type for the
; current move into a in BattleCheckTypeMatchup, before falling through, which is
; consistent with how the rest of the code assumes this code works like.
	push hl
	push de
	push bc
	call GetCurrentMoveType2
CheckTypeMatchup_join:
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld a, 10 ; 1.0
	ld [wTypeMatchup], a
	farcall TypeMatchupSpecialCases2
	jr c, .End
	ld hl, TypeMatchups
.TypesLoop:
	ld a, [hli]
	cp -1
	jr z, .End
	cp -2
	jr nz, .Next
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .End
	jr .TypesLoop

.Next:
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope:
	inc hl
.Nope2:
	inc hl
	jr .TypesLoop

.Yup:
	xor a
	ldh [hDividend + 0], a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ldh a, [hQuotient + 3]
	ld [wTypeMatchup], a
	jr .TypesLoop

.End:
	pop bc
	pop de
	pop hl
	ret

BattleCommand_resettypematchup:
; Reset the type matchup multiplier to 1.0, if the type matchup is not 0.
; If there is immunity in play, the move automatically misses.
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ld a, 10 ; 1.0
	jr nz, .reset
	call ResetDamage
	xor a
	ld [wTypeModifier], a
	inc a
	ld [wAttackMissed], a
	ret

.reset
	ld [wTypeMatchup], a
	ret

INCLUDE "engine/battle/ai/switch.asm"

INCLUDE "data/types/type_matchups.asm"

BattleCommand_damagevariation:
; damagevariation

; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.

; No point in reducing 1 or 0 damage.
	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ldh [hMultiplicand + 0], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp 85 percent + 1
	jr c, .loop

	ldh [hMultiplier], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ldh [hDivisor], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ldh a, [hQuotient + 2]
	ld hl, wCurDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

BattleCommand_checkhit:
; checkhit

	call .DreamEater
	jp z, .Miss

	call .Feint
	jr z, .skip_protect

	call .Protect
	jp nz, .Miss

.skip_protect
	call .DrainSub
	jp z, .Miss

	call .LockOn
	ret nz

	call .FlyDigMoves
	jp nz, .Miss

	call .ThunderRain
	ret z

	call .XAccuracy
	ret nz

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld hl, AlwaysHitEffects
	ld de, 1
	call IsInArray
	ret c

	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.BrightPowder:
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	ld a, c ; % miss
	pop bc
	jr nz, .skip_brightpowder

	ld c, a
	ld a, b
	sub c
	ld b, a
	jr nc, .skip_brightpowder
	ld b, 0

.skip_brightpowder
	ld a, b
	cp -1
	jr z, .Hit

	farcall GetGravityAccuracyMultiplier

	call BattleRandom
	cp b
	jr nc, .Miss

.Hit:
	ret

.Miss:
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	jr z, .Missed
	call ResetDamage

.Missed:
	ld a, 1
	ld [wAttackMissed], a
	ret

.DreamEater:
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret

.Feint:
; Return z if using Feint and opponent is protected.
; Fail move if using Feint and opponent isn't protected.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FEINT
	ret nz
	call .Protect
	jr z, .Feint_Fail
	xor a
	ret

.Feint_Fail
	call AnimateAndPrintFailedMove
	jp EndMoveEffect

.Protect:
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextbox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret

.LockOn:
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ld hl, .DigMoves
	jr nz, .check_move_in_list
	ld a, 1
	and a
	ret

.DrainSub:
; Return z if using an HP drain move on a substitute.
	call CheckSubstituteOpp
	jr z, .not_draining_sub

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_LEECH_HIT
	ret z
	cp EFFECT_DREAM_EATER
	ret z

.not_draining_sub
	ld a, 1
	and a
	ret

.FlyDigMoves:
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .hit_hidden_move
	call GetOppUnderwaterAddr
	ld a, [hl]
	and a
	ret z
	ld hl, .DiveMoves
	jr .check_move_in_list

.hit_hidden_move
	bit SUBSTATUS_FLYING, a
	ld hl, .FlyMoves
	jr nz, .check_move_in_list
	ld hl, .DigMoves
.check_move_in_list
	; returns z (and a = 0) if the current move is in a given list, or nz (and a = 1) if not
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call CheckMoveInList
	sbc a
	inc a
	ret

.FlyMoves:
	dw GUST
	dw WHIRLWIND
	dw THUNDER
	dw TWISTER
	dw SKY_UPPERCUT
	dw -1

.DigMoves:
	dw EARTHQUAKE
	dw FISSURE
	dw MAGNITUDE
	dw -1

.DiveMoves:
	dw SURF
	dw WHIRLPOOL
	dw -1

.ThunderRain:
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	ret nz

	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

.XAccuracy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret

.StatModifiers:
	ldh a, [hBattleTurn]
	and a

	; load the user's accuracy into b and the opponent's evasion into c.
	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [wPlayerAccLevel]
	ld b, a
	ld a, [wEnemyEvaLevel]
	ld c, a

	jr z, .got_acc_eva

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [wEnemyAccLevel]
	ld b, a
	ld a, [wPlayerEvaLevel]
	ld c, a

.got_acc_eva
	cp b
	jr c, .skip_foresight_check

	; if the target's evasion is greater than the user's accuracy,
	; check the target's foresight status
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.skip_foresight_check
	; subtract evasion from 14
	ld a, MAX_STAT_LEVEL + 1
	sub c
	ld c, a
	; store the base move accuracy for math ops
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	push hl
	ld d, 2 ; do this twice, once for the user's accuracy and once for the target's evasion

.accuracy_loop
	; look up the multiplier from the table
	push bc
	ld hl, AccuracyLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	; multiply by the first byte in that row...
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	; ... and divide by the second byte
	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; minimum accuracy is $0001
	ldh a, [hQuotient + 3]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jr nz, .min_accuracy
	ldh [hQuotient + 2], a
	ld a, 1
	ldh [hQuotient + 3], a

.min_accuracy
	; do the same thing to the target's evasion
	ld b, c
	dec d
	jr nz, .accuracy_loop

	; if the result is more than 2 bytes, max out at 100%
	ldh a, [hQuotient + 2]
	and a
	ldh a, [hQuotient + 3]
	jr z, .finish_accuracy
	ld a, $ff

.finish_accuracy
	pop hl
	ld [hl], a
	ret

INCLUDE "data/battle/accuracy_multipliers.asm"

INCLUDE "data/moves/always_hit.asm"

BattleCommand_effectchance:
; effectchance

	xor a
	ld [wEffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_move_chance
	ld a, [hl]
	cp -1
	jr z, .ok

	call BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

.ok
	pop hl
	ret

BattleCommand_lowersub:
; lowersub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .already_charged

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .charge_turn
	cp EFFECT_SKY_ATTACK
	jr z, .charge_turn
	cp EFFECT_SKULL_BASH
	jr z, .charge_turn
	cp EFFECT_SOLARBEAM
	jr z, .charge_turn
	cp EFFECT_FLY
	jr z, .charge_turn

.already_charged
	call .Rampage
	jr z, .charge_turn

	call CheckUserIsCharging
	ret nz

.charge_turn
	call _CheckBattleScene
	jr c, .mimic_anims

	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

.mimic_anims
	call BattleCommand_lowersubnoanim
	jp BattleCommand_movedelay

.Rampage:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .rollout_rampage
	cp EFFECT_RAMPAGE
	jr z, .rollout_rampage
	cp EFFECT_UPROAR
	jr z, .rollout_rampage

	ld a, 1
	and a
	ret

.rollout_rampage
	ld a, [wSomeoneIsRampaging]
	and a
	ld a, 0
	ld [wSomeoneIsRampaging], a
	ret

BattleCommand_moveanim:
; moveanim
	call BattleCommand_lowersub
	call BattleCommand_moveanimnosub
	jp BattleCommand_raisesub

BattleCommand_moveanimnosub:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_movedelay

	ldh a, [hBattleTurn]
	and a
	ld de, wPlayerRolloutCount
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .got_rollout_count
	ld de, wEnemyRolloutCount
	ld a, BATTLEANIM_PLAYER_DAMAGE

.got_rollout_count
	ld [wNumHits], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_CONVERSION
	jr z, .alternate_anim
	cp EFFECT_DOUBLE_HIT
	jr z, .alternate_anim
	cp EFFECT_POISON_MULTI_HIT
	jr z, .alternate_anim
;	cp EFFECT_SECRET_POWER
;	jr z, .alternate_anim
	cp EFFECT_TRIPLE_KICK
	jr z, .triplekick
	xor a
	ld [wKickCounter], a

.triplekick
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	call PlaySelectedFXAnim

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, .fly_dig_moves
	call CheckMoveInList
	ret nc
	jp AppearUserLowerSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw DIVE
	dw BOUNCE
	dw SHADOW_FORCE
	dw -1

.alternate_anim
	ld a, [wKickCounter]
	and 1
	xor 1
	ld [wKickCounter], a
	ld a, [de]
	cp 1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	pop af
	jr z, .play_anim
	xor a
	ld [wNumHits], a
.play_anim
	jp PlaySelectedFXAnim

BattleCommand_statupanim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_movedelay

	xor a
	jr BattleCommand_statupdownanim

BattleCommand_statdownanim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_movedelay

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_STAT_DOWN
	jr z, BattleCommand_statupdownanim
	ld a, BATTLEANIM_WOBBLE

	; fallthrough

BattleCommand_statupdownanim:
	ld [wNumHits], a
	xor a
	ld [wKickCounter], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	jp PlaySelectedFXAnim

;BattleCommand_switchturn:
;; switchturn
;
;	ldh a, [hBattleTurn]
;	xor 1
;	ldh [hBattleTurn], a
;	ret

BattleCommand_raisesub:
; raisesub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call _CheckBattleScene
	jp c, BattleCommand_raisesubnoanim

	xor a
	ld [wNumHits], a
	ld a, $2
	ld [wKickCounter], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

BattleCommand_failuretext:
; failuretext
; If the move missed or failed, load the appropriate
; text, and end the effects of multi-turn or multi-
; hit moves.
	ld a, [wAttackMissed]
	and a
	ret z

	call GetFailureResultText
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	jr c, .fly_dig

; Move effect:
	inc hl
	ld a, [hl]

	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_DOUBLE_HIT
	jr z, .multihit
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multihit
	jp EndMoveEffect

.multihit
	call BattleCommand_raisesub
	jp EndMoveEffect

.fly_dig
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call GetUserUnderwaterAddr
	xor a
	ld [hl], a
	call AppearUserRaiseSub
	jp EndMoveEffect

.fly_dig_moves
	dw FLY
	dw DIG
	dw DIVE
	dw BOUNCE
	dw SHADOW_FORCE
	dw -1

BattleCommand_applydamage:
; applydamage

	farcall TookDamageFlag

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .focus_band

	call BattleCommand_falseswipe
	ld b, 0
	jr nc, .damage
	ld b, 1
	jr .damage

.focus_band
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, 0
	jr nz, .damage

	call BattleRandom
	cp c
	jr nc, .damage
	call BattleCommand_falseswipe
	ld b, 0
	jr nc, .damage
	ld b, 2

.damage
	push bc
	call .update_damage_taken
	ld c, FALSE
	ldh a, [hBattleTurn]
	and a
	jr nz, .damage_player
	call DoEnemyDamage
	jr .done_damage

.damage_player
	call DoPlayerDamage

.done_damage
	pop bc
	ld a, b
	and a
	ret z

	dec a
	jr nz, .focus_band_text
	ld hl, EnduredText
	jp StdBattleTextbox

.focus_band_text
	call GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, HungOnText
	jp StdBattleTextbox

.update_damage_taken
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld de, wPlayerDamageTaken + 1
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_damage_taken
	ld de, wEnemyDamageTaken + 1

.got_damage_taken
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [wCurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret

GetFailureResultText:
	ld a, [wWonderGuardMiss]
	and a
	ld hl, WonderGuardMissText
	ld de, WonderGuardMissText
	jr nz, .got_text
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jr z, .got_text
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .got_text
	cp EFFECT_TRICK
	jr z, .got_text
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [wCriticalHit]
	cp -1
	jr nz, .got_text
	ld hl, UnaffectedText
.got_text
	call FailText_CheckOpponentProtect
	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz

	ld a, [wTypeModifier]
	and $7f
	ret z

	ld hl, wCurDamage
	ld a, [hli]
	ld b, [hl]
rept 3
	srl a
	rr b
endr
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .do_at_least_1_damage
	inc a
	ld [hl], a
.do_at_least_1_damage
	ld hl, CrashedText
	call StdBattleTextbox
	ld a, $1
	ld [wKickCounter], a
	call LoadMoveAnim
	ld c, TRUE
	ldh a, [hBattleTurn]
	and a
	jp nz, DoEnemyDamage
	jp DoPlayerDamage

FailText_CheckOpponentProtect:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .not_protected
	ld h, d
	ld l, e
.not_protected
	jp StdBattleTextbox

BattleCommand_bidefailtext:
	ld a, [wAttackMissed]
	and a
	ret z

	ld a, [wTypeModifier]
	and $7f
	jp z, PrintDoesntAffect
	jp PrintButItFailed

BattleCommand_criticaltext:
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [wCriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText

BattleCommand_startloop:
; startloop

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret

BattleCommand_supereffectivelooptext:
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

	; fallthrough

BattleCommand_supereffectivetext:
; supereffectivetext

	ld a, [wTypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextbox

BattleCommand_checkfaint:
; checkfaint

; Faint the opponent if its HP reached zero
;  and faint the user along with it if it used Destiny Bond.
; Ends the move effect if the opponent faints.

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP

.got_hp
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .no_dbond

	ld hl, TookDownWithItText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonMaxHP + 1
	bccoord 2, 2 ; hp bar
	ld a, 0
	jr nz, .got_max_hp
	ld hl, wBattleMonMaxHP + 1
	bccoord 10, 9 ; hp bar
	ld a, 1

.got_max_hp
	ld [wWhichHPBar], a
	ld a, [hld]
	ld [wBuffer1], a
	ld a, [hld]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer3], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [wBuffer4], a
	xor a
	ld [hl], a
	ld [wBuffer5], a
	ld [wBuffer6], a
	ld h, b
	ld l, c
	predef AnimateHPBar
	call RefreshBattleHuds

	call BattleCommand_switchturn
	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	ld hl, DESTINY_BOND
	call GetMoveIDFromIndex
	call LoadAnim
	call BattleCommand_switchturn

	jr .finish

.no_dbond
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVar
	bit SUBSTATUS_GRUDGE, a
	jr z, .no_grudge

	farcall DoGrudgeEffect

	jr .finish

.no_grudge
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_DOUBLE_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_TRIPLE_KICK
	jr z, .multiple_hit_raise_sub
	cp EFFECT_BEAT_UP
	jr nz, .finish

.multiple_hit_raise_sub
	call BattleCommand_raisesub

.finish
	jp EndMoveEffect

BattleCommand_buildopponentrage:
; buildopponentrage

	jp .start

.start
	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, wEnemyRageCounter
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wPlayerRageCounter
.player
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call BattleCommand_switchturn
	ld hl, RageBuildingText
	call StdBattleTextbox
	jp BattleCommand_switchturn

BattleCommand_ragedamage:
; ragedamage

	ld a, [wCurDamage]
	ld h, a
	ld b, a
	ld a, [wCurDamage + 1]
	ld l, a
	ld c, a
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerRageCounter]
	jr z, .rage_loop
	ld a, [wEnemyRageCounter]
.rage_loop
	and a
	jr z, .done
	dec a
	add hl, bc
	jr nc, .rage_loop
	ld hl, $ffff
.done
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

EndMoveEffect:
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

CheckCharge:
	and TYPE_MASK
	cp ELECTRIC
	ret nz
	ld a, d
	add a
	ld d, a
	ret nc
	ld d, 255
	ret

DittoMetalPowder:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .Ditto
	ld a, [wTempEnemyMonSpecies]

.Ditto:
	push hl
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(DITTO)
	if HIGH(DITTO) == 0
		or h
		pop hl
	else
		ld a, h
		pop hl
		ret nz
		if HIGH(DITTO) == 1
			dec a
		else
			cp HIGH(DITTO)
		endc
	endc
	ret nz

	push bc
	call GetOpponentItem
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

BattleCommand_damagestats:
; damagestats

	ldh a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough

PlayerAttackDamage:
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .special

.physical
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wBattleMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .thickclub

.special
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld hl, wEnemyMonType
	call TrySandstormSpDefBoost

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wBattleMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyMonType
	call TrySandstormSpDefBoost

	ld hl, wPlayerSpAtk

.lightball
; Note: Returns player special attack at hl in hl.
	call SpecialSpeciesItemBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, [wPlayerChargeFlag]
	and a
	ld a, [wPlayerMoveStructType]
	call nz, CheckCharge

	farcall CheckSports

	ld a, 1
	and a
	ret

TrySandstormSpDefBoost:
; multiply bc by 1.5 if rock type and sandstorm
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz

	ld a, [hli]
	cp ROCK
	jr z, .sandstorm_boost
	ld a, [hl]
	cp ROCK
	ret nz

.sandstorm_boost
	ld h, b
	ld l, c
	rrc h
	rr l
	add hl, bc
	ld b, h
	ld c, l
	ret

TruncateHL_BC:
.loop
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc

	ld a, h
	or b
	jr z, .finish

	srl b
	rr c
	srl b
	rr c

	ld a, c
	or b
	jr nz, .done_bc
	inc c

.done_bc
	srl h
	rr l
	srl h
	rr l

	ld a, l
	or h
	jr nz, .finish
	inc l

.finish
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .done
; If we go back to the loop point,
; it's the same as doing this exact
; same check twice.
	ld a, h
	or b
	jr nz, .loop

.done
	ld b, l
	ret

CheckDamageStatsCritical:
; Return carry if boosted stats should be used in damage calculations.
; Unboosted stats should be used if the attack is a critical hit,
;  and the stage of the opponent's defense is higher than the user's attack.

	ld a, [wCriticalHit]
	and a
	scf
	ret z

	push hl
	push bc
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	cp SPECIAL
; special
	ld a, [wPlayerSAtkLevel]
	ld b, a
	ld a, [wEnemySDefLevel]
	jr nc, .end
; physical
	ld a, [wPlayerAtkLevel]
	ld b, a
	ld a, [wEnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	cp SPECIAL
; special
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

ThickClubBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld bc, CUBONE
	ld d, THICK_CLUB
	call SpeciesItemBoost
	if MAROWAK == (CUBONE + 1)
		inc bc
	else
		ld bc, MAROWAK
	endc
	call DoubleStatIfSpeciesHoldingItem
	pop de
	pop bc
	ret

SpecialSpeciesItemBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld bc, PIKACHU
	ld d, LIGHT_BALL
	call SpeciesItemBoost
	ld bc, CLAMPERL
	ld d, DEEPSEATOOTH
	call DoubleStatIfSpeciesHoldingItem
	ld bc, CLAMPERL
	ld d, DEEPSEASCALE
	call HalveStatIfSpeciesHoldingItem
	pop de
	pop bc
	ret

SpeciesItemBoost:
; Return in hl the stat value at hl.

; If the attacking monster is species bc and
; it's holding item d, double it.

	ld a, [hli]
	ld l, [hl]
	ld h, a
	; fallthrough

DoubleStatIfSpeciesHoldingItem:
; If the attacking monster is species bc and
; it's holding item d, double the stat in hl.
	call StatChangeItemCheck
	ret nz

	push hl
	call GetUserItem
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Double the stat
	sla l
	rl h
	ret

HalveStatIfSpeciesHoldingItem:
; If the defending monster is species bc and
; it's holding item d, halve the stat in hl.
	call StatChangeItemCheck
	ret nz
	push hl
	call GetOpponentItem
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Halve the stat
	rrc h
	rr l
	ret

StatChangeItemCheck:
	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr

	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .CompareSpecies
	ld a, [wTempEnemyMonSpecies]
.CompareSpecies:

	call GetPokemonIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret

EnemyAttackDamage:
	call ResetDamage

; No damage dealt with 0 power.
	ld hl, wEnemyMoveStructPower
	ld a, [hli] ; hl = wEnemyMoveStructType
	ld d, a
	and a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .Special

.physical
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wEnemyMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .thickclub

.Special:
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld hl, wBattleMonType
	call TrySandstormSpDefBoost

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wEnemyMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wBattleMonType
	call TrySandstormSpDefBoost

	ld hl, wEnemySpAtk

.lightball
	call SpecialSpeciesItemBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wEnemyMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, [wEnemyChargeFlag]
	and a
	ld a, [wEnemyMoveStructType]
	call nz, CheckCharge

	farcall CheckSports

	ld a, 1
	and a
	ret

INCLUDE "engine/battle/move_effects/beat_up.asm"

BattleCommand_clearmissdamage:
; clearmissdamage
	ld a, [wAttackMissed]
	and a
	ret z

	jp ResetDamage

HitSelfInConfusion:
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonDefense
	ld de, wPlayerScreens
	ld a, [wBattleMonLevel]
	jr z, .got_it

	ld hl, wEnemyMonDefense
	ld de, wEnemyScreens
	ld a, [wEnemyMonLevel]
.got_it
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .mimic_screen

	sla c
	rl b
.mimic_screen
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call TruncateHL_BC
	ld d, 40
	pop af
	ld e, a
	ret

BattleCommand_damagecalc:
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

; Selfdestruct and Explosion halve defense.
	cp EFFECT_SELFDESTRUCT
	jr nz, .dont_selfdestruct

	srl c
	jr nz, .dont_selfdestruct
	inc c

.dont_selfdestruct

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .skip_zero_damage_check

	cp EFFECT_CONVERSION
	jr z, .skip_zero_damage_check

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.skip_zero_damage_check
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .not_dividing_by_zero
	ld c, 1
.not_dividing_by_zero

	xor a
	ld hl, hDividend
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .level_not_overflowing
	ld [hl], 1
.level_not_overflowing
	inc hl
	ld [hli], a

; / 5
	ld a, 5
	ld [hld], a
	push bc
	ld b, 4
	call Divide
	pop bc

; + 2
	inc [hl]
	inc [hl]

; * bp
	inc hl
	ld [hl], d
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, 4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

; Item boosts
	call GetUserItem

	ld a, b
	and a
	jr z, .DoneItem

	ld hl, TypeBoostItems

.NextItem:
	ld a, [hli]
	cp -1
	jr z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	call GetCurrentMoveType2
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ldh [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.DoneItem:
; Critical hits
	call .CriticalMultiplier

; Update wCurDamage (capped at 997).
	ld hl, wCurDamage
	ld b, [hl]
	ldh a, [hProduct + 3]
	add b
	ldh [hProduct + 3], a
	jr nc, .dont_cap_1

	ldh a, [hProduct + 2]
	inc a
	ldh [hProduct + 2], a
	and a
	jr z, .Cap

.dont_cap_1
	ldh a, [hProduct]
	ld b, a
	ldh a, [hProduct + 1]
	or a
	jr nz, .Cap

	ldh a, [hProduct + 2]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_2

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	ldh a, [hProduct + 3]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr nc, .Cap

.dont_cap_2
	inc hl

	ldh a, [hProduct + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ldh a, [hProduct + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

.Cap:
	ld a, HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hld], a

.dont_cap_3
; Minimum neutral damage is 2 (bringing the cap to 999).
	inc hl
	ld a, [hl]
	add MIN_NEUTRAL_DAMAGE
	ld [hld], a
	jr nc, .dont_floor
	inc [hl]
.dont_floor

	ld a, 1
	and a
	ret

.CriticalMultiplier:
	ld a, [wCriticalHit]
	and a
	ret z

; x2
	ldh a, [hQuotient + 3]
	add a
	ldh [hProduct + 3], a

	ldh a, [hQuotient + 2]
	rl a
	ldh [hProduct + 2], a

; Cap at $ffff.
	ret nc

	ld a, $ff
	ldh [hProduct + 2], a
	ldh [hProduct + 3], a

	ret

INCLUDE "data/types/type_boost_items.asm"

BattleCommand_constantdamage:
; constantdamage

	ld hl, wBattleMonLevel
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wEnemyMonLevel

.got_turn
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .got_power

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_REVERSAL
	jr z, .reversal

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .got_power

.psywave
	ld a, b
	srl a
	add b
	ld b, a
.psywave_loop
	call BattleRandom
	and a
	jr z, .psywave_loop
	cp b
	jr nc, .psywave_loop
	ld b, a
	ld a, 0
	jr .got_power

.super_fang
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .got_power
	or b
	ld a, 0
	jr nz, .got_power
	ld b, 1
	jr .got_power

.got_power
	ld hl, wCurDamage
	ld [hli], a
	ld [hl], b
	ret

.reversal
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .reversal_got_hp
	ld hl, wEnemyMonHP
.reversal_got_hp
	xor a
	ldh [hDividend], a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a
	jr z, .skip_to_divide

	ldh a, [hProduct + 4]
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a

.skip_to_divide
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	ld hl, FlailReversalPower

.reversal_loop
	ld a, [hli]
	cp b
	jr nc, .break_loop
	inc hl
	jr .reversal_loop

.break_loop
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.notEnemysTurn
	call BattleCommand_damagecalc
	pop hl
	ld [hl], 1
	ret

INCLUDE "data/moves/flail_reversal_power.asm"

INCLUDE "engine/battle/move_effects/counter.asm"

INCLUDE "engine/battle/move_effects/encore.asm"

INCLUDE "engine/battle/move_effects/pain_split.asm"

INCLUDE "engine/battle/move_effects/snore.asm"

INCLUDE "engine/battle/move_effects/conversion2.asm"

INCLUDE "engine/battle/move_effects/lock_on.asm"

INCLUDE "engine/battle/move_effects/sketch.asm"

;BattleCommand_defrostopponent:
;; defrostopponent
;; Thaw the opponent if frozen, and
;; raise the user's Attack one stage.
;
;	call AnimateCurrentMove
;
;	ld a, BATTLE_VARS_STATUS_OPP
;	call GetBattleVarAddr
;	call Defrost
;
;	ld a, BATTLE_VARS_MOVE_EFFECT
;	call GetBattleVarAddr
;	ld a, [hl]
;	push hl
;	push af
;
;	ld a, EFFECT_ATTACK_UP
;	ld [hl], a
;	call BattleCommand_statup
;
;	pop af
;	pop hl
;	ld [hl], a
;	ret

INCLUDE "engine/battle/move_effects/sleep_talk.asm"

INCLUDE "engine/battle/move_effects/destiny_bond.asm"

INCLUDE "engine/battle/move_effects/spite.asm"

INCLUDE "engine/battle/move_effects/false_swipe.asm"

INCLUDE "engine/battle/move_effects/heal_bell.asm"

FarPlayBattleAnimation:
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz
	call GetUserUnderwaterAddr
	ld a, [hl]
	and a
	ret nz

	; fallthrough

PlayFXAnimID:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
PlaySelectedFXAnim:
	ld c, 3
	call DelayFrames
	callfar PlayBattleAnim
	ret

DoEnemyDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wEnemyMonHP.
	;  store original HP in little endian wBuffer3/4
	ld a, [hld]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wEnemyMonHP], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wEnemyMonHP
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wBuffer6], a
	ld a, [hl]
	ld [wBuffer5], a

	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoPlayerDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wBattleMonHP.
	;  store original HP in little endian wBuffer3/4
	;  store new HP in little endian wBuffer5/6
	ld a, [hld]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wBattleMonHP + 1], a
	ld [wBuffer5], a
	ld b, [hl]
	ld a, [wBattleMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wBattleMonHP], a
	ld [wBuffer6], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wBattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a

	hlcoord 10, 9
	ld a, 1
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoSubstituteDamage:
	ld hl, SubTookDamageText
	call StdBattleTextbox

	ld de, wEnemySubstituteHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wPlayerSubstituteHP
.got_hp

	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextbox

	call BattleCommand_switchturn
	call BattleCommand_lowersubnoanim
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .no_appear
	call GetUserUnderwaterAddr
	ld a, [hl]
	and a
	jr nz, .no_appear

	call AppearUserLowerSub
.no_appear
	call BattleCommand_switchturn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_POISON_MULTI_HIT
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	cp EFFECT_BEAT_UP
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage

UpdateMoveData:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wCurSpecies], a
	ld [wNamedObjectIndexBuffer], a

	call GetMoveData
	call GetMoveName
	jp CopyName1

BattleCommand_sleeptarget:
; sleeptarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .fail

.not_protected_by_item
	ld a, [wPlayerSubStatus6]
	bit SUBSTATUS_UPROAR, a
	jr nz, .fail
	ld a, [wEnemySubStatus6]
	bit SUBSTATUS_UPROAR, a
	jr nz, .fail
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	ld hl, AlreadyAsleepText
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	call .CheckAIRandomFail
	jr c, .fail

	ld a, [de]
	and a
	jr nz, .fail

	call CheckSubstituteOpp
	jr nz, .fail

	call AnimateCurrentMove
	call SetSleep

.fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.CheckAIRandomFail:
	; Enemy turn
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_fail

	; Not in link battle
	ld a, [wLinkMode]
	and a
	jr nz, .dont_fail

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_fail

	; Not locked-on by the enemy
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_fail

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	ret c

.dont_fail
	xor a
	ret

SetSleep:
; sets de to a valid sleep count
	ld b, $7
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, $3

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

BattleCommand_poisontarget:
; poisontarget

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckIfTargetIsPoisonType
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call CheckToxic
	jr z, .toxic

	call .apply_poison

	ld hl, WasPoisonedText
	call StdBattleTextbox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextbox

.finished
	farcall UseHeldStatusHealingItem
	ret

.apply_poison
	call PoisonOpponent
	ld de, ANIM_PSN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	ret

BattleCommand_poison:
; poison

	ld hl, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jp z, .failed

	call CheckIfTargetIsPoisonType
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, .do_poison
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.do_poison
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .failed

.dont_sample_failure
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckToxic
	jr z, .toxic

	call .apply_poison
	ld hl, WasPoisonedText
	call StdBattleTextbox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextbox

.finished
	farcall UseHeldStatusHealingItem
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.apply_poison
	call AnimateCurrentMove
	call PoisonOpponent
	jp RefreshBattleHuds

CheckToxic:
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyToxicCount
	jr z, .ok
	ld de, wPlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret z
	cp EFFECT_POISON_FANG
	ret

CheckIfTargetIsPoisonType:
	ld b, POISON

CheckIfTargetIsType:
; checks if target is type b
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp b
	ret z
	ld a, [de]
	cp b
	ret

PoisonOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	jp UpdateOpponentInParty

BattleCommand_draintarget:
; draintarget
	call SapHealth
	ld hl, SuckedHealthText
	jp StdBattleTextbox

BattleCommand_eatdream:
; eatdream
	call SapHealth
	ld hl, DreamEatenText
	jp StdBattleTextbox

SapHealth:
	; Divide damage by 2, store it in hDividend
	ld hl, wCurDamage
	ld a, [hli]
	srl a
	ldh [hDividend], a
	ld b, a
	ld a, [hl]
	rr a
	ldh [hDividend + 1], a
	or b
	jr nz, .at_least_one
	ld a, 1
	ldh [hDividend + 1], a
.at_least_one

	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .battlemonhp
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.battlemonhp

	; Store current HP in little endian wBuffer3/4
	ld bc, wBuffer4
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a

	; Store max HP in little endian wBuffer1/2
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a

	; Add hDividend to current HP and copy it to little endian wBuffer5/6
	ldh a, [hDividend + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wBuffer5], a
	ldh a, [hDividend]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wBuffer6], a
	jr c, .max_hp

	; Substract current HP from max HP (to see if we have more than max HP)
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .finish

.max_hp
	; Load max HP into current HP and copy it to little endian wBuffer5/6
	ld a, [de]
	ld [hld], a
	ld [wBuffer5], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wBuffer6], a
	inc de

.finish
	ldh a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .hp_bar
	hlcoord 2, 2
	xor a
.hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	jp UpdateBattleMonInParty

BattleCommand_burntarget:
; burntarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckMoveTypeMatchesTarget ; Don't burn a Fire-type
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
	ld de, ANIM_BRN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret

Defrost:
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ldh a, [hBattleTurn]
	and a
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	jr z, .ok
	ld hl, wPartyMon1Status
	ld a, [wCurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextbox

BattleCommand_freezetarget:
; freezetarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	call CheckMoveTypeMatchesTarget ; Don't freeze an Ice-type
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret nz

	call OpponentCantMove
	call EndRechargeOpp
	ld hl, wEnemyJustGotFrozen
	ldh a, [hBattleTurn]
	and a
	jr z, .finish
	ld hl, wPlayerJustGotFrozen
.finish
	ld [hl], $1
; handle Shaymin Sky Forme revert
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	ld de, wPartySpecies
	jr nz, .got_species
	ld hl, wEnemyMonSpecies
	ld de, wOTPartySpecies
.got_species
	ld a, [hl]
	push hl
	call GetPokemonIndexFromID
	pop bc
	ld a, h
	cp HIGH(SHAYMIN_S)
	ret nz
	ld a, l
	cp LOW(SHAYMIN_S)
	ret nz
	ld hl, SHAYMIN
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld [bc], a ; set Battle/Enemy Mon Species
	push af
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurBattleMon]
	jr nz, .got_cur_mon
	ld a, [wCurOTMon]
.got_cur_mon
	ld h, 0
	ld l, a
	add hl, de
	pop af
	ld [hl], a ; set Party/OT Species
	push af
	ld a, MON_SPECIES
	call OpponentPartyAttr
	pop af
	ld [hl], a ; set wParty/OT Mon Species
	ld [wCurSpecies], a
	call GetBaseData ; for CalcMonStats
	ldh a, [hBattleTurn]
	and a
	jr nz, .get_battlemon_stat_addrs
	ld a, [wEnemyMonLevel]
	ld [wCurPartyLevel], a
	ld de, wEnemyMonMaxHP
	push de
	ld a, MON_MAXHP
	call OTPartyAttr
	ld d, h
	ld e, l
	ld a, MON_STAT_EXP - 1
	call OTPartyAttr
	jr .recalc_stats

.get_battlemon_stat_addrs
	ld a, [wBattleMonLevel]
	ld [wCurPartyLevel], a
	ld de, wBattleMonMaxHP
	push de
	ld a, MON_MAXHP
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld a, MON_STAT_EXP - 1
	call BattlePartyAttr
.recalc_stats
	ld b, 1 ; use stat EXP
	predef CalcMonStats
	pop de
	predef CalcMonStats
; play animation
	call BattleCommand_switchturn
	call _CheckBattleScene
	jr c, .mimic_anims
	xor a
	ld [wNumHits], a
	ld hl, ANIM_REFRESH_SPRITE
	call GetMoveIDFromIndex
	call LoadAnim
	jr .after_anim

.mimic_anims
	call BattleCommand_movedelay
	call BattleCommand_raisesubnoanim
.after_anim
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	jr z, .no_sub
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	call LoadAnim
.no_sub
	call BattleCommand_switchturn
; textbox
	ld hl, RevertedFormText
	jp StdBattleTextbox

BattleCommand_paralyzetarget:
; paralyzetarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	ld de, ANIM_PAR
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

;BattleCommand_attackup:
;; attackup
;	ld b, ATTACK
;	jr BattleCommand_statup
;
;BattleCommand_defenseup:
;; defenseup
;	ld b, DEFENSE
;	jr BattleCommand_statup
;
;BattleCommand_speedup:
;; speedup
;	ld b, SPEED
;	jr BattleCommand_statup
;
;BattleCommand_specialattackup:
;; specialattackup
;	ld b, SP_ATTACK
;	jr BattleCommand_statup
;
;BattleCommand_specialdefenseup:
;; specialdefenseup
;	ld b, SP_DEFENSE
;	jr BattleCommand_statup
;
;BattleCommand_accuracyup:
;; accuracyup
;	ld b, ACCURACY
;	jr BattleCommand_statup
;
;BattleCommand_evasionup:
;; evasionup
;	ld b, EVASION
;	jr BattleCommand_statup
;
;BattleCommand_attackup2:
;; attackup2
;	ld b, $10 | ATTACK
;	jr BattleCommand_statup
;
;BattleCommand_defenseup2:
;; defenseup2
;	ld b, $10 | DEFENSE
;	jr BattleCommand_statup
;
;BattleCommand_speedup2:
;; speedup2
;	ld b, $10 | SPEED
;	jr BattleCommand_statup
;
;BattleCommand_specialattackup2:
;; specialattackup2
;	ld b, $10 | SP_ATTACK
;	jr BattleCommand_statup
;
;BattleCommand_specialdefenseup2:
;; specialdefenseup2
;	ld b, $10 | SP_DEFENSE
;	jr BattleCommand_statup
;
;BattleCommand_accuracyup2:
;; accuracyup2
;	ld b, $10 | ACCURACY
;	jr BattleCommand_statup
;
;BattleCommand_evasionup2:
;; evasionup2
;	ld b, $10 | EVASION
;	jr BattleCommand_statup
;
;BattleCommand_statup:
;; statup
;	call RaiseStat
;	ld a, [wFailedMessage]
;	and a
;	ret nz
;	jp MinimizeDropSub
;
;RaiseStat:
;	ld a, b
;	ld [wLoweredStat], a
;	ld hl, wPlayerStatLevels
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .got_stat_levels
;	ld hl, wEnemyStatLevels
;.got_stat_levels
;	ld a, [wAttackMissed]
;	and a
;	jp nz, .stat_raise_failed
;	ld a, [wEffectFailed]
;	and a
;	jp nz, .stat_raise_failed
;	ld a, [wLoweredStat]
;	and $f
;	ld c, a
;	ld b, 0
;	add hl, bc
;	ld b, [hl]
;	inc b
;	ld a, $d
;	cp b
;	jp c, .cant_raise_stat
;	ld a, [wLoweredStat]
;	and $f0
;	jr z, .got_num_stages
;	inc b
;	ld a, $d
;	cp b
;	jr nc, .got_num_stages
;	ld b, a
;.got_num_stages
;	ld [hl], b
;	push hl
;	ld a, c
;	cp $5
;	jr nc, .done_calcing_stats
;	ld hl, wBattleMonStats + 1
;	ld de, wPlayerStats
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .got_stats_pointer
;	ld hl, wEnemyMonStats + 1
;	ld de, wEnemyStats
;.got_stats_pointer
;	push bc
;	sla c
;	ld b, 0
;	add hl, bc
;	ld a, c
;	add e
;	ld e, a
;	jr nc, .no_carry
;	inc d
;.no_carry
;	pop bc
;	ld a, [hld]
;	sub LOW(MAX_STAT_VALUE)
;	jr nz, .not_already_max
;	ld a, [hl]
;	sbc HIGH(MAX_STAT_VALUE)
;	jp z, .stats_already_max
;.not_already_max
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .calc_player_stats
;	call CalcEnemyStats
;	jr .done_calcing_stats
;
;.calc_player_stats
;	call CalcPlayerStats
;.done_calcing_stats
;	pop hl
;	xor a
;	ld [wFailedMessage], a
;	ret
;
;.stats_already_max
;	pop hl
;	dec [hl]
;	; fallthrough
;
;.cant_raise_stat
;	ld a, $2
;	ld [wFailedMessage], a
;	ld a, $1
;	ld [wAttackMissed], a
;	ret
;
;.stat_raise_failed
;	ld a, $1
;	ld [wFailedMessage], a
;	ret

MinimizeDropSub:
; Lower the substitute if we're minimizing

	ld de, wPlayerMinimized
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .do_player
	ld de, wEnemyMinimized
	ld hl, DropEnemySub
.do_player
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, MINIMIZE
	call CompareMove
	ret nz

	ld a, $1
	ld [de], a
	call _CheckBattleScene
	ret nc

	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommand_movedelay

;BattleCommand_attackdown:
;; attackdown
;	ld a, ATTACK
;	jr BattleCommand_statdown
;
;BattleCommand_defensedown:
;; defensedown
;	ld a, DEFENSE
;	jr BattleCommand_statdown
;
;BattleCommand_speeddown:
;; speeddown
;	ld a, SPEED
;	jr BattleCommand_statdown
;
;BattleCommand_specialattackdown:
;; specialattackdown
;	ld a, SP_ATTACK
;	jr BattleCommand_statdown
;
;BattleCommand_specialdefensedown:
;; specialdefensedown
;	ld a, SP_DEFENSE
;	jr BattleCommand_statdown
;
;BattleCommand_accuracydown:
;; accuracydown
;	ld a, ACCURACY
;	jr BattleCommand_statdown
;
;BattleCommand_evasiondown:
;; evasiondown
;	ld a, EVASION
;	jr BattleCommand_statdown
;
;BattleCommand_attackdown2:
;; attackdown2
;	ld a, $10 | ATTACK
;	jr BattleCommand_statdown
;
;BattleCommand_defensedown2:
;; defensedown2
;	ld a, $10 | DEFENSE
;	jr BattleCommand_statdown
;
;BattleCommand_speeddown2:
;; speeddown2
;	ld a, $10 | SPEED
;	jr BattleCommand_statdown
;
;BattleCommand_specialattackdown2:
;; specialattackdown2
;	ld a, $10 | SP_ATTACK
;	jr BattleCommand_statdown
;
;BattleCommand_specialdefensedown2:
;; specialdefensedown2
;	ld a, $10 | SP_DEFENSE
;	jr BattleCommand_statdown
;
;BattleCommand_accuracydown2:
;; accuracydown2
;	ld a, $10 | ACCURACY
;	jr BattleCommand_statdown
;
;BattleCommand_evasiondown2:
;; evasiondown2
;	ld a, $10 | EVASION
;
;BattleCommand_statdown:
;; statdown
;
;	ld [wLoweredStat], a
;
;	call CheckMist
;	jp nz, .Mist
;
;	ld hl, wEnemyStatLevels
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .GetStatLevel
;	ld hl, wPlayerStatLevels
;
;.GetStatLevel:
;; Attempt to lower the stat.
;	ld a, [wLoweredStat]
;	and $f
;	ld c, a
;	ld b, 0
;	add hl, bc
;	ld b, [hl]
;	dec b
;	jp z, .CantLower
;
;; Sharply lower the stat if applicable.
;	ld a, [wLoweredStat]
;	and $f0
;	jr z, .ComputerMiss
;	dec b
;	jr nz, .ComputerMiss
;	inc b
;
;.ComputerMiss:
;; Computer opponents have a 25% chance of failing.
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .DidntMiss
;
;	ld a, [wLinkMode]
;	and a
;	jr nz, .DidntMiss
;
;	ld a, [wInBattleTowerBattle]
;	and a
;	jr nz, .DidntMiss
;
;; Lock-On still always works.
;	ld a, [wPlayerSubStatus5]
;	bit SUBSTATUS_LOCK_ON, a
;	jr nz, .DidntMiss
;
;; Attacking moves that also lower accuracy are unaffected.
;	ld a, BATTLE_VARS_MOVE_EFFECT
;	call GetBattleVar
;	cp EFFECT_ACCURACY_DOWN_HIT
;	jr z, .DidntMiss
;
;	call BattleRandom
;	cp 25 percent + 1 ; 25% chance AI fails
;	jr c, .Failed
;
;.DidntMiss:
;	call CheckSubstituteOpp
;	jr nz, .Failed
;
;	ld a, [wAttackMissed]
;	and a
;	jr nz, .Failed
;
;	ld a, [wEffectFailed]
;	and a
;	jr nz, .Failed
;
;	call CheckHiddenOpponent
;	jr nz, .Failed
;
;; Accuracy/Evasion reduction don't involve stats.
;	ld [hl], b
;	ld a, c
;	cp ACCURACY
;	jr nc, .Hit
;
;	push hl
;	ld hl, wEnemyMonAttack + 1
;	ld de, wEnemyStats
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .do_enemy
;	ld hl, wBattleMonAttack + 1
;	ld de, wPlayerStats
;.do_enemy
;	call TryLowerStat
;	pop hl
;	jr z, .CouldntLower
;
;.Hit:
;	xor a
;	ld [wFailedMessage], a
;	ret
;
;.CouldntLower:
;	inc [hl]
;.CantLower:
;	ld a, 3
;	ld [wFailedMessage], a
;	ld a, 1
;	ld [wAttackMissed], a
;	ret
;
;.Failed:
;	ld a, 1
;	ld [wFailedMessage], a
;	ld [wAttackMissed], a
;	ret
;
;.Mist:
;	ld a, 2
;	ld [wFailedMessage], a
;	ld a, 1
;	ld [wAttackMissed], a
;	ret
;
;CheckMist:
;	ld a, BATTLE_VARS_MOVE_EFFECT
;	call GetBattleVar
;	cp EFFECT_ATTACK_DOWN
;	jr c, .dont_check_mist
;	cp EFFECT_EVASION_DOWN + 1
;	jr c, .check_mist
;	cp EFFECT_ATTACK_DOWN_2
;	jr c, .dont_check_mist
;	cp EFFECT_EVASION_DOWN_2 + 1
;	jr c, .check_mist
;	cp EFFECT_ATTACK_DOWN_HIT
;	jr c, .dont_check_mist
;	;cp EFFECT_EVASION_DOWN_HIT + 1
;	;jr c, .check_mist
;.dont_check_mist
;	xor a
;	ret
;
;.check_mist
;	ld a, BATTLE_VARS_SUBSTATUS4_OPP
;	call GetBattleVar
;	bit SUBSTATUS_MIST, a
;	ret
;
;BattleCommand_statupmessage:
;	ld a, [wFailedMessage]
;	and a
;	ret nz
;	ld a, [wLoweredStat]
;	and $f
;	ld b, a
;	inc b
;	call GetStatName
;	ld hl, .stat
;	jp BattleTextbox
;
;.stat
;	text_far UnknownText_0x1c0cc6
;	text_asm
;	ld hl, .up
;	ld a, [wLoweredStat]
;	and $f0
;	ret z
;	ld hl, .wayup
;	ret
;
;.wayup
;	text_far UnknownText_0x1c0cd0
;	text_end
;
;.up
;	text_far UnknownText_0x1c0ce0
;	text_end
;
;BattleCommand_statdownmessage:
;	ld a, [wFailedMessage]
;	and a
;	ret nz
;	ld a, [wLoweredStat]
;	and $f
;	ld b, a
;	inc b
;	call GetStatName
;	ld hl, .stat
;	jp BattleTextbox
;
;.stat
;	text_far UnknownText_0x1c0ceb
;	text_asm
;	ld hl, .fell
;	ld a, [wLoweredStat]
;	and $f0
;	ret z
;	ld hl, .sharplyfell
;	ret
;
;.sharplyfell
;	text_far UnknownText_0x1c0cf5
;	text_end
;
;.fell
;	text_far UnknownText_0x1c0d06
;	text_end
;
;TryLowerStat:
;; Lower stat c from stat struct hl (buffer de).
;
;	push bc
;	sla c
;	ld b, 0
;	add hl, bc
;	; add de, c
;	ld a, c
;	add e
;	ld e, a
;	jr nc, .no_carry
;	inc d
;.no_carry
;	pop bc
;
;; The lowest possible stat is 1.
;	ld a, [hld]
;	sub 1
;	jr nz, .not_min
;	ld a, [hl]
;	and a
;	ret z
;
;.not_min
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .Player
;
;	call BattleCommand_switchturn
;	call CalcPlayerStats
;	call BattleCommand_switchturn
;	jr .end
;
;.Player:
;	call BattleCommand_switchturn
;	call CalcEnemyStats
;	call BattleCommand_switchturn
;.end
;	ld a, 1
;	and a
;	ret
;
;BattleCommand_statupfailtext:
;; statupfailtext
;	ld a, [wFailedMessage]
;	and a
;	ret z
;	push af
;	call BattleCommand_movedelay
;	pop af
;	dec a
;	jp z, TryPrintButItFailed
;	ld a, [wLoweredStat]
;	and $f
;	ld b, a
;	inc b
;	call GetStatName
;	ld hl, WontRiseAnymoreText
;	jp StdBattleTextbox
;
;BattleCommand_statdownfailtext:
;; statdownfailtext
;	ld a, [wFailedMessage]
;	and a
;	ret z
;	push af
;	call BattleCommand_movedelay
;	pop af
;	dec a
;	jp z, TryPrintButItFailed
;	dec a
;	ld hl, ProtectedByMistText
;	jp z, StdBattleTextbox
;	ld a, [wLoweredStat]
;	and $f
;	ld b, a
;	inc b
;	call GetStatName
;	ld hl, WontDropAnymoreText
;	jp StdBattleTextbox
;
;GetStatName:
;	ld hl, StatNames
;	ld c, "@"
;.CheckName:
;	dec b
;	jr z, .Copy
;.GetName:
;	ld a, [hli]
;	cp c
;	jr z, .CheckName
;	jr .GetName
;
;.Copy:
;	ld de, wStringBuffer2
;	ld bc, wStringBuffer3 - wStringBuffer2
;	jp CopyBytes
;
;INCLUDE "data/battle/stat_names.asm"
;
INCLUDE "data/battle/stat_multipliers.asm"
;
;BattleCommand_allstatsup:
;; allstatsup
;
;; Attack
;	call ResetMiss
;	call BattleCommand_attackup
;	call BattleCommand_statupmessage
;
;; Defense
;	call ResetMiss
;	call BattleCommand_defenseup
;	call BattleCommand_statupmessage
;
;; Speed
;	call ResetMiss
;	call BattleCommand_speedup
;	call BattleCommand_statupmessage
;
;; Special Attack
;	call ResetMiss
;	call BattleCommand_specialattackup
;	call BattleCommand_statupmessage
;
;; Special Defense
;	call ResetMiss
;	call BattleCommand_specialdefenseup
;	jp   BattleCommand_statupmessage
;
;ResetMiss:
;	xor a
;	ld [wAttackMissed], a
;	ret
;
;LowerStat:
;	ld [wLoweredStat], a
;
;	ld hl, wPlayerStatLevels
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .got_target
;	ld hl, wEnemyStatLevels
;
;.got_target
;	ld a, [wLoweredStat]
;	and $f
;	ld c, a
;	ld b, 0
;	add hl, bc
;	ld b, [hl]
;	dec b
;	jr z, .cant_lower_anymore
;
;	ld a, [wLoweredStat]
;	and $f0
;	jr z, .got_num_stages
;	dec b
;	jr nz, .got_num_stages
;	inc b
;
;.got_num_stages
;	ld [hl], b
;	ld a, c
;	cp 5
;	jr nc, .accuracy_evasion
;
;	push hl
;	ld hl, wBattleMonStats + 1
;	ld de, wPlayerStats
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .got_target_2
;	ld hl, wEnemyMonStats + 1
;	ld de, wEnemyStats
;
;.got_target_2
;	call TryLowerStat
;	pop hl
;	jr z, .failed
;
;.accuracy_evasion
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .player
;
;	call CalcEnemyStats
;
;	jr .finish
;
;.player
;	call CalcPlayerStats
;
;.finish
;	xor a
;	ld [wFailedMessage], a
;	ret
;
;.failed
;	inc [hl]
;
;.cant_lower_anymore
;	ld a, 2
;	ld [wFailedMessage], a
;	ret

BattleCommand_raisestat:
	ld b, -1
RaiseStat:
	xor a
_RaiseStat:
	or STAT_MISS | STAT_SILENT
	jr ChangeStat

BattleCommand_lowerstat:
	ld b, -1
LowerStat:
	xor a
_LowerStat:
	or STAT_LOWER | STAT_MISS | STAT_SILENT
	jr ChangeStat

BattleCommand_forceraisestat:
	ld b, -1
ForceRaiseStat:
	xor a
_ForceRaiseStat:
	; or 0
	jr ChangeStat

BattleCommand_forcelowerstat:
	ld b, -1
ForceLowerStat:
	xor a
_ForceLowerStat:
	or STAT_LOWER
	jr ChangeStat

BattleCommand_raisestathit:
	ld b, -1
RaiseStatHit:
	xor a
_RaiseStatHit:
	or STAT_MISS | STAT_SECONDARY | STAT_SILENT
	jr ChangeStat

BattleCommand_lowerstathit:
	ld b, -1
LowerStatHit:
	xor a
_LowerStatHit:
	or STAT_LOWER | STAT_MISS | STAT_SECONDARY | STAT_SILENT
	jr ChangeStat

BattleCommand_forceraiseoppstat:
	ld b, -1
ForceRaiseOppStat:
	xor a
_ForceRaiseOppStat:
	or STAT_TARGET
	jr ChangeStat

BattleCommand_forceloweroppstat:
	ld b, -1
ForceLowerOppStat:
	xor a
_ForceLowerOppStat:
	or STAT_TARGET | STAT_LOWER
	jr ChangeStat

BattleCommand_raiseoppstat:
	ld b, -1
RaiseOppStat:
	xor a
_RaiseOppStat:
	or STAT_TARGET | STAT_MISS
	jr ChangeStat

BattleCommand_loweroppstat:
	ld b, -1
LowerOppStat:
	xor a
_LowerOppStat:
	or STAT_TARGET | STAT_LOWER | STAT_MISS
	jr ChangeStat

BattleCommand_raiseoppstathit:
	ld b, -1
RaiseOppStatHit:
	xor a
_RaiseOppStatHit:
	or STAT_TARGET | STAT_MISS | STAT_SECONDARY | STAT_SILENT
	jr ChangeStat

BattleCommand_loweroppstathit:
	ld b, -1
LowerOppStatHit:
	xor a
_LowerOppStatHit:
	or STAT_TARGET | STAT_LOWER | STAT_MISS | STAT_SECONDARY | STAT_SILENT
ChangeStat:
	farcall2 FarChangeStat
	ret

BattleCommand_tristatuschance:
; tristatuschance

	call BattleCommand_effectchance

.loop
	; 1/3 chance of each status
	call BattleRandom
	swap a
	and %11
	jr z, .loop
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret

.ptrs
	dw BattleCommand_paralyzetarget ; paralyze
	dw BattleCommand_freezetarget ; freeze
	dw BattleCommand_burntarget ; burn

BattleCommand_curl:
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret

BattleCommand_raisesubnoanim:
	ld hl, GetBattleMonBackpic
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, GetEnemyMonFrontpic
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

BattleCommand_lowersubnoanim:
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, DropEnemySub
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

CalcPlayerStats:
	ld hl, wPlayerAtkLevel
	ld de, wPlayerStats
	ld bc, wBattleMonAttack

	ld a, 5
	call CalcBattleStats

	ld hl, BadgeStatBoosts
	call CallBattleCore

	call BattleCommand_switchturn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	farcall ApplySlowStartEffectOnPlayerStats

	jp BattleCommand_switchturn

CalcEnemyStats:
	ld hl, wEnemyAtkLevel
	ld de, wEnemyStats
	ld bc, wEnemyMonAttack

	ld a, 5
	call CalcBattleStats

	call BattleCommand_switchturn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	farcall ApplySlowStartEffectOnEnemyStats

	jp BattleCommand_switchturn

CalcBattleStats:
.loop
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, StatLevelMultipliers
	add hl, bc
	add hl, bc

	xor a
	ldh [hMultiplicand + 0], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply

	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .check_maxed_out

	ld a, 1
	ldh [hQuotient + 3], a
	jr .not_maxed_out

.check_maxed_out
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE)
	ld a, b
	sbc HIGH(MAX_STAT_VALUE)
	jr c, .not_maxed_out

	ld a, LOW(MAX_STAT_VALUE)
	ldh [hQuotient + 3], a
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hQuotient + 2], a

.not_maxed_out
	pop bc
	ldh a, [hQuotient + 2]
	ld [bc], a
	inc bc
	ldh a, [hQuotient + 3]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop

	ret

INCLUDE "engine/battle/move_effects/bide.asm"

BattleCommand_checkrampage:
; checkrampage

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wEnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .continue_rampage

	res SUBSTATUS_RAMPAGE, [hl]
	call BattleCommand_switchturn
	call SafeCheckSafeguard
	push af
	call BattleCommand_switchturn
	pop af
	jr nz, .continue_rampage

	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and %00000001
	inc a
	inc a
	inc de ; ConfuseCount
	ld [de], a
.continue_rampage
	ld b, rampage_command
	jp SkipToBattleCommand

BattleCommand_rampage:
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
; Rampage for 1 or 2 more turns
	call BattleRandom
	and %00000001
	inc a
	ld [de], a
	ld a, 1
	ld [wSomeoneIsRampaging], a
	ret

INCLUDE "engine/battle/move_effects/teleport.asm"

SetBattleDraw:
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	or DRAW
	ld [wBattleResult], a
	ret

BattleCommand_forceswitch:
; forceswitch

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jp z, .fail
	cp BATTLETYPE_TRAP
	jp z, .fail
	cp BATTLETYPE_CELEBI
	jp z, .fail
	cp BATTLETYPE_SUICUNE
	jp z, .fail
	ldh a, [hBattleTurn]
	and a
	jp nz, .force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .wild_force_flee
	add b
	ld c, a
	inc c
.random_loop_wild
	call BattleRandom
	cp c
	jr nc, .random_loop_wild
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee
.missed
	jp .fail

.wild_force_flee
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wPlayerMoveStructAnimation]
	jp .succeed

.trainer
	call FindAliveEnemyMons
	jr c, .switch_fail
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_INGRAIN, a
	jr nz, .switch_fail
	ld a, [wEnemyGoesFirst]
	and a
	jr z, .switch_fail
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer
	cp c
	jr z, .random_loop_trainer
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, DraggedOutText
	call StdBattleTextbox

	ld hl, DoEntryHazards
	jp CallBattleCore

.switch_fail
	jp .fail

.force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .player_miss

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget

.player_miss
	jr .fail

.wild_succeed_playeristarget
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wEnemyMoveStructAnimation]
	jr .succeed

.vs_trainer
	call CheckPlayerHasMonToSwitchTo
	jr c, .fail

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_INGRAIN, a
	jr nz, .fail

	ld a, [wEnemyGoesFirst]
	cp $1
	jr z, .switch_fail

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget

	cp c
	jr z, .random_loop_trainer_playeristarget

	push af
	push bc
	ld hl, wPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget

	ld a, d
	ld [wCurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextbox

	ld hl, DoEntryHazards
	jp CallBattleCore

.fail
	call BattleCommand_lowersub
	call BattleCommand_movedelay
	call BattleCommand_raisesub
	jp PrintButItFailed

.succeed
	push af
	call SetBattleDraw
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	pop af

	ld hl, FledInFearText
	ld bc, ROAR
	call CompareMove
	jr z, .do_text
	ld hl, BlownAwayText
.do_text
	jp StdBattleTextbox

CheckPlayerHasMonToSwitchTo:
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
	ld bc, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [wCurBattleMon]
	cp e
	jr z, .next

	ld a, e
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted

.next
	inc e
	dec d
	jr nz, .loop

	scf
	ret

.not_fainted
	and a
	ret

BattleCommand_endloop:
; endloop

; Loop back to 'critical'.

	ld de, wPlayerRolloutCount
	ld bc, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld de, wEnemyRolloutCount
	ld bc, wEnemyDamageTaken
.got_addrs

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .in_loop
	set SUBSTATUS_IN_LOOP, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	cp EFFECT_POISON_MULTI_HIT
	jr z, .twineedle
	cp EFFECT_DOUBLE_HIT
	ld a, 1
	jr z, .double_hit
	ld a, [hl]
	cp EFFECT_BEAT_UP
	jr z, .beat_up
	cp EFFECT_TRIPLE_KICK
	jr nz, .not_triple_kick
.reject_triple_kick_sample
	call BattleRandom
	and $3
	jr z, .reject_triple_kick_sample
	dec a
	jr nz, .double_hit
	ld a, 1
	ld [bc], a
	jr .done_loop

.beat_up
	ldh a, [hBattleTurn]
	and a
	jr nz, .check_ot_beat_up
	ld a, [wPartyCount]
	cp 1
	jp z, .only_one_beatup
	dec a
	jr .double_hit

.check_ot_beat_up
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jp z, .only_one_beatup
	ld a, [wOTPartyCount]
	cp 1
	jp z, .only_one_beatup
	dec a
	jr .double_hit

.only_one_beatup
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
	call BattleCommand_beatupfailtext
	jp EndMoveEffect

.not_triple_kick
	call BattleRandom
	and $3
	cp 2
	jr c, .got_number_hits
	call BattleRandom
	and $3
.got_number_hits
	inc a
.double_hit
	ld [de], a
	inc a
	ld [bc], a
	jr .loop_back_to_critical

.twineedle
	ld a, 1
	jr .double_hit

.in_loop
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .loop_back_to_critical
.done_loop
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]

	ld hl, PlayerHitTimesText
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hit_n_times_text
	ld hl, EnemyHitTimesText
.got_hit_n_times_text

	push bc
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_BEAT_UP
	jr z, .beat_up_2
	call StdBattleTextbox
.beat_up_2

	pop bc
	xor a
	ld [bc], a
	ret

.loop_back_to_critical
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.not_critical
	ld a, [hld]
	cp critical_command
	jr nz, .not_critical
	inc hl
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

BattleCommand_fakeout:
	ld hl, wPlayerTurnsTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .got_var
	dec hl
.got_var
	ld a, [hl]
	cp 1
	ret z
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect

BattleCommand_flinchtarget:
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	ret nz

	call CheckOpponentWentFirst
	ret nz

	ld a, [wEffectFailed]
	and a
	ret nz

	; fallthrough

FlinchTarget:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp

CheckOpponentWentFirst:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret

BattleCommand_heldflinch:
; kingsrock

	ld a, [wAttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp HELD_FLINCH
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret

BattleCommand_ohko:
; ohko

	call ResetDamage
	ld a, [wTypeModifier]
	and $7f
	jr z, .no_effect
	ld hl, wEnemyMonLevel
	ld de, wBattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_accuracy
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.got_move_accuracy
	ld a, [de]
	sub [hl]
	jr c, .no_effect
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .finish_ohko
	ld a, $ff
.finish_ohko
	ld [bc], a
	call BattleCommand_checkhit
	ld hl, wCurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHit], a
	ret

.no_effect
	ld a, $ff
	ld [wCriticalHit], a
	ld a, $1
	ld [wAttackMissed], a
	ret

BattleCommand_checkcharge:
; checkcharge

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call GetUserUnderwaterAddr
	xor a
	ld [hl], a
	ld b, charge_command
	jp SkipToBattleCommand

BattleCommand_charge:
; charge

	call BattleCommand_cleartext
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .awake

	call BattleCommand_movedelay
	call BattleCommand_raisesub
	call PrintButItFailed
	jp EndMoveEffect

.awake
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [wAlreadyDisobeyed]
	and a
	call nz, StdBattleTextbox

	call BattleCommand_lowersub
	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	call LoadMoveAnim
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld h, a
	ld bc, FLY
	call CompareMove
	ld a, 1 << SUBSTATUS_FLYING
	jr z, .got_move_type
	ld bc, BOUNCE
	ld a, h
	call CompareMove
	ld a, 1 << SUBSTATUS_FLYING
	jr z, .got_move_type
	ld bc, DIG
	ld a, h
	call CompareMove
	ld a, 1 << SUBSTATUS_UNDERGROUND
	jr z, .got_move_type
	ld bc, DIVE
	ld a, h
	call CompareMove
	ld a, -1
	jr z, .got_move_type
	ld bc, SHADOW_FORCE
	ld a, h
	call CompareMove
	ld a, -2
	jr z, .got_move_type
	call BattleCommand_raisesub
	xor a

.got_move_type
	; a will contain the substatus 3 bit to set (1 << bit), or 0 if none (not flying/digging underground), or $ff is underwater (special case), or $fe is using shadow force (special case 2)
	cp -1
	jr z, .underwater
	cp -2
	jr z, .shadow_force
	and a
	ld l, a
	push hl
	call nz, DisappearUser
	jr .continue

.shadow_force
	ld l, 0
	push hl
	farcall SetShadowForce
	jr .continue

.underwater
	ld l, 0
	push hl
	farcall SetUnderwater
.continue
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	pop bc
	ld a, c
	or [hl]
	ld [hl], a
	call CheckUserIsCharging
	jr nz, .mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.mimic
	call ResetDamage

	ld hl, .UsedText
	call BattleTextbox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SKULL_BASH
	ld b, endturn_command
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.UsedText:
	text_far UnknownText_0x1c0d0e ; "<USER>"
	text_asm
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push bc
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld de, 4
	ld hl, .move_messages
	call IsInHalfwordArray ; hl will point to the low byte of the found item
	jr c, .found_text
	ld hl, .move_messages
.found_text
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	ret

.move_messages
	dw RAZOR_WIND,   .RazorWind
	dw SOLARBEAM,    .Solarbeam
	dw SKULL_BASH,   .SkullBash
	dw SKY_ATTACK,   .SkyAttack
	dw FLY,          .Fly
	dw DIG,          .Dig
	dw BOUNCE,       .Bounce
	dw DIVE,         .Dive
	dw SHADOW_FORCE, .ShadowForce
	dw -1

.RazorWind:
; 'made a whirlwind!'
	text_far UnknownText_0x1c0d12
	text_end

.Solarbeam:
; 'took in sunlight!'
	text_far UnknownText_0x1c0d26
	text_end

.SkullBash:
; 'lowered its head!'
	text_far UnknownText_0x1c0d3a
	text_end

.SkyAttack:
; 'is glowing!'
	text_far UnknownText_0x1c0d4e
	text_end

.Fly:
; 'flew up high!'
	text_far UnknownText_0x1c0d5c
	text_end

.Dig:
; 'dug a hole!'
	text_far UnknownText_0x1c0d6c
	text_end

.Bounce:
; 'sprang up!'
	text_far _SprangUpText
	text_end

.Dive:
	text_far _HidUnderwaterText
	text_end

.ShadowForce:
	text_far _ShadowForceText
	text_end

INCLUDE "engine/battle/move_effects/mist.asm"

INCLUDE "engine/battle/move_effects/focus_energy.asm"

BattleCommand_recoil:
; recoil

	farcall2 ReadMoveScriptByte
	push af
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
	pop af
; divide damage by parameter
	ldh [hDivisor], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, [wCurDamage]
	ldh [hDividend + 2], a
	ld a, [wCurDamage + 1]
	ldh [hDividend + 3], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
; if recoil damage is 0, set to 1
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wBuffer3], a
	sub c
	ld [hld], a
	ld [wBuffer5], a
	ld a, [hl]
	ld [wBuffer4], a
	sbc b
	ld [hl], a
	ld [wBuffer6], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a
.dont_ko
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextbox

BattleCommand_confusetarget:
; confusetarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr BattleCommand_finishconfusingtarget

BattleCommand_confuse:
; confuse

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextbox

.no_item_protection
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .not_already_confused
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextbox

.not_already_confused
	call CheckSubstituteOpp
	jr nz, BattleCommand_confuse_checksnore_swagger_confusehit
	ld a, [wAttackMissed]
	and a
	jr nz, BattleCommand_confuse_checksnore_swagger_confusehit
BattleCommand_finishconfusingtarget:
	ld bc, wEnemyConfuseCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_confuse_count
	ld bc, wPlayerConfuseCount

.got_confuse_count
	set SUBSTATUS_CONFUSED, [hl]
	; confused for 2-5 turns
	call BattleRandom
	and %11
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .got_effect
	cp EFFECT_SNORE
	jr z, .got_effect
	cp EFFECT_SWAGGER
	jr z, .got_effect
	cp EFFECT_FLATTER
	jr z, .got_effect
	call AnimateCurrentMove

.got_effect
	ld de, ANIM_CONFUSED
	call PlayOpponentBattleAnim

	ld hl, BecameConfusedText
	call StdBattleTextbox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .heal_confusion
	cp HELD_HEAL_CONFUSION
	ret nz
.heal_confusion
	ld hl, UseConfusionHealingItem
	jp CallBattleCore

BattleCommand_confuse_checksnore_swagger_confusehit:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	cp EFFECT_FLATTER
	ret z
	jp PrintDidntAffect2

BattleCommand_paralyze:
; paralyze

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PAR, a
	jr nz, .paralyzed
	ld a, [wTypeModifier]
	and $7f
	jr z, .didnt_affect
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextbox

.no_item_protection
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .failed

.dont_sample_failure
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.paralyzed
	call AnimateFailedMove
	ld hl, AlreadyParalyzedText
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2

.didnt_affect
	call AnimateFailedMove
	jp PrintDoesntAffect

CheckMoveTypeMatchesTarget:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).

	push hl

	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok

	call GetCurrentMoveType2
	cp NORMAL
	jr z, .normal

	cp [hl]
	jr z, .return

	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret

INCLUDE "engine/battle/move_effects/substitute.asm"

BattleCommand_rechargenextturn:
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret

EndRechargeOpp:
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret

INCLUDE "engine/battle/move_effects/rage.asm"

BattleCommand_doubleflyingdamage:
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage

BattleCommand_doubleunderwaterdamage:
	call GetOppUnderwaterAddr
	ld a, [hl]
	cp 1
	ret nz
	jr DoubleDamage

BattleCommand_doubleundergrounddamage:
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

	; fallthrough

DoubleDamage:
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .quit

	ld a, $ff
	ld [hli], a
	ld [hl], a
.quit
	ret

INCLUDE "engine/battle/move_effects/mimic.asm"

INCLUDE "engine/battle/move_effects/leech_seed.asm"

INCLUDE "engine/battle/move_effects/splash.asm"

INCLUDE "engine/battle/move_effects/disable.asm"

INCLUDE "engine/battle/move_effects/pay_day.asm"

INCLUDE "engine/battle/move_effects/conversion.asm"

BattleCommand_resetstats:
; resetstats

	ld a, 7 ; neutral
	ld hl, wPlayerStatLevels
	call .Fill
	ld hl, wEnemyStatLevels
	call .Fill

	ldh a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call CalcPlayerStats
	call SetEnemyTurn
	call CalcEnemyStats

	pop af
	ldh [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextbox

.Fill:
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret

BattleCommand_heal:
; heal

	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call CompareBytes
	pop bc
	pop de
	pop hl
	jp z, .hp_full
	ld a, b
	ld bc, ROOST
	call CompareMove
	jr nz, .not_roost
	ldh a, [hBattleTurn]
	and a
	ld bc, wPlayerRoost
	jr z, .roost_turn
	ld bc, wEnemyRoost
.roost_turn
	ld a, 1
	ld [bc], a
.not_roost
	ld bc, REST
	call CompareMove
	jr nz, .not_rest

	push hl
	push de
	push af
	call BattleCommand_movedelay
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_SLEEP_TURNS + 1
	ld hl, WentToSleepText
	jr z, .no_status_to_heal
	ld hl, RestedText
.no_status_to_heal
	call StdBattleTextbox
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .got_stats

.calc_enemy_stats
	call CalcEnemyStats
.got_stats
	pop af
	pop de
	pop hl

.not_rest
	jr z, .restore_full_hp
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .finish

.restore_full_hp
	ld hl, GetMaxHP
	call CallBattleCore
.finish
	call AnimateCurrentMove
	call BattleCommand_switchturn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_switchturn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.hp_full
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/transform.asm"

BattleEffect_ButItFailed:
	call AnimateFailedMove
	jp PrintButItFailed

ClearLastMove:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret

ResetActorDisable:
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
	ret

.player
	xor a
	ld [wPlayerDisableCount], a
	ld [wDisabledMove], a
	ret

BattleCommand_screen:
; screen

	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount

.got_screens_pointer
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, 5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .good

.Reflect:
	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]

	; LightScreenCount -> ReflectCount
	inc bc

	ld a, 5
	ld [bc], a
	ld hl, ReflectEffectText

.good
	call AnimateCurrentMove
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

PrintDoesntAffect:
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp StdBattleTextbox

PrintNothingHappened:
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp StdBattleTextbox

TryPrintButItFailed:
	ld a, [wAlreadyFailed]
	and a
	ret nz

	; fallthrough

_PrintButItFailed:
; 'but it failed!'
	jp PrintButItFailed

AnimateAndPrintFailedMove:
	call AnimateFailedMove
	jp PrintButItFailed

FailMove:
	call AnimateFailedMove
	; fallthrough

FailMimic:
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp FailText_CheckOpponentProtect

PrintDidntAffect:
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp StdBattleTextbox

PrintDidntAffect2:
	call AnimateFailedMove
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp FailText_CheckOpponentProtect

PrintParalyze:
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextbox

CheckSubstituteOpp:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret

INCLUDE "engine/battle/move_effects/selfdestruct.asm"

INCLUDE "engine/battle/move_effects/mirror_move.asm"

INCLUDE "engine/battle/move_effects/metronome.asm"

CheckUserMove:
; Return z if the user has move a.
	ld b, a
	ld de, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret

ResetTurn:
	ld hl, wPlayerCharging
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyCharging

.player
	ld [hl], 1
	xor a
	ld [wAlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect

INCLUDE "engine/battle/move_effects/thief.asm"

BattleCommand_arenatrap:
; arenatrap

; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

INCLUDE "engine/battle/move_effects/nightmare.asm"

BattleCommand_defrost:
; defrost

; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ldh a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, MON_STATUS
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/curse.asm"

INCLUDE "engine/battle/move_effects/protect.asm"

INCLUDE "engine/battle/move_effects/endure.asm"

INCLUDE "engine/battle/move_effects/foresight.asm"

INCLUDE "engine/battle/move_effects/perish_song.asm"

INCLUDE "engine/battle/move_effects/rollout.asm"

INCLUDE "engine/battle/move_effects/fury_cutter.asm"

INCLUDE "engine/battle/move_effects/attract.asm"

INCLUDE "engine/battle/move_effects/return.asm"

INCLUDE "engine/battle/move_effects/present.asm"

INCLUDE "engine/battle/move_effects/frustration.asm"

INCLUDE "engine/battle/move_effects/safeguard.asm"

SafeCheckSafeguard:
	push hl
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens

.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret

BattleCommand_checksafeguard:
; checksafeguard
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_movedelay
	ld hl, SafeguardProtectText
	call StdBattleTextbox
	jp EndMoveEffect

INCLUDE "engine/battle/move_effects/baton_pass.asm"

INCLUDE "engine/battle/move_effects/pursuit.asm"

INCLUDE "engine/battle/move_effects/rapid_spin.asm"

BattleCommand_healmorn:
; healmorn
	ld b, MORN_F
	jr BattleCommand_timebasedhealcontinue

BattleCommand_healday:
; healday
	ld b, DAY_F
	jr BattleCommand_timebasedhealcontinue

BattleCommand_healnite:
; healnite
	ld b, NITE_F
	; fallthrough

BattleCommand_timebasedhealcontinue:
; Time- and weather-sensitive heal.

	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 2

; Don't bother healing if HP is already full.
	push bc
	call CompareBytes
	pop bc
	jr z, .Full

; Don't factor in time of day in link battles.
	ld a, [wLinkMode]
	and a
	jr nz, .Weather

	ld a, [wTimeOfDay]
	cp b
	jr z, .Weather
	dec c ; double

.Weather:
	ld a, [wBattleWeather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
	dec c
	dec c

.Heal:
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call BattleCommand_switchturn

	callfar RestoreHP

	call BattleCommand_switchturn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.Full:
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextbox

.Multipliers:
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP

INCLUDE "engine/battle/move_effects/hidden_power.asm"

INCLUDE "engine/battle/move_effects/belly_drum.asm"

INCLUDE "engine/battle/move_effects/psych_up.asm"

INCLUDE "engine/battle/move_effects/mirror_coat.asm"

BattleCommand_starthail:
; starthail
	ld b, WEATHER_HAIL
	ld hl, StartedToHailText
	jr Battle_StartWeather

BattleCommand_startsun:
; startsun
	ld b, WEATHER_SUN
	ld hl, SunGotBrightText
	jr Battle_StartWeather

BattleCommand_startrain:
; startrain
	ld b, WEATHER_RAIN
	ld hl, DownpourText
	jr Battle_StartWeather

BattleCommand_startsandstorm:
; startsandstorm
	ld b, WEATHER_SANDSTORM
	ld hl, SandstormBrewedText

; fallthrough

Battle_StartWeather:
	ld a, [wBattleWeather]
	cp b
	jr z, .failed

	ld a, b
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	call StdBattleTextbox
	farjump UpdateWeatherForms

.failed
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_skipsuncharge:
; mimicsuncharge
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	ld b, charge_command
	jp SkipToBattleCommand

INCLUDE "engine/battle/move_effects/future_sight.asm"

INCLUDE "engine/battle/move_effects/thunder.asm"

CheckHiddenOpponent:
; BUG: This routine is completely redundant and introduces a bug, since BattleCommand_checkhit does these checks properly.
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerUnderwater]
	jr nz, .go
	ld a, [wEnemyUnderwater]
.go
	and a
	ret

GetUserItem:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	ld b, [hl]
	jp GetItemHeldEffect

GetOpponentItem:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonItem
.go
	ld b, [hl]
	jp GetItemHeldEffect

GetItemHeldEffect:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + ITEMATTR_EFFECT
	dec a
	ld c, a
	ld b, 0
	ld a, ITEMATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret

AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wKickCounter], a
	call PlayDamageAnim
	call BattleCommand_raisesub
	pop bc
	pop de
	pop hl
	ret

AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wKickCounter], a
	call LoadMoveAnim
	call BattleCommand_raisesub
	pop bc
	pop de
	pop hl
	ret

PlayDamageAnim:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	call SetMoveAnimationID

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .player
	ld a, BATTLEANIM_PLAYER_DAMAGE

.player
	ld [wNumHits], a

	jp PlayUserBattleAnim

LoadMoveAnim:
	xor a
	ld [wNumHits], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough

LoadAnim:
	call SetMoveAnimationID
	; fallthrough

PlayUserBattleAnim:
	push hl
	push de
	push bc
	callfar PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

SetMoveAnimationID:
	push hl
	call GetMoveIndexFromID
	ld a, l
	ld [wFXAnimID], a
	ld a, h
	ld [wFXAnimID + 1], a
	pop hl
	ret

PlayOpponentBattleAnim:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ld [wNumHits], a

	push hl
	push de
	push bc
	call BattleCommand_switchturn

	callfar PlayBattleAnim

	call BattleCommand_switchturn
	pop bc
	pop de
	pop hl
	ret

CallBattleCore:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

AnimateFailedMove:
	call BattleCommand_lowersub
	call BattleCommand_movedelay
	jp BattleCommand_raisesub

BattleCommand_movedelay:
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

BattleCommand_cleartext:
; cleartext

; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextbox

.text:
	text_end

SkipToBattleCommand:
; Skip over commands until reaching command b.
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.loop
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

DisappearUser:
	farcall _DisappearUser
	ret

AppearUserLowerSub:
	farcall _AppearUserLowerSub
	ret

AppearUserRaiseSub:
	farcall _AppearUserRaiseSub
	ret

_CheckBattleScene:
; Checks the options.  Returns carry if battle animations are disabled.
	push hl
	push de
	push bc
	farcall CheckBattleScene
	pop bc
	pop de
	pop hl
	ret

CheckMoveInList:
	; checks if the move ID in a belongs to a list of moves in hl
	push bc
	push de
	push hl
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	pop hl
	ld de, 2
	call IsInHalfwordArray
	pop de
	pop bc
	ret

BattleCommand_stab:
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld hl, wBattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	ldh a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends

	ld hl, wEnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wBattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

.go
	call GetCurrentMoveType
	ld [wCurType], a

	push hl
	push de
	push bc
	farcall DoWeatherModifiers
	pop bc
	pop de
	pop hl

	push de
	push bc
	farcall DoBadgeTypeBoosts
	pop bc
	pop de

	push de
	push bc
	farcall DoOrbTypeDamageBoosts
	pop bc
	pop de

	ld a, [wCurType]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc

	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	ld hl, wTypeModifier
	set 7, [hl]

.SkipStab:
	farcall WonderGuardCheck
	jp nc, .wonder_guard

	call GetCurrentMoveType2
	ld b, a
	ld hl, TypeMatchups
	farcall2 TypeMatchupSpecialCases
	jr c, .force_end

.TypesLoop:
	ld a, [hli]

	cp -1
	jr z, .end

	; foresight
	cp -2
	jr nz, .SkipForesightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .TypesLoop

.SkipForesightCheck:
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup:
	push hl
	push bc
	inc hl
	ld a, [wTypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [wAttackMissed], a
	xor a
.NotImmune:
	ldh [hMultiplier], a
	add b
	ld [wTypeModifier], a

	xor a
	ldh [hMultiplicand + 0], a

	ld hl, wCurDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a

	call Multiply

	ldh a, [hProduct + 1]
	ld b, a
	ldh a, [hProduct + 2]
	or b
	ld b, a
	ldh a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .ok

	ld a, 1
	ldh [hMultiplicand + 2], a

.ok
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	pop bc
	pop hl

.SkipType:
	inc hl
	inc hl
	jr .TypesLoop

.wonder_guard
	ld a, 1
	ld [wWonderGuardMiss], a

.force_end
	ld a, 1
	ld [wAttackMissed], a

.end
	farcall BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [wTypeModifier]
	and %10000000
	or b
	ld [wTypeModifier], a
	ret

GetCurrentMoveType2:
	push hl
	call GetCurrentMoveType
	pop hl
	ret

GetCurrentMoveType:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_WEATHER_BALL
	jr z, .weather_ball_type
	cp EFFECT_JUDGMENT
	jr z, .judgment_type

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	ret

.weather_ball_type
	push bc
	ld a, [wBattleWeather]
	cp WEATHER_NONE
	ld b, NORMAL
	jr .got_weather_type
	cp WEATHER_SUN
	ld b, FIRE
	jr .got_weather_type
	cp WEATHER_RAIN
	ld b, WATER
	jr .got_weather_type
	cp WEATHER_HAIL
	ld b, ICE
	jr .got_weather_type
; sandstorm
	ld b, ROCK

.got_weather_type
	ld a, b
	pop bc
	ret

.judgment_type
	push bc
	push de
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .got_item
	ld hl, wEnemyMonItem
.got_item
	ld a, [hl]
	ld b, BANK(PlateItems)
	ld hl, PlateItems
	ld de, 2
	call IsInFarArray
	pop de
	pop bc
	jr nc, .no_plate
	inc hl
	ld a, BANK(PlateItems)
	call GetFarByte
	ret

.no_plate
	xor a
	ret

SECTION "Effect Commands 2", ROMX

CompareMove2:
	; checks if the move ID in a matches the move in bc
	push hl
	call GetMoveIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret

CallBattleCore2:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

AnimateCurrentMove2:
	push af
	push hl
	farcall AnimateCurrentMove
	pop hl
	pop af
	ret

AnimateAndPrintFailedMove2:
	farcall AnimateAndPrintFailedMove
	ret

FailMove2:
	farcall FailMove
	ret

UpdateArceusForm:
	farcall BattleCommand_switchturn
	call .Update
	farcall BattleCommand_switchturn
; update player form

; fallthrough
.Update:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	ld de, wBattleMonType
	jr z, .got_species
	ld hl, wEnemyMonSpecies
	ld de, wEnemyMonType
.got_species
	ld a, [hli]
	push hl
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(ARCEUS)
	jr nz, .miss
	ld a, l
	cp LOW(ARCEUS)
	jr nz, .miss
	pop hl
	ld a, [hl]
	push de
	ld hl, PlateItems
	ld de, 2
	call IsInArray
	pop de
	ret nc
; is Arceus, is holding a Plate
	inc hl
	ld a, [hl] ; target type
	ld [de], a
	inc de
	ld [de], a
	ret

.miss
	pop hl
	ret

INCLUDE "data/items/plate_items.asm"

UpdateWeatherForms:
; update enemy form
	call BattleCommand_switchturn
	call .Update
	call BattleCommand_switchturn
; update player form

; fallthrough
.Update:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	jr z, .got_species
	ld hl, wEnemyMonSpecies
.got_species
	ld a, [hl]
	call GetPokemonIndexFromID
	call GetBaseFormNumber
	ld a, h
	cp HIGH(CASTFORM)
	jr nz, .check_cherrim
	ld a, l
	cp LOW(CASTFORM)
	jr nz, .check_cherrim
; is Castform
	ld a, [wBattleWeather]
	and a
	jr z, .castform_revert
	cp WEATHER_SANDSTORM
	jr z, .castform_revert
	cp WEATHER_RAIN
	jr z, .castform_rain
	cp WEATHER_SUN
	jr z, .castform_sun
; hail
	ld hl, CASTFORM_SW
	lb bc, ICE, ICE ; type 1 / type 2
	jr .update

.castform_rain
	ld hl, CASTFORM_RN
	lb bc, WATER, WATER ; type 1 / type 2
	jr .update

.castform_sun
	ld hl, CASTFORM_SN
	lb bc, FIRE, FIRE ; type 1 / type 2
	jr .update

.castform_revert
	ld hl, CASTFORM
	lb bc, NORMAL, NORMAL ; type 1 / type 2
	jr .update

.check_cherrim
	ld a, h
	cp HIGH(CHERRIM)
	ret nz
	ld a, l
	cp LOW(CHERRIM)
	ret nz
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .cherrim_sunny
; revert
	ld hl, CHERRIM
	lb bc, GRASS, GRASS ; type 1 / type 2
	jr .update

.cherrim_sunny
	ld hl, CHERRIM_S
	lb bc, GRASS, GRASS ; type 1 / type 2

; fallthrough

.update
	call .sanity_check
	ret nc
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	push af
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	ld de, wBattleMonType
	jr z, .set_species
	ld hl, wEnemyMonSpecies
	ld de, wEnemyMonType
.set_species
	pop af
	ld [hl], a
	push af
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	ldh a, [hBattleTurn]
	and a
	ld hl, wTempBattleMonSpecies
	jr z, .got_tempmon
	ld hl, wTempEnemyMonSpecies
.got_tempmon
	pop af
	ld [hl], a
; play animation
	farcall _CheckBattleScene
	jr c, .mimic_anims
	xor a
	ld [wNumHits], a
	ld hl, ANIM_REFRESH_SPRITE
	call GetMoveIDFromIndex
	farcall LoadAnim
	jr .after_anim

.mimic_anims
	farcall BattleCommand_movedelay
	farcall BattleCommand_raisesubnoanim
	farcall BattleAnimCmd_ReloadPal
.after_anim
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	jr z, .no_sub
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	farcall LoadAnim
.no_sub
	ld hl, ChangedFormBattleText
	jp StdBattleTextbox

.sanity_check
; don't change form if you won't actually change
	push de
	push hl
	ld d, h
	ld e, l
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	jr z, .sc_got_species
	ld hl, wEnemyMonSpecies
.sc_got_species
	ld a, [hl]
	call GetPokemonIndexFromID
	ld a, h
	cp d
	jr nz, .diff
	ld a, l
	cp e
	jr nz, .diff
	pop hl
	pop de
	and a
	ret

.diff
	pop hl
	pop de
	scf
	ret

BattleCommand_camouflage:
	ld hl, wBattleMonType
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonType
.ok
	call AnimateCurrentMove2
	push hl
	call GetEnvironmentType
	pop hl
	ld [hli], a
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	farcall GetTypeName
	ld hl, CamouflageText
	jp StdBattleTextbox

BattleCommand_naturepower:
	ld c, 45
	call DelayFrames
	call GetEnvironmentType
	ld hl, NaturePowerMoves
	ld de, 3
	call IsInArray
	ret nc
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	push af
	call GetMoveName
	ld hl, NaturePowerText
	call StdBattleTextbox
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a
	farcall UpdateMoveData
	farjump ResetTurn

GetEnvironmentType:
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .water
	cp PLAYER_SURF_PIKA
	jr z, .water
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr nz, .tileset
	ld a, [wEnvironment]
	cp TOWN
	jr z, .grass
	cp ROUTE
	jr z, .grass
.tileset
	ld a, [wMapTileset]
	ld l, a
	ld h, 0
	ld bc, NaturePowerTilesets
	add hl, bc
	ld a, [hl]
	ret

.grass
	ld a, GRASS
	ret

.water
	ld a, WATER
	ret

INCLUDE "data/moves/nature_power_tilesets.asm"

BattleCommand_endeavor:
	ld hl, wBattleMonHP
	ld de, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHP
	ld de, wBattleMonHP
.ok
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a

	ld a, h
	cp b
	jr c, .do_effect
	ld a, l
	cp c
	jr nc, .fail
.do_effect
	ld a, b
	sub h
	ld h, a
	ld a, c
	sbc l
	ld [wCurDamage + 1], a
	ld a, h
	ld [wCurDamage], a
	ret

.fail
	ld a, 1
	ld [wAttackMissed], a
	ret

BattleCommand_brine:
	push bc
	ld hl, wEnemyMonMaxHP + 1
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonMaxHP + 1
.go
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld h, [hl]
	ld l, a
	add hl, hl
	dec hl
	ld a, h
	cp b
	jr c, .ok
	ld a, l
	cp c
	jr nc, .no
.ok
	pop bc
	ld a, d
	add a
	ld d, a
	ret

.no
	pop bc
	ret

BattleCommand_trick:
; fail if wild opponent uses it
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn

	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr nz, .player_turn

.fail
	jp AnimateAndPrintFailedMove2

.player_turn
	ld a, 1
	ld [wAttackMissed], a
	ld de, wBattleMonItem
	farcall CheckStealableItem
	jr c, .fail
	ld de, wEnemyMonItem
	farcall CheckStealableItem
	jr c, .fail
	ld a, [wBattleMonItem]
	and a
	jr nz, .ok
	ld a, [wEnemyMonItem]
	and a
	jr z, .fail
.ok
	call AnimateCurrentMove2
	xor a
	ld [wAttackMissed], a
	ld hl, wBattleMonItem
	ld de, wEnemyMonItem
	ld b, [hl]
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	ld a, MON_ITEM
	call BattlePartyAttr
	push hl
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr z, .wild_battle
	ld a, MON_ITEM
	call OTPartyAttr
	pop de
	ld b, [hl]
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	jr .text

.wild_battle
	pop de
	ld hl, wBattleMonItem
	ld a, [hl]
	ld [de], a

.text
	ld hl, TrickText
	call StdBattleTextbox
	ld hl, wBattleMonItem
	ld de, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .gotturn
	ld hl, wEnemyMonItem
	ld de, wBattleMonItem
.gotturn
	ld a, [hl]
	and a
	jr z, .skip_user_item

	ld [wNamedObjectIndexBuffer], a
	push de
	call GetItemName
	ld hl, UserGotItemText
	call StdBattleTextbox
	pop de

.skip_user_item
	ld a, [de]
	and a
	ret z

	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, TargetGotItemText
	jp StdBattleTextbox

BattleCommand_taunt:
	ld a, [wAttackMissed]
	and a
	jp nz, FailMove2
	ld a, BATTLE_VARS_SUBSTATUS6_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TAUNT, [hl]
	jr nz, .fail
	set SUBSTATUS_TAUNT, [hl]
	ld hl, wEnemyTauntCount
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wPlayerTauntCount
.go
	call AnimateCurrentMove2
	call BattleRandom
	and %11 ; [0..3]
	add 3 ; [3..6]
	ld [hl], a
	ld hl, FellForTauntText
	jp StdBattleTextbox

.fail
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_trumpcard:
	push bc
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	ld hl, wBattleMonPP
	jr z, .ok
	ld a, [wCurEnemyMoveNum]
	ld hl, wEnemyMonPP
.ok
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	ld a, [hl]
	cp 4
	ld d, 40
	ret nc
	cp 3
	ld d, 50
	ret nc
	cp 2
	ld d, 60
	ret nc
	cp 1
	ld d, 80
	ret nc
	ld d, 200
	ret

BattleCommand_refresh:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and (1 << PSN) | (1 << BRN) | (1 << PAR)
	jr z, .fail
	call AnimateCurrentMove2
	xor a
	ld [hl], a
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	call UpdateUserInParty
	ld hl, StatusHealText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	jp z, CalcPlayerStats
	jp CalcEnemyStats

.fail
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_wakeupslap:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and SLP
	ret z
	xor a
	ld [hl], a
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	ld a, d
	add a
	ld d, a
	push bc
	push de
	call UpdateOpponentInParty
	call BattleCommand_switchturn
	ld hl, StatusHealText
	call StdBattleTextbox
	call BattleCommand_switchturn
	pop de
	pop bc
	ret

BattleCommand_smellingsalt:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	bit PAR, [hl]
	ret z
	ld a, d
	add a
	ld d, a
	res PAR, [hl]
	push bc
	push de
	call UpdateOpponentInParty
	call BattleCommand_switchturn
	ld hl, StatusHealText
	call StdBattleTextbox
	call BattleCommand_switchturn
	pop de
	pop bc
	ret

BattleCommand_imprison:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_IMPRISON, [hl]
	jp nz, AnimateAndPrintFailedMove2
	ld hl, wBattleMonMoves
	ld c, 4
.loop_x
	ld b, 4
	ld de, wEnemyMonMoves
.loop_y
	ld a, [de]
	and a
	jr z, .next
	inc de
	cp [hl]
	jr z, .hit
	dec b
	jr nz, .loop_y
.next
	ld a, [hli]
	and a
	jp z, AnimateAndPrintFailedMove2
	dec c
	jr nz, .loop_x
	jp AnimateAndPrintFailedMove2

.hit
	call AnimateCurrentMove2
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_IMPRISON, [hl]
	ld hl, ImprisonText
	jp StdBattleTextbox

BattleCommand_torment:
	ld a, [wAttackMissed]
	and a
	jp nz, FailMove2
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TORMENT, [hl]
	jp nz, AnimateAndPrintFailedMove2
	set SUBSTATUS_TORMENT, [hl]
	call AnimateCurrentMove2
	ld hl, TormentText
	jp StdBattleTextbox

BattleCommand_movecharge:
	ld hl, wPlayerChargeFlag
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyChargeFlag
.go
	ld a, 2
	ld [hl], a
	call AnimateCurrentMove2
	ld hl, ChargeText
	jp StdBattleTextbox

BattleCommand_watersport:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_WATER_SPORT, [hl]
	jp nz, AnimateAndPrintFailedMove2
	set SUBSTATUS_WATER_SPORT, [hl]
	call AnimateCurrentMove2
	ld hl, WaterSportText
	jp StdBattleTextbox

BattleCommand_mudsport:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_MUD_SPORT, [hl]
	jp nz, AnimateAndPrintFailedMove2
	set SUBSTATUS_MUD_SPORT, [hl]
	call AnimateCurrentMove2
	ld hl, WaterSportText
	jp StdBattleTextbox

CheckSports:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMoveStructType]
	jr z, .go
	ld a, [wEnemyMoveStructType]
.go
	and TYPE_MASK
	cp FIRE
	jr z, .water_sport
	cp ELECTRIC
	ret nz
	ld a, [wPlayerSubStatus6]
	bit SUBSTATUS_MUD_SPORT, a
	jr nz, .hit
	ld a, [wEnemySubStatus6]
	bit SUBSTATUS_MUD_SPORT, a
	jr nz, .hit
	ret

.water_sport
	ld a, [wPlayerSubStatus6]
	bit SUBSTATUS_WATER_SPORT, a
	jr nz, .hit
	ld a, [wEnemySubStatus6]
	bit SUBSTATUS_WATER_SPORT, a
	ret z
.hit
	rrc d
	ret

BattleCommand_ingrain:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_INGRAIN, [hl]
	jp nz, AnimateAndPrintFailedMove2
	set SUBSTATUS_INGRAIN, [hl]
	call AnimateCurrentMove2
	ld hl, wPlayerMagnetRiseCount
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMagnetRiseCount
.go
	xor a
	ld [hl], a
	ld hl, IngrainText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/assist.asm"

INCLUDE "engine/battle/move_effects/water_spout.asm"

BattleCommand_aquaring:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_AQUA_RING, [hl]
	jp nz, AnimateAndPrintFailedMove2
	set SUBSTATUS_AQUA_RING, [hl]
	call AnimateCurrentMove2
	ld hl, AquaRingText
	jp StdBattleTextbox

BattleCommand_checkuproar:
	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wEnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_UPROAR, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	ld b, doturn_command
	farjump SkipToBattleCommand

BattleCommand_uproar:
	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_UPROAR, [hl]
	ret nz
	set SUBSTATUS_UPROAR, [hl]
; Rampage for 1 - 4 more turns
	call BattleRandom
	and %00000011
	inc a
	ld [de], a
	ld a, 1
	ld [wSomeoneIsRampaging], a
	ld hl, CausedAnUproarText
	jp StdBattleTextbox

BattleCommand_stockpile:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	ld a, [hl]
	and MASK_STOCKPILE
	cp STOCKPILE_3
	jr z, .fail
	call AnimateCurrentMove2
	call CheckAlreadyFailed
	ld a, [hl]
	add STOCKPILE_1
	ld [hl], a
	swap a
	rrca
	ld [wStringBuffer1], a
	ld hl, StockpileText
	jp StdBattleTextbox

.fail
	call AnimateAndPrintFailedMove2
	farjump EndMoveEffect

BattleCommand_spitup:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	ld a, [hl]
	and MASK_STOCKPILE
	jr z, .fail
	cp STOCKPILE_1
	ld d, 100
	ret z
	cp STOCKPILE_2
	ld d, 200
	ret z
	ld d, 255
	ret

.fail
	call AnimateAndPrintFailedMove2
	farjump EndMoveEffect

BattleCommand_swallow:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	ld a, [hl]
	and MASK_STOCKPILE
	jr z, .fail

	push af
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	push hl
	push de
	push bc
	ld c, 2
	call CompareBytes
	pop bc
	pop de
	pop hl
	jp z, .hp_full

	pop af
	cp STOCKPILE_1
	jr z, .quarter
	cp STOCKPILE_2
	jr z, .half

	ld hl, GetMaxHP
	call CallBattleCore2
	jr .restore

.quarter
	ld hl, GetQuarterMaxHP
	call CallBattleCore2
	jr .restore

.half
	ld hl, GetHalfMaxHP
	call CallBattleCore2
.restore
	call AnimateCurrentMove2
	call BattleCommand_switchturn
	ld hl, RestoreHP
	call CallBattleCore2
	call BattleCommand_switchturn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.hp_full
	call AnimateFailedMove
	ld hl, HPIsFullText
	call StdBattleTextbox
	farjump EndMoveEffect

.fail
	call AnimateAndPrintFailedMove2
	farjump EndMoveEffect

BattleCommand_removestockpile:
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	ld a, [hl]
	and MASK_STOCKPILE
	ret z

	swap a
	rrca
.loop
	push af
	ld b, DEFENSE
	ld a, STAT_LOWER | STAT_SILENT | STAT_SKIPTEXT
	farcall2 FarChangeStat
	ld b, SP_DEFENSE
	ld a, STAT_LOWER | STAT_SILENT | STAT_SKIPTEXT
	farcall2 FarChangeStat
	pop af
	dec a
	jr nz, .loop
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	res SUBSTATUS_STOCKPILE_1, [hl]
	res SUBSTATUS_STOCKPILE_2, [hl]
	ld hl, StockpileWoreOffText
	jp StdBattleTextbox

BattleCommand_acupressure:
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyStatLevels
.go
; make sure there's a stat that can be raised
	ld bc, 0
.check_loop
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	cp MAX_STAT_LEVEL
	jr nz, .ok
	inc c
	ld a, c
	cp 7
	jp z, AnimateAndPrintFailedMove2
	jr .check_loop

.ok
; choose a stat to raise
.raise_loop
	call BattleRandom
	maskbits 7
	cp 7
	jr nc, .raise_loop
	ld c, a
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	cp MAX_STAT_LEVEL
	jr z, .raise_loop

; found a stat, raise it by 2 levels
	ld a, c
	or $10
	ld b, a
	xor a
	farcall2 FarChangeStat
	ret

BattleCommand_recycle:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerRecycleMemory
	ld bc, wPartyMon1Item
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]
	jr z, .go
	ld hl, wEnemyRecycleMemory
	ld bc, wOTPartyMon1Item
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
.go
	push af
	push bc
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	ld a, [hl]
	and a
	jr z, .fail
	ld a, [de]
	and a
	jr nz, .fail
	ld a, [hl]
	ld [de], a
	xor a
	ld [hl], a

	ldh a, [hBattleTurn]
	and a
	jr z, .continue
	ld a, [wBattleMode]
	dec a
	jr z, .done_wild
.continue
	pop af
	call AnimateCurrentMove2
	ld h, b
	ld l, c
	call GetPartyLocation
	ld a, [de]
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, RecycleText
	jp StdBattleTextbox

.fail
	pop af
	jp AnimateAndPrintFailedMove2

.done_wild
	pop af
	ret

BattleCommand_knockoff:
	ldh a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Item
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
	jr z, .go
; fail if wild mon uses it
	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret z
	ld hl, wPartyMon1Item
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]
.go
	ld b, a
	ld a, [de]
	and a
	ret z
	farcall CheckStealableItem
	ret c
	ld [wNamedObjectIndexBuffer], a
	ld a, b
	call GetPartyLocation
	xor a
	ld [hl], a
	ld [de], a
	call GetItemName
	ld hl, KnockOffText
	jp StdBattleTextbox

BattleCommand_captivate:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	farcall CheckOppositeGender
	jr c, .failed
	farcall CheckHiddenOpponent
	jr nz, .failed
	call CheckAlreadyFailed
	farjump AnimateCurrentMove

.failed
	farcall FailMove
	farjump EndMoveEffect

BattleCommand_gyroball:
	push bc
	push de
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonSpeed
	ld de, wBattleMonSpeed
.go
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld e, a
	ld d, b
	xor a
	ldh [hMultiplicand + 0], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
	ld a, 25
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
	pop de
	pop bc
	ld d, a
	cp -1
	jr z, .max
	inc d
	ldh a, [hQuotient + 2]
	and a
	jr nz, .max
	ld a, d
	cp 151
	ret c

.max
	ld d, 150
	ret

BattleCommand_tailwind:
	ld hl, wPlayerTailwindCount
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyTailwindCount
.go
	ld a, [hl]
	and a
	jp nz, AnimateAndPrintFailedMove2
	ld [hl], 3
	ld hl, TailwindText
	call StdBattleTextbox
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	farjump CalcEnemyStats

.player
	farjump CalcPlayerStats

SetLastResortFlag:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	ld hl, wPlayerLastResortFlags
	jr z, .okay
	ld a, [wCurEnemyMoveNum]
	ld hl, wEnemyLastResortFlags

.okay
	ld b, a
	ld a, 1
	inc b
.loop
	dec b
	jr z, .done
	add a
	jr .loop

.done
	or [hl]
	ld [hl], a
	ret

BattleCommand_lastresort:
	ld a, 1
	ld [wAttackMissed], a
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerLastResortFlags]
	ld hl, wBattleMonMoves
	jr z, .go
	ld a, [wEnemyLastResortFlags]
	ld hl, wEnemyMonMoves
.go
	ld d, a
; make sure mon knows last resort
	push hl
	xor a
	ccf
	push af
	ld e, NUM_MOVES
.check_loop
	ld a, [hli]
	and a
	jr z, .done
	ld bc, LAST_RESORT
	call CompareMove2
	jr z, .check_hit
	pop af
	adc a
	ld b, a
	and d
	ld a, b
	push af
	jr z, .fail2
.check_loop_2
	dec e
	jr nz, .check_loop

.done
	pop af
	pop hl
	ld a, [wAttackMissed]
	and a
	jr nz, .fail

; make sure the user knows more than one move
	inc hl
	ld a, [hl]
	and a
	jr z, .fail
	ret

.fail2
	pop af
	pop hl
.fail
	call AnimateAndPrintFailedMove2
	farjump EndMoveEffect

.check_hit
	xor a
	ld [wAttackMissed], a
	jr .check_loop_2

TookDamageFlag:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerTookDamage
	jr nz, .got_turn_damage_flag
	ld hl, wEnemyTookDamage
.got_turn_damage_flag
	ld a, 1
	ld [hl], a
	ret

BattleCommand_focuspunch:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerTookDamage]
	jr z, .go
	ld a, [wEnemyTookDamage]
.go
	and a
	ret z
	farcall AnimateFailedMove
	ld hl, LostFocusText
	call StdBattleTextbox
	farjump EndMoveEffect

BattleCommand_revenge:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerTookDamage]
	jr z, .go
	ld a, [wEnemyTookDamage]
.go
	and a
	ret z
	ld a, d
	add a
	ld d, a
	ret

BattleCommand_powerswap:
	ld a, ATTACK
	call SwapStatStage
	ld a, SP_ATTACK
	call SwapStatStage
	call CalcBothMonStats
	call AnimateCurrentMove2
	ld hl, SwitchedStatChangesText
	jp StdBattleTextbox

BattleCommand_guardswap:
	ld a, DEFENSE
	call SwapStatStage
	ld a, SP_DEFENSE
	call SwapStatStage
	call CalcBothMonStats
	call AnimateCurrentMove2
	ld hl, SwitchedStatChangesText
	jp StdBattleTextbox

BattleCommand_heartswap:
	xor a
.loop
	push af
	call SwapStatStage
	pop af
	inc a
	cp EVASION + 1
	jr nz, .loop
	call AnimateCurrentMove2
	ld hl, SwitchedStatChangesText
	jp StdBattleTextbox

SwapStatStage:
	ld c, a
	ld b, 0
	ld hl, wPlayerStatLevels
	add hl, bc
	ld d, [hl]
	push hl
	ld hl, wEnemyStatLevels
	add hl, bc
	ld a, [hl]
	ld [hl], d
	pop hl
	ld [hl], a
	ret

CalcBothMonStats:
	ldh a, [hBattleTurn]
	push af
	farcall CalcPlayerStats
	farcall CalcEnemyStats
	pop af
	ldh [hBattleTurn], a
	ret

SetShadowForce:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerUnderwater
	jr z, .got_underwater
	ld hl, wEnemyUnderwater
.got_underwater
	ld a, 2
	ld [hl], a
	farcall _DisappearUser
	ret

SetUnderwater:
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerUnderwater
	jr z, .got_underwater
	ld hl, wEnemyUnderwater
.got_underwater
	ld a, 1
	ld [hl], a
	farcall _DisappearUser
	ret

BattleCommand_weightdamage:
	push bc
	push de
; get weight from dex entry
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonSpecies
	jr z, .got_species
	ld hl, wBattleMonSpecies
.got_species
	ld b, [hl]
	farcall GetMonWeight
	ld b, d
	ld c, e
; get base damage
	ld hl, .weight_damage_table
.damage_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	cp b
	jr c, .next
	jr nz, .got_it
	ld a, e
	cp c
	jr nc, .got_it
.next
	inc hl
	jr .damage_loop

.got_it
	pop de
	ld d, [hl]
	pop bc
	ret

.weight_damage_table
	dwb  219,  20
	dwb  551,  40
	dwb 1102,  60
	dwb 2204,  80
	dwb 4409, 100
	dwb   -1, 120

BattleCommand_facade:
; facade
	ld hl, wBattleMonStatus
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonStatus
.ok
	bit PSN, [hl]
	jr nz, .double
	bit PAR, [hl]
	jr nz, .double
	bit BRN, [hl]
	ret z
.double
	ld a, d
	add a
	jr c, .max
	ld d, a
	ret

.max
	ld b, $ff
	ret

INCLUDE "engine/battle/move_effects/brick_break.asm"

BattleCommand_metalburst:

	ld a, 1
	ld [wAttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z
	cp EFFECT_MIRROR_COAT
	ret z
	cp EFFECT_METAL_BURST
	ret z

	farcall BattleCommand_resettypematchup
	ld a, [wTypeMatchup]
	and a
	ret z

	farcall CheckOpponentWentFirst
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld de, wStringBuffer1
	call GetMoveData

	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	ret z

	; BUG: Move should fail with all non-damaging battle actions
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	ret z

	ld a, [hld]
	ld c, a
	ld a, [hl]
	ld b, a
	ld hl, 0
	add hl, bc
	rrc b
	rr c
	ld a, h
	add hl, bc
	add b
	push af
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	pop af
	jr nc, .capped
	ld a, $ff
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
.capped

	xor a
	ld [wAttackMissed], a
	ret

INCLUDE "engine/battle/move_effects/spikes.asm"

TypeMatchupSpecialCases2:
	ld a, b
	ld b, d
	ld d, a
	ld e, c
	call TypeMatchupSpecialCases
	ld [wTypeMatchup], a
	ld a, b
	ld b, d
	ld d, a
	ld c, e
	ret

TypeMatchupSpecialCases:
	call .magnet_rise
	ret c
	call .gravity_roost
	ret c
	call .miracle_eye
	ret c
	ld a, 10
	ret

.magnet_rise
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMagnetRiseCount]
	jr nz, .m_r_go
	ld a, [wEnemyMagnetRiseCount]
.m_r_go
	and a
	ret z
	ld a, GROUND
	cp b
	jr z, .yes
	and a
	ret

.gravity_roost
	ld a, GROUND
	cp b
	jr nz, .no
	ld a, [wGravityCount]
	and a
	jr nz, .no
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerRoost]
	jr nz, .g_r_go
	ld a, [wEnemyRoost]
.g_r_go
	and a
	ret nz
; check Levitate
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr nz, .lev_go
	ld a, [wEnemyMonSpecies]
.lev_go
	call IsLevitateMon
	jr c, .yes
; check Gravity/Roost typing
	ld a, FLYING
	cp d
	jr z, .yes
	cp e
	jr z, .yes
	and a
	ret

.miracle_eye
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVar
	bit SUBSTATUS_MIRACLE_EYE, a
	ret z
	ld a, PSYCHIC
	cp b
	jr nz, .no
	ld a, DARK
	cp d
	jr z, .yes
	cp e
	jr z, .yes
	and a
	ret

.no
	and a
	ret

.yes
	xor a
	scf
	ret

BattleCommand_miracleeye:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	call CheckHiddenOpponent
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_MIRACLE_EYE, [hl]
	jr nz, .failed

	set SUBSTATUS_MIRACLE_EYE, [hl]
	call AnimateCurrentMove2
	ld hl, IdentifiedText
	jp StdBattleTextbox

.failed
	jp FailMove

BattleCommand_magnetrise:
	ld a, [wGravityCount]
	and a
	jr nz, .fail

	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerMagnetRiseCount
	jr z, .go
	ld hl, wEnemyMagnetRiseCount
.go
	ld a, [hl]
	and a
	jr nz, .fail
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_INGRAIN, a
	jr nz, .fail

	ld a, 5
	ld [hl], a

	call AnimateCurrentMove2

	ld hl, MagnetRiseText
	jp StdBattleTextbox

.fail
	jp AnimateAndPrintFailedMove2

BattleCommand_gravity:
	ld a, [wGravityCount]
	and a
	jr nz, .fail

	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerMagnetRiseCount
	jr z, .go
	ld hl, wEnemyMagnetRiseCount
.go
	xor a
	ld [hl], a

	ld a, 5
	ld [wGravityCount], a

	call AnimateCurrentMove2

	ld hl, GravityText
	call StdBattleTextbox

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_FLYING, [hl]
	ret z

	res SUBSTATUS_FLYING, [hl]
	res SUBSTATUS_CHARGED, [hl]
	ld hl, CouldntStayAirborneText
	jp StdBattleTextbox

.fail
	jp AnimateAndPrintFailedMove2

GetGravityAccuracyMultiplier:
	ld a, [wGravityCount]
	and a
	ret z
	ld h, 0
	ld l, b
	ld c, b
	ld b, 0
	add hl, hl
	add hl, hl
	add hl, bc
	xor a
	ldh [hDividend + 0], a
	ldh [hDividend + 1], a
	ld a, h
	ldh [hDividend + 2], a
	ld a, l
	ldh [hDividend + 3], a
	ld a, 3
	ldh [hDivisor], a
	ld a, 4
	call Divide
	ldh a, [hQuotient + 2]
	and a
	jr nz, .overflow
	ldh a, [hQuotient + 3]
	ld b, a
	ret

.overflow
	ld b, -1
	ret

BattleCommand_trickroom:
	ld hl, wTrickRoomCount
	ld a, [hl]
	and a
	jr z, .set_trick_room
	xor a
	ld [hl], a
	ld hl, UserRestoredDimensionText
	jp StdBattleTextbox

.set_trick_room
	ld a, 5
	ld [hl], a
	ld hl, UserTwistedDimensionText
	jp StdBattleTextbox

BattleCommand_healblock:
	ld hl, wPlayerHealBlockCount
	ldh a, [hBattleTurn]
	and a
	jr nz, .go
	ld hl, wEnemyHealBlockCount
.go
	ld a, [hl]
	and a
	jr nz, .fail

	ld a, 5
	ld [hl], a

	ld hl, HealBlockText
	jp StdBattleTextbox

.fail
	jp AnimateAndPrintFailedMove2

BattleCommand_payback:
	farcall CheckOpponentWentFirst
	ret z
	ld a, d
	add a
	ld d, a
	ret

CheckIfTargetIsFireType:
	ld b, FIRE
	farcall CheckIfTargetIsType
	ret

BattleCommand_burn:
; burn

	ld hl, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jp z, .failed

	call CheckIfTargetIsFireType
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit BRN, a
	jp nz, .burned
	ld a, [wTypeModifier]
	and $7f
	jp z, .didnt_affect
	farcall GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	farcall AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextbox

.no_item_protection
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	call BattleRandom
	cp 25 percent + 1 ; 25% chance AI fails
	jr c, .failed

.dont_sample_failure
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	farcall CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove2
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore2
	call UpdateBattleHuds
	ld hl, WasBurnedText
	call StdBattleTextbox
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore2

.burned
	farcall AnimateFailedMove
	ld hl, AlreadyBurnedText
	jp StdBattleTextbox

.didnt_affect
	farcall AnimateFailedMove
	farjump PrintDoesntAffect

.failed
	farjump PrintDidntAffect2

BattleCommand_traptarget:
; traptarget

	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_trap_text
	cp b
	jr z, .found_trap_text
.next_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextbox

.Traps:
	dw BIND,        UsedBindText       ; 'used BIND on'
	dw WRAP,        WrappedByText      ; 'was WRAPPED by'
	dw FIRE_SPIN,   FireSpinTrapText   ; 'was trapped!'
	dw CLAMP,       ClampedByText      ; 'was CLAMPED by'
	dw WHIRLPOOL,   WhirlpoolTrapText  ; 'was trapped!'
	dw SAND_TOMB,   SandTombTrapText   ; 'was trapped by SAND TOMB!'
	dw MAGMA_STORM, MagmaStormTrapText ; 'became trapped by...'

BattleCommand_crushgrip:
	call BattleCommand_switchturn
	ld d, 120
	call BattleCommand_lifepower
	jp BattleCommand_switchturn

WonderGuardCheck:
	push bc
	push de
	call .check
	pop de
	pop bc
	ret

.check
; special case, if using Fire Fang, it works!
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, FIRE_FANG
	call CompareMove2
	jr z, .ok
; otherwise, get relevant information
	ldh a, [hBattleTurn]
	and a
	ld de, wBattleMonType
	ld a, [wBattleMonSpecies]
	jr nz, .go
	ld de, wEnemyMonType
	ld a, [wEnemyMonSpecies]
.go
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(SHEDINJA)
	jr nz, .ok
	ld a, l
	cp LOW(SHEDINJA)
	jr nz, .ok

	ld a, [de]
	ld [wTypeMatchupBuffer], a
	inc de
	ld a, [de]
	ld [wTypeMatchupBuffer + 1], a

	farcall2 GetCurrentMoveType2
	ld [wTypeMatchupBuffer + 2], a

	farcall CheckAnyTypeMatchup
	ld a, [wTypeMatchup]
	cp 11
	jr nc, .ok

	and a
	ret

.ok
	scf
	ret

BattleCommand_yawn:
; fail if opponent has status already
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .fail
; fail if opponent has sub
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .fail
; fail if opponent is uproaring
	ld a, BATTLE_VARS_SUBSTATUS6_OPP
	call GetBattleVar
	bit SUBSTATUS_UPROAR, a
	jr nz, .fail
; fail if already yawned or opponent has safeguard
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerScreens
	ld de, wPlayerYawnTimer
	jr nz, .go
	ld hl, wEnemyScreens
	ld de, wEnemyYawnTimer
.go
	ld a, [de]
	and a
	jr nz, .fail
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .fail
; set yawn
	ld a, 2
	ld [de], a
	call AnimateCurrentMove2
	ld hl, MadeDrowsyText
	jp StdBattleTextbox

.fail
	jp AnimateAndPrintFailedMove2

DoGrudgeEffect:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurPlayerMove]
	jr z, .ok1
	ld a, [wCurEnemyMove]
.ok1
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call .drain_mon_pp
	ld hl, LostPPDueToGrudgeText
	call StdBattleTextbox
	ret

.drain_mon_pp
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonPP
	jr z, .go
	ld hl, wEnemyMonPP
.go
	call .drain_pp

	ldh a, [hBattleTurn]
	and a

	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	jr z, .player

	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]
.player
	call GetPartyLocation
	push hl
	farcall CheckMimicUsed
	pop hl
	ret c
	jr .drain_pp

.wild
	ld hl, wWildMonPP

.drain_pp
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .ok
	ld a, [wCurEnemyMoveNum]
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_UP_MASK
	ld [hl], a
	ret

BattleCommand_doubleminimizedamage:
; doubleminimizedamage

	ld hl, wEnemyMinimized
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerMinimized
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

BattleCommand_grudge:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_GRUDGE, [hl]
	call AnimateCurrentMove2
	ld hl, BearAGrudgeText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/u_turn.asm"

BattleCommand_secretpoweranim:
	call GetEnvironmentType
	ld hl, SecretPowerTypeData
	ld de, 6
	call IsInArray
	jr nc, .error
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	pop af
	ld [hl], a
	farcall BattleCommand_moveanim
	ret

.error
	call AnimateAndPrintFailedMove2
	farcall EndMoveEffect
	ret

BattleCommand_secretpowereffect:
	call GetEnvironmentType
	ld hl, SecretPowerTypeData
	ld de, 6
	call IsInArray
	jr nc, .error
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	ret

.error
	call AnimateAndPrintFailedMove2
	farcall EndMoveEffect
	ret

SecretPowerLowerAccuracy:
	ld b, ACCURACY
	ld a, STAT_LOWER | STAT_SECONDARY | STAT_TARGET
	farcall2 FarChangeStat
	ret

SecretPowerLowerAttack:
	ld b, ATTACK
	ld a, STAT_LOWER | STAT_SECONDARY | STAT_TARGET
	farcall2 FarChangeStat
	ret

SecretPowerSleep:
	xor a
	ld [wNumHits], a
	farcall CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
;	ld a, [wTypeModifier]
;	and $7f
;	ret z
	farcall GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	ret z
	ld a, [wPlayerSubStatus6]
	bit SUBSTATUS_UPROAR, a
	ret nz
	ld a, [wEnemySubStatus6]
	bit SUBSTATUS_UPROAR, a
	ret nz
	ld a, [wEffectFailed]
	and a
	ret nz
	farcall SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	farjump SetSleep

INCLUDE "data/moves/secret_power.asm"

INCLUDE "engine/battle/move_effects/magnitude.asm"

CheckUserTruant:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpecies
	ld a, [wPlayerPseudoAbilityFlags]
	jr z, .go
	ld hl, wEnemyMonSpecies
	ld a, [wEnemyPseudoAbilityFlags]
.go
	bit TRUANT, a
	jr z, .no
	ld a, [hl]
	call GetPokemonIndexFromID
; is it Slakoth?
	ld a, h
	cp HIGH(SLAKOTH)
	jr nz, .not_slakoth
	ld a, l
	cp LOW(SLAKOTH)
	jr z, .yes

.not_slakoth
; is it Slaking?
	ld a, h
	cp HIGH(SLAKING)
	jr nz, .no
	ld a, l
	cp LOW(SLAKING)
	jr z, .yes

.no
	and a
	ret

.yes
	farcall EndMoveEffect
	ld hl, TruantText
	call StdBattleTextbox
; if charging+not visible, appear sprite
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and (1 << SUBSTATUS_FLYING) | (1 << SUBSTATUS_UNDERGROUND)
	jr z, .appear
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerUnderwater]
	jr z, .got_underwater
	ld a, [wEnemyUnderwater]
.got_underwater
	and a
	jr z, .finish

.appear
	farcall AppearUserRaiseSub

.finish
	scf
	ret

BattleCommand_checkwish:
	ld hl, wPlayerWishCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyWishCount
.ok

	ld a, [hl]
	and a
	ret z
	cp 1
	ret nz

	ld b, wish_command
	farjump SkipToBattleCommand

BattleCommand_wish:
	farcall CheckUserIsCharging
	jr nz, .AlreadyCharging
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
.AlreadyCharging
	ld hl, wPlayerWishCount
	ldh a, [hBattleTurn]
	and a
	jr z, .GotCount
	ld hl, wEnemyWishCount
.GotCount
	ld a, [hl]
	and a
	jr nz, .failed
	ld a, 3
	ld [hl], a
	farcall BattleCommand_lowersub
	farcall BattleCommand_movedelay
	ld hl, MadeAWishText
	call StdBattleTextbox
	farcall BattleCommand_raisesub
	farjump EndMoveEffect

.failed
	call AnimateAndPrintFailedMove2
	farjump EndMoveEffect

BattleCommand_magiccoat:
	farcall CheckOpponentWentFirst
	jr nz, .fail
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_MAGIC_COAT, [hl]
	ld hl, MagicCoatText
	jp StdBattleTextbox

.fail
	jp AnimateAndPrintFailedMove2

BattleCommand_checkmagiccoat:
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_MAGIC_COAT, [hl]
	ret z
	res SUBSTATUS_MAGIC_COAT, [hl]

; get move name
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName

; display bounce back text
	ld hl, BouncedBackText
	call StdBattleTextbox

; backup and replace enemy move
	call BattleCommand_switchturn
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, [hl]
	push af
	push hl
	call BattleCommand_switchturn
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	call BattleCommand_switchturn
	pop hl
	ld [hl], b
	push hl

	farcall UpdateMoveData
	farcall ResetTurn

; restore old move
	pop hl
	pop af
	ld [hl], a
	farcall UpdateMoveData

	call BattleCommand_switchturn

	ret
