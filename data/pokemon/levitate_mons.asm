SECTION "Levitate Data", ROMX
_IsLevitateMon::
	ld a, b
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, LevitateMons
	ld de, 2
	call IsInHalfwordArray
	ret

LevitateMons:
	dw VIBRAVA
	dw FLYGON
	dw -1
