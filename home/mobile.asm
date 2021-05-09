Function3e32::
Function3e60::
MobileReceive::
Function3eea::
Function3f20::
Function3f35::
MobileHome_PlaceBox:
; stubbed
	ret

Function3f7c::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	jp Function3eea

Function3f88::
	ld hl, wDecompressScratch
	ld b, 0
.row
	push bc
	ld c, 1 tiles / 2
.col
	ld a, [de]
	inc de
	cpl
	ld [hl], 0
	inc hl
	ld [hli], a
	dec c
	jr nz, .col
	pop bc
	dec c
	jr nz, .row
	ret

Function3f9f::
	ld hl, wDecompressScratch
.row
	push bc
	ld c, 1 tiles / 2
.col
	ld a, [de]
	inc de
	inc de
	cpl
	ld [hl], $0
	inc hl
	ld [hli], a
	dec c
	jr nz, .col
	pop bc
	dec c
	jr nz, .row
	ret
