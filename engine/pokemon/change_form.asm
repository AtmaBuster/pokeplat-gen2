SECTION "Form Change", ROMX

ChangePartyMonForm::
	ld a, [wPartyCount]
	and a
	jp z, .no_mons
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	jr c, .decline

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
	pop de
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	push af
	call GetBaseData
	ld a, [wPartyMenuCursor]
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	pop af
	ld [hl], a
	push af
	ld a, [wPartyMenuCursor]
	dec a
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
	ret

.no_mons
	ld a, FORMCHANGE_NOMONS
	ld [wScriptVar], a
	ret

.decline
	ld a, FORMCHANGE_DECLINED
	ld [wScriptVar], a
	ret

.invalid_mon
	pop de
	ld a, FORMCHANGE_INVALIDMON
	ld [wScriptVar], a
	ret

FormChangeMons:
	dw FormDataDeoxys
	dw FormDataDeoxysA
	dw FormDataDeoxysD
	dw FormDataDeoxysS
	dw FormDataRotom
	dw FormDataRotomFly
	dw FormDataRotomFre
	dw FormDataRotomGrs
	dw FormDataRotomIce
	dw FormDataRotomWtr
	dw FormDataShaymin
	dw FormDataShayminS

FormDataDeoxys:
	dw DEOXYS
	dw DEOXYS_A, DEOXYS_D, DEOXYS_S
	dw -1

FormDataDeoxysA:
	dw DEOXYS_A
	dw DEOXYS, DEOXYS_D, DEOXYS_S
	dw -1

FormDataDeoxysD:
	dw DEOXYS_D
	dw DEOXYS, DEOXYS_A, DEOXYS_S
	dw -1

FormDataDeoxysS:
	dw DEOXYS_S
	dw DEOXYS, DEOXYS_A, DEOXYS_D
	dw -1

FormDataRotom:
	dw ROTOM
	dw ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomFly:
	dw ROTOM_FLY
	dw ROTOM, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomFre:
	dw ROTOM_FRE
	dw ROTOM, ROTOM_FLY, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomGrs:
	dw ROTOM_GRS
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomIce:
	dw ROTOM_ICE
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_WTR
	dw -1

FormDataRotomWtr:
	dw ROTOM_WTR
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE
	dw -1

FormDataShaymin:
	dw SHAYMIN
	dw SHAYMIN_S
	dw -1

FormDataShayminS:
	dw SHAYMIN_S
	dw SHAYMIN
	dw -1
