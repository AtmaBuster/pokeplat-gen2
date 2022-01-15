GBCOnlyScreen:
	ldh a, [hCGB]
	and a
	ret nz

	ld a, $e4
	ldh [rBGP], a

	ld de, MUSIC_PRINTER
	call PlayMusic

	call ClearTileMap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	ld a, 0 ; this has the same effect as selecting bank 1
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop

DrawGBCOnlyScreen:
	call DrawGBCOnlyBorder

	; Pokemon
	hlcoord 3, 2
	ld b, 14
	ld c, 4
	ld a, $8
	call DrawGBCOnlyGraphic

	; Crystal
	hlcoord 5, 6
	ld b, 10
	ld c, 2
	ld a, $40
	call DrawGBCOnlyGraphic

	ld de, GBCOnlyString
	hlcoord 1, 10
	call PlaceString

	ret

DrawGBCOnlyBorder:
	hlcoord 0, 0
	ld [hl], 0 ; top-left

	inc hl
	ld a, 1 ; top
	call .FillRow

	ld [hl], 2 ; top-right

	hlcoord 0, 1
	ld a, 3 ; left
	call .FillColumn

	hlcoord 19, 1
	ld a, 4 ; right
	call .FillColumn

	hlcoord 0, 17
	ld [hl], 5 ; bottom-left

	inc hl
	ld a, 6 ; bottom
	call .FillRow

	ld [hl], 7 ; bottom-right
	ret

.FillRow:
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret

.FillColumn:
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret

DrawGBCOnlyGraphic:
	ld de, SCREEN_WIDTH
.y
	push bc
	push hl
.x
	ld [hli], a
	inc a
	dec b
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .y
	ret

GBCOnlyString:
	db   "This Game Pak is"
	next "designed only for"
	next "use on the"
	next "Game Boy Color.@"

GBCOnlyGFX:
INCBIN "gfx/sgb/gbc_only.2bpp.lz"

MBC30_TEST_STRING EQUS "\"MBC30TestString.\""

MBC30ErrorScreen:
; test MBC30
	ld c, 8
	ld hl, MBC30_TestLocations
.string_loop
	ld b, 16
	ld de, .TestString
	push hl
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
.char_loop
	push hl
	push af
	call GetFarByte
	ld h, a
	ld a, [de]
	cp h
	jr nz, .error
	pop af
	pop hl
	inc hl
	inc de
	dec b
	jr nz, .char_loop
	pop hl
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .string_loop
; all checks OK
	ret

.error
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals

	ld de, MUSIC_PRINTER
	call PlayMusic

	call ClearTileMap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	ld a, 0 ; this has the same effect as selecting bank 1
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawMBC30Screen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop

.TestString:
	db MBC30_TEST_STRING

DrawMBC30Screen:
	call DrawGBCOnlyBorder

	; Pokemon
	hlcoord 3, 2
	ld b, 14
	ld c, 4
	ld a, $8
	call DrawGBCOnlyGraphic

	; Crystal
	hlcoord 5, 6
	ld b, 10
	ld c, 2
	ld a, $40
	call DrawGBCOnlyGraphic

	ld de, MBC30ErrorString
	hlcoord 1, 8
	call PlaceString

	ret

MBC30ErrorString:
	db   "Your flash cart or"
	next "emulator does not"
	next "support MBC30."
	next "Please use BGB,"
	next "mGBA, or SameBoy.@"

MBC30_TestLocations:
	dba MBC30Test_09
	dba MBC30Test_22
	dba MBC30Test_46
	dba MBC30Test_7A
	dba MBC30Test_B0
	dba MBC30Test_C6
	dba MBC30Test_D6
	dba MBC30Test_EA

PUSHS
SECTION "MBC30 Test 1", ROMX, BANK[$09]
MBC30Test_09:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 2", ROMX, BANK[$22]
MBC30Test_22:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 3", ROMX, BANK[$46]
MBC30Test_46:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 4", ROMX, BANK[$7A]
MBC30Test_7A:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 5", ROMX, BANK[$B0]
MBC30Test_B0:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 6", ROMX, BANK[$C0]
MBC30Test_C6:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 7", ROMX, BANK[$D6]
MBC30Test_D6:
	db MBC30_TEST_STRING
SECTION "MBC30 Test 8", ROMX, BANK[$EA]
MBC30Test_EA:
	db MBC30_TEST_STRING

POPS
