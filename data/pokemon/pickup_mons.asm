SECTION "Pickup Data", ROMX
_IsPickupMon::
	ld a, b
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, PickupMons
	ld de, 2
	call IsInHalfwordArray
	ret

PickupMons:
	dw MEOWTH
	dw AIPOM
	dw TEDDIURSA
	dw PHANPY
	dw ZIGZAGOON
	dw LINOONE
	dw PACHIRISU
	dw AMBIPOM
	dw MUNCHLAX
	dw -1
