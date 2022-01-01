PUSHS
SECTION "Briefcase Menu GFX", ROMX
BriefcaseMenuGFX: INCBIN "gfx/misc/briefcase.2bpp"
.end
BriefcaseMenuObjectGFX: INCBIN "gfx/misc/briefcase_obj.2bpp"
POPS
BriefcaseMenuTilemap: INCBIN "gfx/misc/briefcase.tilemap"
BriefcaseMenuAttrmap: INCBIN "gfx/misc/briefcase.attrmap"

BRIEFCASE_MENU_TILE_CT EQU (BriefcaseMenuGFX.end - BriefcaseMenuGFX) / 16

_ChooseStarter:
	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl] ; 8x16

	call BriefcaseMenu_LoadGFX
	ld a, 1
	ld [wSpriteUpdatesEnabled], a
.loop
	call BriefcaseMenu_Draw
	call BriefcaseMenu_Main
	ld a, [wMenuCursorY]
	push af
	call BriefcaseMenu_AskMon
	jr c, .done
	pop af
	ld [wMenuCursorY], a
	jr .loop

.done
	pop af
	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x8
	ret

BriefcaseMenu_LoadGFX:
; Draw briefcase
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
IF BRIEFCASE_MENU_TILE_CT < $80
	ld de, BriefcaseMenuGFX
	ld b, BANK(BriefcaseMenuGFX)
	ld hl, vTiles2
	ld c, BRIEFCASE_MENU_TILE_CT
	call Get2bpp
ELSE
	ld de, BriefcaseMenuGFX
	ld b, BANK(BriefcaseMenuGFX)
	ld hl, vTiles2
	ld c, $80
	call Get2bpp
IF BRIEFCASE_MENU_TILE_CT < $10
	ld de, BriefcaseMenuGFX + $80 tiles
	ld b, BANK(BriefcaseMenuGFX)
	ld hl, vTiles1
	ld c, BRIEFCASE_MENU_TILE_CT - $80
	call Get2bpp
ELSE
	ld de, BriefcaseMenuGFX + $80 tiles
	ld b, BANK(BriefcaseMenuGFX)
	ld hl, vTiles1
	ld c, $80
	call Get2bpp

	ld a, BANK(vTiles5)
	ldh [rVBK], a
	ld de, BriefcaseMenuGFX + $100 tiles
	ld b, BANK(BriefcaseMenuGFX)
	ld hl, vTiles5
	ld c, BRIEFCASE_MENU_TILE_CT - $100
	call Get2bpp
	xor a
	ldh [rVBK], a
ENDC
ENDC

; load object tiles
	ld de, BriefcaseMenuObjectGFX
	ld b, BANK(BriefcaseMenuObjectGFX)
	ld hl, vTiles0
	ld c, 12
	call Get2bpp
	call EnableLCD

	ret

BriefcaseMenu_Draw:
	decoord 0, 0
	ld bc, SCREEN_WIDTH * (SCREEN_HEIGHT - 6)
	ld hl, BriefcaseMenuTilemap
	call CopyBytes

	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * (SCREEN_HEIGHT - 6)
	ld hl, BriefcaseMenuAttrmap
	call CopyBytes

	call ApplyTilemap
	call WaitBGMap2
	ld b, SCGB_CHOOSE_STARTER
	call GetSGBLayout
	call SetPalettes
	call DelayFrame

	call BriefcaseMenu_SetUpOAM

	ret

BriefcaseMenu_Main:
	ld hl, .NowChooseText
	call PrintText
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp A_BUTTON
	jr z, .a
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	call BriefcaseMenu_DrawCursor
	jr .loop

.left
	ld hl, wMenuCursorY
	ld a, [hl]
	and a
	jr z, .loop
	dec a
	ld [hl], a
	jr .loop

.right
	ld hl, wMenuCursorY
	ld a, [hl]
	cp 2
	jr z, .loop
	inc a
	ld [hl], a
	jr .loop

.a
	ld a, [wMenuCursorY]
	ld [wScriptVar], a
	call PlayClickSFX
	and a
	ret

.NowChooseText:
	text "Now choose!"
	line "Which #MON will"
	cont "it be?"
	done

BriefcaseMenu_DrawCursor:
	ld a, [wMenuCursorY]
	and a
	lb bc, $30, $30
	jr z, .got_coords
	dec a
	lb bc, $40, $50
	jr z, .got_coords
	lb bc, $2c, $68
.got_coords
	ldh a, [hVBlankCounter]
	and %110000
	swap a
	and a
	jr z, .no_move
	and %1
	ld l, 2
	jr nz, .do_move
	ld l, 4
.do_move
	ld a, b
	add l
	ld b, a
.no_move
	ld hl, wVirtualOAMSprite12
; left side
	ld a, b ; y-coord
	ld [hli], a
	ld a, c ; x-coord
	ld [hli], a
	ld a, $08 ; tile
	ld [hli], a
	ld a, 2 ; pal
	ld [hli], a
; right side
	ld a, b ; y-coord
	ld [hli], a
	ld a, c ; x-coord
	add $08
	ld [hli], a
	ld a, $0a ; tile
	ld [hli], a
	ld a, 2 ; pal
	ld [hl], a
	ret

BriefcaseMenu_SetUpOAM:
	ld hl, .OAMData
	ld de, wVirtualOAM
	ld bc, .OAMDataEnd - .OAMData
	jp CopyBytes

briefcase_sprite: MACRO
; tile-x, tile-y, pixel-x, pixel-y, tile, pal
	db \2 * 8 + \4 + 16, \1 * 8 + \3 + 8, \5, \6
ENDM
.OAMData:
	briefcase_sprite  5,  7, 0, 0, $00, 0
	briefcase_sprite  6,  7, 0, 0, $02, 0
	briefcase_sprite  5,  7, 0, 0, $04, 1
	briefcase_sprite  6,  7, 0, 0, $06, 1

	briefcase_sprite  9,  9, 0, 0, $00, 0
	briefcase_sprite 10,  9, 0, 0, $02, 0
	briefcase_sprite  9,  9, 0, 0, $04, 1
	briefcase_sprite 10,  9, 0, 0, $06, 1

	briefcase_sprite 12,  6, 0, 4, $00, 0
	briefcase_sprite 13,  6, 0, 4, $02, 0
	briefcase_sprite 12,  6, 0, 4, $04, 1
	briefcase_sprite 13,  6, 0, 4, $06, 1
.OAMDataEnd:

BriefcaseMenu_AskMon:
; clear oam
	call ClearSprites
	ld a, [wScriptVar]
	ld c, a
	ld b, 0
	ld hl, .Starters
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	call SetPalettes
	call DelayFrame
	farcall Pokepic2
	ld a, [wCurPartySpecies]
	call PlayMonCry
	call WaitSFX

; ask mon
	ld a, [wMenuCursorY]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, .AskMonTexts
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	call YesNoBox
	jr c, .said_no
	scf
	ret

.said_no
	and a
	ret

.Starters:
	dw TURTWIG
	dw CHIMCHAR
	dw PIPLUP

.AskMonTexts:
	dw .AskTurtwigText
	dw .AskChimcharText
	dw .AskPiplupText

.AskTurtwigText:
	text "TINY LEAF #MON"
	line "TURTWIG!"

	para "Will you take this"
	line "#MON?"
	done

.AskChimcharText:
	text "CHIMP #MON"
	line "CHIMCHAR!"

	para "Will you take this"
	line "#MON?"
	done

.AskPiplupText:
	text "PENGUIN #MON"
	line "PIPLUP!"

	para "Will you take this"
	line "#MON?"
	done
