smartcp: MACRO
IF \1 == 0
	and a
ELSE
	cp \1
ENDC
ENDM

cphl16: MACRO
; arg1: 16 bit register
; arg2: value to compare to
	ld a, h
	smartcp HIGH(\1)
	jr c, .done\@
	jr nz, .done\@
	ld a, l
	smartcp LOW(\1)
.done\@
ENDM

DebugMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate
	ld hl, .MenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call SafeUpdateSprites
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	farcall LoadFonts_NoOAMUpdate
	call UpdateTimePals
	call .GetInput
	jr c, .Exit
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
	call ExitMenu
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
	xor a
	ldh [hBGMapMode], a
	call SetUpMenu
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b
	cp A_BUTTON
	jr z, .a
	jr .loop
.a
	call PlayClickSFX
	and a
	ret
.b
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_ENABLE_START ; flags
	db 0 ; rows, columns
	dw .MenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "Sound Test@"
	db "Subgame@"
	db "Warp@"
	db "Color@"
	db "Fill Dex@"
	db "Teach Move@"
	db "Give #@"
	db "NULL@"

.MenuItems
	db 8
	db 0, 1, 2, 3, 4, 5, 6, 7
	db -1

.Jumptable
	dw Debug_SoundTest
	dw Debug_SubgameMenu
	dw Debug_Warp
	dw Debug_ColorPicker
	dw Debug_FillDex
	dw Debug_TeachMove
	dw Debug_GivePoke
	dw NULL

Debug_SoundTest:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	jp z, .end
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .play
	and D_UP | D_DOWN
	jr nz, .change
	jr .loop

.change
	ldh a, [hDebugMenuCursorPos]
	inc a
	and 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .get_value
.left_loop
	dec de
	dec a
	jr nz, .left_loop
	call .put_value
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc de
	dec a
	jr nz, .right_loop
	call .put_value
	call .update_display
	jr .loop

.update_display
	hlcoord 1, 2
	ld a, " "
	ld [hl], a
	hlcoord 1, 5
	ld a, " "
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .update_music
	hlcoord 1, 5
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 5
	ld de, hDebugMenuDataBuffer + 2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

.update_music
	hlcoord 1, 2
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld bc, 18
	ld a, " "
	call ByteFill
	ld hl, Debug_MusicNames
	ld bc, 18
	ldh a, [hDebugMenuDataBuffer + 1]
	cp a, 103
	jp nc, .loop
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 1, 3
	call PlaceString
	ret

.play
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .play_music
	call .get_value
	call PlaySFX
	;call WaitSFX
	jp .loop

.play_music
	ld de, 0
	call PlayMusic
	call DelayFrame
	call .get_value
	call PlayMusic
	jp .loop

.end
	ret

.get_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ldi a, [hl]
	ld e, [hl]
	ld d, a
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ld a, d
	ldi [hl], a
	ld [hl], e
	ret

INCLUDE "engine/debug/music_names.asm"

Debug_SubgameMenu:
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	dec a
	ld bc, 3
	ld hl, .Jumptable
	call AddNTimes
	ldi a, [hl]
	ld b, a
	ldi a, [hl]
	ld h, [hl]
	ld l, a
	ld a, b
	rst $08
	ret

.Jumptable:
	dba SlotMachine
	dba CardFlip

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 10, 0, SCREEN_WIDTH - 1, 7
	dw .MenuData
	db 1 ; default

.MenuData:
	db STATICMENU_CURSOR
	db 2 ; # items
	db "Slots@"
	db "Card@"

Debug_Warp:
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	hlcoord 0, 0
	call Textbox
	ld hl, .MenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	ret nz
	ld a, [wMenuSelection]
	cp -1
	ret z
	dec a
	ld c, a
	ld b, 0
	ld hl, .SpawnTable
	add hl, bc
	ld a, [hl]
	ld [wDefaultSpawnpoint], a
	farcall FlyFunction.DoFly
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.SpawnTable
	db SPAWN_HOME
	db SPAWN_DEBUG
	db SPAWN_PALLET
	db SPAWN_VIRIDIAN
	db SPAWN_PEWTER
	db SPAWN_CERULEAN
	db SPAWN_ROCK_TUNNEL
	db SPAWN_VERMILION
	db SPAWN_LAVENDER
	db SPAWN_SAFFRON
	db SPAWN_CELADON
	db SPAWN_FUCHSIA
	db SPAWN_CINNABAR
	db SPAWN_INDIGO
	db SPAWN_NEW_BARK
	db SPAWN_CHERRYGROVE
	db SPAWN_VIOLET
	db SPAWN_UNION_CAVE
	db SPAWN_AZALEA
	db SPAWN_CIANWOOD
	db SPAWN_GOLDENROD
	db SPAWN_OLIVINE
	db SPAWN_ECRUTEAK
	db SPAWN_MAHOGANY
	db SPAWN_LAKE_OF_RAGE
	db SPAWN_BLACKTHORN
	db SPAWN_MT_SILVER
	db SPAWN_FAST_SHIP
