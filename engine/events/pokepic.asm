Pokepic2::
	ld hl, Pokepic2MenuHeader
	call CopyMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	ld b, SCGB_CHOOSE_STARTER_POKEPIC
	call GetSGBLayout
	call SetPalettes
	xor a
	ldh [hBGMapMode], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ldh a, [rVBK]
	push af
	ld a, BANK(vTiles5)
	ldh [rVBK], a
	ld de, vTiles5
	predef GetMonFrontpic
	pop af
	ldh [rVBK], a
	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	call Coord2Tile
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

Pokepic::
	ld hl, PokepicMenuHeader
	call CopyMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	ld b, SCGB_POKEPIC
	call GetSGBLayout
	xor a
	ldh [hBGMapMode], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld de, vTiles1
	predef GetMonFrontpic
	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	call Coord2Tile
	ld a, $80
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

ClosePokepic::
	ld hl, PokepicMenuHeader
	call CopyMenuHeader
	call ClearMenuBoxInterior
	call WaitBGMap
	call GetMemSGBLayout
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call LoadStandardFont
	ret

PokepicMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 14, 13
	dw NULL
	db 1 ; default option

Pokepic2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 1, 12, 10
	dw NULL
	db 1 ; default option
