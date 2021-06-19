_ChangePartyMonSpecies::
	call GetPokemonIDFromIndex
ChangePartyMonSpeciesID:
	push bc
	push hl

	ld [wCurSpecies], a
	push af
	call GetBaseData
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	pop af
	ld [hl], a
	push af
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop af
	ld [hl], a
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld bc, MON_MAXHP - MON_LEVEL
	add hl, bc
	ld d, h
	ld e, l
	ld bc, MON_STAT_EXP - 1 - MON_MAXHP
	add hl, bc
	ld b, TRUE
	predef CalcMonStats

	pop hl
	pop bc
	ret

ChangePartyMonFormMenu::
	ld a, [wPartyCount]
	and a
	jp z, .no_mons
	call SelectFormChangeMon
	jp nc, .try_form_change
	call ReturnToMapWithSpeechTextbox
	ld a, FORMCHANGE_DECLINED
	ld [wScriptVar], a
	ret

.try_form_change
	ld a, [wPartyMenuCursor]
	dec a
	ld [wCurPartyMon], a
	call ChangePartyMonForm
	call ReturnToMapWithSpeechTextbox
	ret

.no_mons
	call ReturnToMapWithSpeechTextbox
	ld a, FORMCHANGE_NOMONS
	ld [wScriptVar], a
	ret

ChangePartyMonForm::
	ld a, [wScriptVar]
	dec a ; 1-index to 0-index
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, FormChangeMons
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld a, [wCurPartySpecies]
	push hl
	call GetPokemonIndexFromID
	ld d, h
	ld e, l
	pop hl
; check if chosen mon can become target mon
.loop
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, c
	cp -1
	jr nz, .check_mon
	ld a, b
	cp -1
	jr z, .invalid_mon
.check_mon
	ld a, b
	cp d
	jr nz, .loop
	ld a, c
	cp e
	jr nz, .loop
; valid mon
	ld a, [wPartyMenuCursor]
	dec a
	ld [wCurPartyMon], a
	pop de
	ld h, d
	ld l, e

	call _ChangePartyMonSpecies

; buffer the mon's nickname into wStringBuffer2
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld de, wStringBuffer2
	call CopyBytes
; return success code
	ld a, FORMCHANGE_SUCCESSFUL
	ld [wScriptVar], a
	ret

.invalid_mon
	pop de
	ld a, FORMCHANGE_INVALIDMON
	ld [wScriptVar], a
	ret

INCLUDE "data/pokemon/form_changes.asm"

ChangeBurmyCloak::
; get Burmy ID's into registers
	ld hl, BURMY
	call GetPokemonIDFromIndex
	ld d, a
	ld hl, BURMY_S
	call GetPokemonIDFromIndex
	ld c, a
	ld hl, BURMY_T
	call GetPokemonIDFromIndex
	ld b, a
	ld e, -1
	ld hl, wPartySpecies
.loop
	inc e
	ld a, e
	cp 6
	ret nc
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .hit
	cp c
	jr z, .hit
	cp d
	jr nz, .loop
.hit
	push bc
	push de
	push hl
; did this Burmy battle?
	ld c, e
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wGainedEXPFlags
	farcall SmallFarFlagAction
	jr z, .miss
; change Burmy form
	ld a, [wMapTileset]
	ld c, a
	ld b, 0
	ld hl, BurmyCloakTilesets
	add hl, bc
	ld a, [hl]
	ld hl, sp+2
	inc a
.form_get_loop
	inc hl
	dec a
	jr nz, .form_get_loop
	ld a, e
	ld [wCurPartyMon], a
	ld a, [hl]
	call ChangePartyMonSpeciesID
	pop hl
	pop de
	pop bc
	jr .loop

.miss
	pop hl
	pop de
	pop bc
	jr .loop

INCLUDE "data/tilesets/burmy_cloak_tilesets.asm"