NUM_DEBUG_SPAWNS EQU 28

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1

.MenuData:
	db 0
	db 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .Items
	dba .DrawItem
	dba NULL

.Items:
	db NUM_DEBUG_SPAWNS
x = 1
rept NUM_DEBUG_SPAWNS
	db x
x = x + 1
endr
	db -1

.DrawItem:
	push de
	ld a, [wMenuSelection]
	dec a
	ld hl, .LocNames
	ld bc, 13
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

.LocNames:
	db "HOME@@@@@@@@@"
	db "DEBUG@@@@@@@@"
	db "PALLET@@@@@@@"
	db "VIRIDIAN@@@@@"
	db "PEWTER@@@@@@@"
	db "CERULEAN@@@@@"
	db "ROCK TUNNEL@@"
	db "VERMILION@@@@"
	db "LAVENDER@@@@@"
	db "SAFFRON@@@@@@"
	db "CELADON@@@@@@"
	db "FUCHSIA@@@@@@"
	db "CINNABAR@@@@@"
	db "INDIGO@@@@@@@"
	db "NEW BARK@@@@@"
	db "CHERRYGROVE@@"
	db "VIOLET@@@@@@@"
	db "UNION CAVE@@@"
	db "AZALEA@@@@@@@"
	db "CIANWOOD@@@@@"
	db "GOLDENROD@@@@"
	db "OLIVINE@@@@@@"
	db "ECRUTEAK@@@@@"
	db "MAHOGANY@@@@@"
	db "LAKE OF RAGE@"
	db "BLACKTHORN@@@"
	db "MT. SILVER@@@"
	db "FAST SHIP@@@@"

Debug_ColorPicker:
	farcall DebugColorPicker
	ret

INCLUDE "engine/debug/color_picker.asm"

Debug_FillDex:
; give pokedex
	ld de, ENGINE_POKEDEX
	ld b, SET_FLAG
	farcall EngineFlagAction
; set flags
	ld hl, 0
.loop
	inc hl
	ld a, h
	cp HIGH(ALT_FORMS)
	jr nz, .setflag
	ld a, l
	cp LOW(ALT_FORMS)
	ret z
.setflag
	push hl
	call GetPokemonIDFromIndex
	call SetSeenAndCaughtMon
	pop hl
	jr .loop

Debug_TeachMove:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp A_BUTTON
	jr z, .teach
	ld b, a
	ldh a, [hJoyDown]
	and $f
	or b
	cp D_LEFT
	jr z, .left1
	cp D_RIGHT
	jr z, .right1
	cp D_DOWN
	jr z, .left10
	cp D_UP
	jr z, .right10
	cp D_LEFT | SELECT
	jr z, .left100
	cp D_RIGHT | SELECT
	jr z, .right100
	jr .loop

.left1
	call .left
	call .update_display
	jr .loop

.right1
	call .right
	call .update_display
	jr .loop

.left100
	ld c, 100
	jr .left10loop

.right100
	ld c, 100
	jr .right10loop

.left10
	ld c, 10
.left10loop
	call .left
	dec c
	jr nz, .left10loop
	call .update_display
	jr .loop

.right10
	ld c, 10
.right10loop
	call .right
	dec c
	jr nz, .right10loop
	call .update_display
	jr .loop

.teach
	xor a
	ld [wCurPartyMon], a
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	call GetMoveIDFromIndex
	ld [wTempTMHM], a
	ld [wPutativeTMHMMove], a
	call GetMoveName
	ld de, wStringBuffer2
	ld hl, wStringBuffer1
	ld bc, 13
	call CopyBytes
	predef LearnMove
	ret

