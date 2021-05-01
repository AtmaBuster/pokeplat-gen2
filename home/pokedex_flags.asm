SetSeenAndCaughtMon::
	call GetPokemonFlagIndex
	push de
	call SetSeenMonIndex
	pop de
SetCaughtMonIndex::
	ld hl, wPokedexCaught
	jr SetPokedexStatusMonIndex

SetSeenMon::
	call GetPokemonFlagIndex
SetSeenMonIndex::
	ld hl, wPokedexSeen
SetPokedexStatusMonIndex:
	ld b, SET_FLAG
	jr FlagActionBaseOne

CheckCaughtMon::
	call GetPokemonFlagIndex
CheckCaughtMonIndex::
	ld hl, wPokedexCaught
	jr CheckPokedexStatusMonIndex

CheckSeenMon::
	call GetPokemonFlagIndex
CheckSeenMonIndex::
	ld hl, wPokedexSeen
CheckPokedexStatusMonIndex:
	ld b, CHECK_FLAG
FlagActionBaseOne:
	dec de
	jp FlagAction

GetPokemonFlagIndex:
	call GetPokemonIndexFromID
; if mon is alt form, use base form id
	ld a, h
	cp HIGH(ALT_FORMS)
	jr c, .ok
	ld a, l
	cp LOW(ALT_FORMS)
	jr c, .ok
	ld de, AltFormBaseIndex - ALT_FORMS * 2
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.ok
	ld d, h
	ld e, l
	ret

INCLUDE "data/pokemon/base_forms.asm"
