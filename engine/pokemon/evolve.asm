EvolvePokemon:
	ld hl, wEvolvableFlags
	xor a
	ld [hl], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle:
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [wCurPartyMon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount

	push hl

EvolveAfterBattle_MasterLoop:
	ld hl, wCurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jp z, .ReturnToMap

	ld [wEvolutionOldSpecies], a

	push hl
	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wEvolvableFlags
	ld b, CHECK_FLAG
	call EvoFlagAction
	ld a, c
	and a
	jp z, EvolveAfterBattle_MasterLoop

	ld a, [wEvolutionOldSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a

	push hl
	xor a
	ld [wMonType], a
	predef CopyMonToTempMon
	pop hl

.loop
	call GetNextEvoAttackByte
	and a
	jr z, EvolveAfterBattle_MasterLoop

	ld b, a

	cp EVOLVE_TRADE
	jp z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_check

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item
	cp EVOLVE_ITEM_MALE
	jp z, .item_male
	cp EVOLVE_ITEM_FEMALE
	jp z, .item_female

	ld a, [wForceEvolution]
	and a
	jp nz, .dont_evolve_check

	ld a, b
	and EVOLVE_LEVEL_AND
	jp nz, .level

	ld a, b
	cp EVOLVE_HAPPINESS
	jr z, .happiness

; EVOLVE_STAT
	call GetNextEvoAttackByte
	ld c, a
	ld a, [wTempMonLevel]
	cp c
	jp c, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jp z, .skip_evolution_species_parameter

	push hl
	ld de, wTempMonAttack
	ld hl, wTempMonDefense
	ld c, 2
	call CompareBytes
	ld c, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	ld c, ATK_LT_DEF
	jr c, .got_tyrogue_evo
	ld c, ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	call GetNextEvoAttackByte
	cp c
	jp nz, .skip_evolution_species
	jp .proceed

.happiness
	ld a, [wTempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jp c, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jp z, .skip_evolution_species_parameter

	call GetNextEvoAttackByte
	cp TR_ANYTIME
	jp z, .proceed
	cp TR_MORNDAY
	jr z, .happiness_daylight

; TR_NITE
	ld a, [wTimeOfDay]
	cp NITE_F
	jp nz, .skip_evolution_species
	jp .proceed

.happiness_daylight
	ld a, [wTimeOfDay]
	cp NITE_F
	jp z, .skip_evolution_species
	jp .proceed

.trade
	ld a, [wLinkMode]
	and a
	jp z, .skip_evolution_species_parameter

	call IsMonHoldingEverstone
	jp z, .skip_evolution_species_parameter

	call GetNextEvoAttackByte
	ld b, a
	inc a
	jr z, .proceed

	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, .skip_evolution_species

	ld a, [wTempMonItem]
	cp b
	jp nz, .skip_evolution_species

	xor a
	ld [wTempMonItem], a
	jr .proceed

.item_male
	ld a, TEMPMON
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	jp c, .skip_evolution_species_parameter
	jp z, .skip_evolution_species_parameter
	jr .item

.item_female
	ld a, TEMPMON
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	jp c, .skip_evolution_species_parameter
	jp nz, .skip_evolution_species_parameter

.item
	call GetNextEvoAttackByte
	ld b, a
	ld a, [wCurItem]
	cp b
	jp nz, .skip_evolution_species

	ld a, [wForceEvolution]
	and a
	jp z, .skip_evolution_species
	ld a, [wLinkMode]
	and a
	jp nz, .skip_evolution_species
	jr .proceed

.level
	ld c, b
	call GetNextEvoAttackByte
	ld b, a
	ld a, [wTempMonLevel]
	cp b
	jp c, .skip_evolution_species
	push bc
	call IsMonHoldingEverstone
	pop bc
	jp z, .skip_evolution_species

	call CheckLevelEvolutionCondition
	jp nc, .skip_evolution_species

.proceed
	ldh a, [hTemp]
	ld [wEvolutionDataBankBackup], a
	ld a, h
	ld [wEvolutionDataAddrBackup], a
	ld a, l
	ld [wEvolutionDataAddrBackup + 1], a
	ld a, c
	ld [wEvolutionMethodBackup], a
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld a, [wMonTriedToEvolve]
	and a
	jr nz, .level_evolution
	ld a, $1
	ld [wMonTriedToEvolve], a

.level_evolution
	ldh a, [hTemp]
	call GetFarHalfword
	call GetPokemonIDFromIndex
	ld [wEvolutionNewSpecies], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, Text_WhatEvolving
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ldh [hBGMapMode], a
	call ClearSprites

	farcall EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, CancelEvolution

	ld hl, Text_CongratulationsYourPokemon
	call PrintText

	ld a, [wEvolutionMethodBackup]
	cp EVOLVE_LEVEL_ADD_MON
	call z, .try_evo_add_mon

	ld a, [wMonTriedToEvolve]
	cp EVOLVE_LEVEL_WITH_ITEM
	jr z, .remove_item
	cp EVOLVE_LEVEL_WITH_ITEM_DAY
	jr z, .remove_item
	cp EVOLVE_LEVEL_WITH_ITEM_NIGHT
	jr nz, .item_done
.remove_item
	xor a
	ld [wTempMonItem], a

.item_done
	ld a, [wEvolutionNewSpecies]
	ld [wCurSpecies], a
	ld [wTempMonSpecies], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName

	push hl
	ld hl, Text_EvolvedIntoPKMN
	call PrintTextboxText
	farcall StubbedTrainerRankings_MonsEvolved

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMap
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcMonStats

	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wTempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wCurSpecies]
	ld [wTempSpecies], a
	xor a
	ld [wMonType], a
	call LearnLevelMoves
	ld a, [wTempSpecies]
	call SetSeenAndCaughtMon

	ld a, [wTempSpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(UNOWN)
	if HIGH(UNOWN) == 0
		or h
	else
		jr nz, .skip_unown
		if HIGH(UNOWN) == 1
			dec h
		else
			ld a, h
			cp HIGH(UNOWN)
		endc
	endc
	jr nz, .skip_unown
	ld hl, wTempMonDVs
	predef GetUnownLetter
	callfar UpdateUnownDex

.skip_unown
	pop de
	pop hl
	ld a, [wTempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jp EvolveAfterBattle_MasterLoop

.dont_evolve_check
	ld a, b
	cp EVOLVE_STAT
	jr nz, .skip_evolution_species_parameter
	inc hl
.skip_evolution_species_parameter
	inc hl
.skip_evolution_species
	inc hl
	inc hl
	jp .loop

; unused
	pop hl
.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	call nz, RestartMapMusic
	ret

.try_evo_add_mon
	ld a, [wEvolutionDataBankBackup]
	ld b, a
	ld a, [wEvolutionDataAddrBackup]
	ld h, a
	ld a, [wEvolutionDataAddrBackup + 1]
	ld l, a
	inc hl
	inc hl
; next evo should be EVOLVE_LEVEL_EXTRA_MON
	ld a, b
	call GetFarByte
	cp EVOLVE_LEVEL_EXTRA_MON
	ret nz
	inc hl ; ignore level, should match
; don't add if not enough space in party
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ret z
; copy previous mon's data to new slot
	push bc
	push hl
	ld hl, wPartyMons
	call GetPartyLocation
	ld d, h
	ld e, l
	ld a, MON_SPECIES
	call GetPartyParamLocation
	call CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	push hl
	ld a, [wPartyCount]
	ld hl, wPartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	pop bc
; set species
	inc hl
	ld a, b
	call GetFarHalfword
	ld a, [wCurPartyMon]
	push af
	ld a, [wPartyCount]
	ld [wCurPartyMon], a
	call ChangePartyMonSpecies
	pop af
	ld [wCurPartyMon], a
; clear item
	ld hl, wPartyMon1Item
	ld a, [wPartyCount]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a
; set hp to max
	ld hl, wPartyMon1MaxHP + 1
	ld a, [wPartyCount]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hld]
	ld e, a
	ld a, [hld]
	ld d, a
	ld a, e
	ld [hld], a
	ld a, d
	ld [hl], a
; set nickname to default
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld a, [wPartyCount]
	ld hl, wPartyMonNicknames
	call SkipNames
	ld bc, MON_NAME_LENGTH
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	call CopyBytes
; increment party count
	ld hl, wPartyCount
	inc [hl]
	ret

CheckLevelEvolutionCondition:
	push hl
	ld a, c
	cp EVOLVE_LEVEL
	jp z, .ok
	sub EVOLVE_LEVEL_AND + 1
	ld hl, .jumptable
	jp JumpTable

.jumptable
	dw .with_move
	dw .in_location
	dw .with_item
	dw .with_item_day
	dw .with_item_night
	dw .male
	dw .female
	dw .with_party_mon
	dw .add_mon
	dw .extra_mon
	dw .dv_high
	dw .dv_low

.with_move
	pop hl
	call GetNextEvoAttackWord
	push hl
	ld h, b
	ld l, c
	call GetMoveIDFromIndex
	ld d, a
	ld e, NUM_MOVES
	ld hl, wTempMonMoves
.move_loop
	ld a, [hli]
	cp d
	jp z, .ok
	dec e
	jr nz, .move_loop
	jp .no

.with_item_night
	ld a, [wTimeOfDay]
	cp 2
	jp nz, .no_skip_byte

.with_item
	pop hl
	call GetNextEvoAttackByte
	push hl
	ld b, a
	ld a, [wTempMonItem]
	cp b
	jr nz, .no
	ld a, c
	ld [wMonTriedToEvolve], a
	jr .ok

.with_item_day
	ld a, [wTimeOfDay]
	cp 2
	jr z, .no_skip_byte
	jr .with_item

.male
	ld a, TEMPMON
	ld [wMonType], a
	farcall GetGender
	jr c, .no
	jr z, .no
	jr .ok

.female
	ld a, TEMPMON
	ld [wMonType], a
	farcall GetGender
	jr c, .no
	jr nz, .no
	jr .ok

.with_party_mon
	pop hl
	call GetNextEvoAttackWord
	push hl
	ld h, b
	ld l, c
	call GetPokemonIDFromIndex
	ld d, a
	ld hl, wPartyCount
	ld a, [hli]
	ld e, a
.party_mon_loop
	ld a, [hli]
	cp d
	jr z, .ok
	cp -1
	jr z, .no
	dec e
	jr z, .no
	jr .party_mon_loop

.dv_high
	ld hl, wTempMonID
	ld a, [hli]
	xor [hl]
	ld hl, wTempMonDVs
	xor [hl]
	inc hl
	xor [hl]
	and %00010000
	jr z, .no
	jr .ok

.dv_low
	ld hl, wTempMonID
	ld a, [hli]
	xor [hl]
	ld hl, wTempMonDVs
	xor [hl]
	inc hl
	xor [hl]
	and %00010000
	jr nz, .no
	jr .ok

.no_skip_byte
	pop hl
	inc hl
	and a
	ret

.no
	pop hl
	and a
	ret

.add_mon
.extra_mon
.ok
	pop hl
	scf
	ret

.in_location
	pop hl
	call GetNextEvoAttackByte
	push hl
	ld c, a
	ld b, 0
	ld hl, LocationEvolutionTable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [wCurLandmark]
	ld c, a
.location_loop
	ld a, [hli]
	cp -1
	jr z, .no
	cp c
	jr z, .ok
	jr .location_loop

INCLUDE "data/pokemon/location_evolution.asm"

UpdateSpeciesNameIfNotNicknamed:
	ld a, [wCurSpecies]
	push af
	ld a, [wBaseSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	pop af
	ld [wCurSpecies], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wPartyMonNicknames
	call AddNTimes
	push hl
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

CancelEvolution:
	ld hl, Text_StoppedEvolving
	call PrintText
	call ClearTileMap
	jp EvolveAfterBattle_MasterLoop

IsMonHoldingEverstone:
	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret

Text_CongratulationsYourPokemon:
	; Congratulations! Your @ @
	text_far UnknownText_0x1c4b92
	text_end

Text_EvolvedIntoPKMN:
	; evolved into @ !
	text_far UnknownText_0x1c4baf
	text_end

Text_StoppedEvolving:
	; Huh? @ stopped evolving!
	text_far UnknownText_0x1c4bc5
	text_end

Text_WhatEvolving:
	; What? @ is evolving!
	text_far UnknownText_0x1c4be3
	text_end

LearnLevelMoves:
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	call SkipEvolutions

.find_move
	call GetNextEvoAttackByte
	and a
	jr z, .done

	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	call GetNextEvoAttackByte
	ld e, a
	call GetNextEvoAttackByte
	ld d, a
	jr nz, .find_move

	push hl
	ld h, d
	ld l, e
	call GetMoveIDFromIndex
	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	call GetNextEvoAttackByte
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	ret

FillMoves:
; Fill in moves at de for wCurPartySpecies at wCurPartyLevel

	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	call SkipEvolutions
	jr .GetLevel

.NextMove:
	pop de
.GetMove:
	inc hl
	inc hl
.GetLevel:
	call GetNextEvoAttackByte
	and a
	jp z, .done
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jp c, .done
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
	ldh a, [hTemp]
	push hl
	call GetFarHalfword
	call GetMoveIDFromIndex
	pop hl
	ld b, a
.CheckRepeat:
	ld a, [de]
	inc de
	cp b
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove:
	pop hl

.LearnMove:
	ldh a, [hTemp]
	push hl
	call GetFarHalfword
	call GetMoveIDFromIndex
	pop hl
	ld b, a
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	push hl
	ld a, b
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl
	ld [hl], a
	pop hl
	jp .NextMove

.done
	pop bc
	pop de
	pop hl
	ret

ShiftMoves:
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret

EvoFlagAction:
	push de
	ld d, $0
	predef SmallFarFlagAction
	pop de
	ret

GetLowestEvolutionStage:
; Return the first mon to evolve into wCurPartySpecies.
; Instead of looking it up, we just load it from a table. This is a lot more efficient.
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld bc, FirstEvoStages - 2
	add hl, hl
	add hl, bc
	ld a, BANK(FirstEvoStages)
	call GetFarHalfword
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ret

SkipEvolutions::
; Receives a pointer to the evos and attacks for a mon in b:hl, and skips to the attacks.
	ld a, b
	call GetFarByte
	inc hl
	and a
	ret z
	cp EVOLVE_LEVEL_WITH_MOVE
	jr z, .inc5
	cp EVOLVE_LEVEL_PARTY_MON
	jr z, .inc5
	cp EVOLVE_LEVEL_IN_LOCATION
	jr z, .inc4
	cp EVOLVE_LEVEL_WITH_ITEM
	jr z, .inc4
	cp EVOLVE_LEVEL_WITH_ITEM_DAY
	jr z, .inc4
	cp EVOLVE_LEVEL_WITH_ITEM_NIGHT
	jr z, .inc4
	cp EVOLVE_STAT
	jr z, .inc4
	jr .inc3

.inc5
	inc hl
.inc4
	inc hl
.inc3
	inc hl
	inc hl
	inc hl
	jr SkipEvolutions

DetermineEvolutionItemResults::
	push bc
	push de
	farcall GetGender
	ld a, -1
	jr c, .got_gender
	ld a, 1
	jr nz, .got_gender
	xor a
.got_gender
	pop de
	pop bc
	ld c, a
; in: b:de: pointer to evos and attacks struct, wCurItem: item
; out: de: species ID or zero; a, b, c, hl: clobbered
	ld h, d
	ld l, e
	ld de, 0
	ld a, b
	ldh [hTemp], a
.loop
	call GetNextEvoAttackByte
	and a
	ret z
	cp EVOLVE_STAT
	jr z, .skip_species_two_parameters
	cp EVOLVE_ITEM
	jr z, .item
	cp EVOLVE_ITEM_FEMALE
	jr z, .item_female
	cp EVOLVE_ITEM_MALE
	jr nz, .skip_species_parameter

.item_male
	ld a, c
	and a
	jr z, .skip_species
	inc a
	jr z, .skip_species
	jr .item

.item_female
	ld a, c
	and a
	jr nz, .skip_species

.item
	call GetNextEvoAttackByte
	ld b, a	
	ld a, [wCurItem]
	cp b
	jr nz, .skip_species
	ldh a, [hTemp]
	call GetFarHalfword
	ld d, h
	ld e, l
	ret

.skip_species_two_parameters
	inc hl
.skip_species_parameter
	inc hl
.skip_species
	inc hl
	inc hl
	jr .loop

GetNextEvoAttackWord:
	call GetNextEvoAttackByte
	ld c, a
	call GetNextEvoAttackByte
	ld b, a
	ret

GetNextEvoAttackByte:
	ldh a, [hTemp]
	call GetFarByte
	inc hl
	ret