.left
	ldh a, [hDebugMenuDataBuffer + 1]
	and a
	jr nz, .go_left
	ldh a, [hDebugMenuDataBuffer]
	and a
	jr nz, .go_left2
	ld a, HIGH(NUM_ATTACKS - 1)
	ldh [hDebugMenuDataBuffer], a
	ld a, LOW(NUM_ATTACKS - 1)
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.go_left2
	dec a
	ldh [hDebugMenuDataBuffer], a
	xor a
.go_left
	dec a
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.right
	ldh a, [hDebugMenuDataBuffer + 1]
	cp LOW(NUM_ATTACKS - 1)
	jr nz, .go_right
	ldh a, [hDebugMenuDataBuffer]
	cp HIGH(NUM_ATTACKS - 1)
	jr nz, .go_right
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.go_right
	ldh a, [hDebugMenuDataBuffer + 1]
	inc a
	ldh [hDebugMenuDataBuffer + 1], a
	ret nz
	ldh a, [hDebugMenuDataBuffer]
	inc a
	ldh [hDebugMenuDataBuffer], a
	ret

.update_display
	hlcoord 3, 2
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	ld hl, hDebugMenuDataBuffer
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and a
	jr nz, .doname
	ld a, l
	and a
	ret z
.doname
	call GetMoveIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	hlcoord 1, 3
	ld de, wStringBuffer1
	call PlaceString
	ret

Debug_GivePoke:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	ldh [hDebugMenuDataBuffer + 4], a
	ldh [hDebugMenuDataBuffer + 5], a
	hlcoord 0, 0
	lb bc, 8, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 2
	ldh [hDebugMenuCursorPos], a
	call .update_display
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display

.loop
	call JoyTextDelay
	ldh a, [hJoyDown]
	and $e
	ld b, a
	ldh a, [hJoyLast]
	or b
	bit A_BUTTON_F, a
	jr nz, .givepoke
	bit B_BUTTON_F, a
	ret nz
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	ld b, 1
	bit START_F, a
	jr nz, .start
	bit SELECT_F, a
	jr z, .select
	ld b, 10
	jr .select
.start
	ld b, 100
.select
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	jr .loop

.up
	ldh a, [hDebugMenuCursorPos]
	and a
	jr nz, .do_up
	ld a, 3
.do_up
	dec a
	jr .curchange

.down
	ldh a, [hDebugMenuCursorPos]
	cp 2
	jr nz, .do_down
	ld a, -1
.do_down
	inc a
.curchange
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .getdat
.leftloop
	dec hl
	dec b
	jr nz, .leftloop
	call .putdat
	call .update_display
	jr .loop

.right
	call .getdat
.rightloop
	inc hl
	dec b
	jr nz, .rightloop
	call .putdat
	call .update_display
	jr .loop

.getdat
	ldh a, [hDebugMenuCursorPos]
	add a
	add LOW(hDebugMenuDataBuffer)
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	dec c
	ret

.putdat
	ld a, h
	ldh [c], a
	inc c
	ld a, l
	ldh [c], a
	ret

.givepoke
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	jp z, .loop
	cphl16 NUM_POKEMON + 1
	jp nc, .loop
	ldh a, [hDebugMenuDataBuffer + 5]
	and a
	jp z, .loop
	cp 101
	jp nc, .loop
	ld [wCurPartyLevel], a
	ldh a, [hDebugMenuDataBuffer + 3]
	ld [wCurItem], a
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld b, 0
	farcall GivePoke
	ret

.update_display
	ld a, " "
	hlcoord 1, 2
	ld [hl], a
	hlcoord 1, 5
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .put_mon
	dec a
	jr z, .put_item

; fallthrough
.put_level
	hlcoord 1, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 8
	ld a, "L"
	ld [hli], a
	ld a, "v"
	ld [hli], a
	inc hl
	ld de, hDebugMenuDataBuffer + 5
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.put_mon
	hlcoord 1, 2
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	ret z
	cphl16 NUM_POKEMON + 1
	ret nc
	push hl
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	pop hl
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 1, 3
	call PlaceString
	ret

.put_item
	hlcoord 1, 5
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 5
	ld de, hDebugMenuDataBuffer + 3
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 6
	ld bc, 18
	ld a, " "
	call ByteFill
	ldh a, [hDebugMenuDataBuffer + 3]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld de, wStringBuffer1
	hlcoord 1, 6
	call PlaceString
	ret
