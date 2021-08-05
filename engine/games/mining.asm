SECTION "Mining Game", ROMX

PICK_HIT_SFX       EQU SFX_EGG_CRACK
HAMMER_HIT_SFX     EQU SFX_BELLY_DRUM
WALL_HIT_SFX       EQU SFX_SHINE
ITEM_GET_SFX       EQU SFX_HIT_END_OF_EXP_BAR
COLLAPSE_SHAKE_SFX EQU SFX_MOVE_PUZZLE_PIECE
COLLAPSE_ANIM_SFX  EQU SFX_MOVE_PUZZLE_PIECE

ForcePlaySFX:
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret

MINING_GAME_MIN_CRACK EQU 10
MINING_GAME_MAX_HITS EQU 57 + MINING_GAME_MIN_CRACK

MINING_GAME_NUM_ITEMS EQU 19

NUM_UNIQUE_ROCK_LAYERS EQU 32
NUM_ROCK_LAYERS EQU NUM_UNIQUE_ROCK_LAYERS * 2

_MiningGame:
	call .InitGFX
	call WaitBGMap2
	call DelayFrame
.loop
	call MiningLoop
	jr nc, .loop
	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x16
	ret

.InitGFX:
	call ClearBGPalettes
	call ClearScreen
	call ClearSprites
	call DelayFrame
	call DisableLCD
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, " "
	call ByteFill
	ld b, SCGB_MINING_GAME
	call GetSGBLayout
	farcall ClearSpriteAnims
	ld hl, wMiningGame
	ld bc, wMiningGameEnd - wMiningGame
	xor a
	call ByteFill

	ld hl, MiningGameOB
	ld de, vTiles0 tile $00
	call Decompress

	ld hl, MiningGameBG
	ld de, vTiles2 tile $00
	call Decompress

	ld hl, MiningGameTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * 12
	call CopyBytes

	ld hl, MiningGameAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * 12
	call CopyBytes

	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl] ; 8x16

	call EnableLCD
	call .GetPals

	ld a, 6
	ld [wMenuCursorX], a
	ld a, 4
	ld [wMenuCursorY], a

	xor a
	ld [wJumptableIndex], a

	ret

.GetPals:
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret

MiningGame_GetBoardLocation:
; gets board in hl at (b, c)
	ld a, c
	push bc
	ld c, b
	ld b, 0
	add hl, bc
	ld bc, 13
	call AddNTimes
	pop bc
	ret

MiningLoop:
	call PlaceToolBoxOAM
	call MiningGame_PlaceCursor
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .end
	call MiningJumptable
	call DelayFrame
	and a
	ret

.end
	scf
	ret

MiningJumptable:
	jumptable .Jumptable, wJumptableIndex

; jumptable constants
	const_def
	const MINING_INIT
	const MINING_START_TEXT
	const MINING_START_PLAY
	const MINING_PLAY
	const MINING_TOOL_ANIM
	const MINING_MINE
	const MINING_COLLAPSE
	const MINING_RESULTS
	const MINING_QUIT

.Jumptable:
	dw MiningAction_Init
	dw MiningAction_StartText
	dw MiningAction_StartPlay
	dw MiningAction_Play
	dw MiningAction_ToolAnim
	dw MiningAction_Mine
	dw MiningAction_Collapse
	dw MiningAction_Results
	dw MiningAction_Quit

MiningAction_Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

MiningAction_Init:
	call MiningGame_GenerateBoard
	call MiningGame_GenerateItems
	call MiningGame_GenerateObstacles
	call MiningGame_ModifyBoard
	call MiningGame_FinishBoard

	call MiningGame_DrawBoard
	call MiningGame_DrawCrack

	call MiningAction_Next
	ret

MiningAction_StartText:
	ld hl, MiningText_SomethingPinged
	call PrintText

	call MiningAction_Next
	ret

MiningAction_StartPlay:
	ld hl, MiningText_Empty
	call PrintText

	xor a
	ld [wMiningFoundNewObjectTile], a

	call MiningAction_Next
	ret

MiningAction_Play:
	call JoyTextDelay
	ldh a, [hJoyLast]
	and D_PAD
	jr nz, MiningGame_HandleJoypad
	ldh a, [hJoypadPressed]
	bit B_BUTTON_F, a
	jr nz, .swap_tools
	bit A_BUTTON_F, a
	jr nz, MiningGame_UseTool
IF DEF(_DEBUG)
	bit SELECT_F, a
	ret z
	ld a, MINING_GAME_MIN_CRACK
	ld [wMiningHitsLeft], a
ENDC
	ret

.swap_tools
	ld a, [wMiningTool]
	xor 1
	ld [wMiningTool], a
	ret

.end
	ld a, MINING_QUIT
	ld [wJumptableIndex], a
	ret

MiningGame_UseTool:
	ld a, MINING_TOOL_ANIM
	ld [wJumptableIndex], a
	ret

MiningGame_HandleJoypad:
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	ret

.down
	ld a, [wMenuCursorY]
	cp 9
	ret nc
	inc a
	ld [wMenuCursorY], a
	jr .reset_cursor_anim

.up
	ld a, [wMenuCursorY]
	and a
	ret z
	dec a
	ld [wMenuCursorY], a
	jr .reset_cursor_anim

.left
	ld a, [wMenuCursorX]
	and a
	ret z
	dec a
	ld [wMenuCursorX], a
	jr .reset_cursor_anim

.right
	ld a, [wMenuCursorX]
	cp 12
	ret nc
	inc a
	ld [wMenuCursorX], a

.reset_cursor_anim
	ld a, $10
	ld [wMiningGameAnimTimer], a
	ret

MiningAction_ToolAnim:
	ld a, 8
	ld [wMiningGameAnimTimer], a
.loop
	call .anim_frame
	call DelayFrame
	ld hl, wMiningGameAnimTimer
	dec [hl]
	jr nz, .loop
	call MiningAction_Next

	ld a, $10
	ld [wMiningGameAnimTimer], a

	ld a, $a0
	ld [wVirtualOAMSprite17], a
	xor a
	ld [wVirtualOAMSprite17 + 1], a
	ld [wVirtualOAMSprite17 + 2], a
	ld [wVirtualOAMSprite17 + 3], a
	ret

.anim_frame
	ld a, [wMiningTool]
	and a
	ld a, [wMiningGameAnimTimer]
	jr z, .pickaxe_frame
	cp 4
	ld hl, .hammer1
	jr nc, .copy_oam
	ld hl, .hammer2
	jr .copy_oam

.pickaxe_frame
	cp 4
	ld hl, .pick1
	jr nc, .copy_oam
	ld hl, .pick2

.copy_oam
	ld a, [wMenuCursorX]
	add a
	add a
	add a
	ld b, a
	ld a, [wMenuCursorY]
	add a
	add a
	add a
	ld c, a
	ld de, wVirtualOAMSprite16
	ld a, [hli]
.copy_loop
	push af

	ld a, [hli]
	add c
	ld [de], a
	inc de

	ld a, [hli]
	add b
	ld [de], a
	inc de

	ld a, [hli]
	ld [de], a
	inc de

	ld a, [hli]
	ld [de], a
	inc de

	pop af
	dec a
	jr nz, .copy_loop
	ret

.oam_data
.hammer1
	db 2
	dsprite 3, 0, 0, 4, $20, 4
	dsprite 3, 0, 1, 4, $22, 4
.hammer2
	db 2
	dsprite 3, 0, 0, 4, $24, 4
	dsprite 3, 0, 1, 4, $26, 4
.pick1
	db 2
	dsprite 3, 0, 0, 4, $28, 6
	dsprite 3, 0, 1, 4, $2a, 6
.pick2
	db 2
	dsprite 3, 0, 0, 4, $2c, 6
	dsprite 3, 0, 1, 4, $2e, 6

trymininglocation: MACRO
	lb bc, \1, \2
	call MiningGame_GetLocationOffset
	jr nc, .skip_\@
	ld hl, wMiningBoardDebris
	call MiningGame_GetBoardLocation
	call .mine\3
.skip_\@
ENDM

MiningAction_Mine:
	call MiningAction_Next

; increase mining counter
	ld a, [wMiningTool]
	inc a
	ld hl, wMiningHitsLeft
	add [hl]
	ld [hl], a

; do center
	lb bc, 0, 0
	call MiningGame_GetLocationOffset
	ld hl, wMiningBoardDebris
	call MiningGame_GetBoardLocation
	call .mine2
	jr nz, .no_wall_or_object

	ld hl, wMiningBoardBase
	call MiningGame_GetBoardLocation
	ld a, [hl]
	and a
	jr z, .no_wall_or_object
	and $60
	jp z, .hit_wall

.no_wall_or_object
	ld a, [wMiningTool]
	and a
	jp z, .pickaxe

	ld de, HAMMER_HIT_SFX
	call ForcePlaySFX

	trymininglocation -1, -1, 1
	trymininglocation  0, -1, 2
	trymininglocation  1, -1, 1
	trymininglocation -1,  0, 2
	trymininglocation  1,  0, 2
	trymininglocation -1,  1, 1
	trymininglocation  0,  1, 2
	trymininglocation  1,  1, 1

	call MiningGame_UpdateObjects
	jp MiningGame_DrawBoard

.pickaxe
	ld de, PICK_HIT_SFX
	call ForcePlaySFX

	trymininglocation  0, -1, 1
	trymininglocation -1,  0, 1
	trymininglocation  1,  0, 1
	trymininglocation  0,  1, 1

	call MiningGame_UpdateObjects
	jp MiningGame_DrawBoard

.mine2
	call .mine1
.mine1
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	ret

.hit_wall
; play sfx
	ld de, WALL_HIT_SFX
	call ForcePlaySFX
; return
	jp MiningGame_DrawBoard

MiningGame_GetLocationOffset:
	ld a, [wMenuCursorX]
	ld d, a
	ld a, [wMenuCursorY]
	ld e, a

	ld a, b
	cp -1
	jr z, .x_minus_1
	cp 1
	jr nz, .try_y

; x_plus_1
	ld a, d
	cp 12
	jr z, .oob
	jr .try_y

.x_minus_1
	ld a, d
	and a
	jr z, .oob

.try_y
	ld a, c
	cp -1
	jr z, .y_minus_1
	cp 1
	jr nz, .ok

; y_plus_1
	ld a, e
	cp 9
	jr z, .oob
	jr .ok

.y_minus_1
	ld a, e
	and a
	jr z, .oob

.ok
	ld a, b
	add d
	ld b, a
	ld a, c
	add e
	ld c, a
	scf
	ret

.oob
	and a
	ret

MiningAction_Collapse:
	call MiningGame_DrawCrack

	ld a, [wMiningFoundNewObjectTile]
	and a
	jr z, .no_new
	call WaitSFX
	ld de, ITEM_GET_SFX
	call PlaySFX
	xor a
	ld [wMiningFoundNewObjectTile], a
.no_new
; check if all items collected
	ld hl, wMiningUncoveredObjects
	ld e, 4
.collection_loop
	ld a, [hli]
	and a
	jr nz, .not_done
	dec e
	jr nz, .collection_loop

	ld a, MINING_RESULTS
	ld [wJumptableIndex], a
	ret

.not_done
	ld a, [wMiningHitsLeft]
	cp MINING_GAME_MAX_HITS

	jr nc, .collapse

	ld a, MINING_PLAY
	ld [wJumptableIndex], a
	ret

.collapse
	call MiningGame_ShakeScreen
	call MiningGame_ClearBoardAnim
	call MiningAction_Next
	ret

MiningGame_ShakeScreen:
	call WaitSFX
	ld a, $40
	ld [wMiningGameAnimTimer], a
.loop
	call DelayFrame
	ld hl, wMiningGameAnimTimer
	dec [hl]
	jr z, .done
	ld a, [hl]
	and %111
	call z, .play_sfx
	ld a, [hl]
	and %10
	jr z, .screen_left
	xor a
	ldh [hSCX], a
	jr .loop

.screen_left
	ld a, 4
	ldh [hSCX], a
	jr .loop

.done
	xor a
	ldh [hSCX], a
	ret

.play_sfx
	ld de, COLLAPSE_SHAKE_SFX
	call ForcePlaySFX
	ret

MiningGame_ClearBoardAnim:
	ld e, 0
.loop
	hlcoord 0, 2
	ld a, e
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld bc, 13
	ld a, 6
	call ByteFill
	hlcoord 0, 2, wAttrMap
	ld a, e
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld bc, 13
	ld a, 5
	call ByteFill
	call WaitBGMap2
	inc e
	ld a, e
	and 1
	call z, .play_sfx
	ld a, e
	cp 10
	jr nz, .loop
	ret

.play_sfx
	push de
	ld de, COLLAPSE_ANIM_SFX
	call ForcePlaySFX
	pop de
	ret

MiningGame_DrawCrack:
; get row to copy
	ld a, [wMiningHitsLeft]
	cp MINING_GAME_MAX_HITS
	jr c, .ok
	ld a, MINING_GAME_MAX_HITS
.ok
	sub MINING_GAME_MIN_CRACK
	ret c
	ld hl, MiningGameCrackData
	ld c, a
	ld b, 0
	ld a, 10
	call AddNTimes
	ld d, h
	ld e, l
; copy rows
	hlcoord 0, 0
	push de
	ld b, $30
	call .copy_row
	pop de
	ld b, $40

.copy_row
	ld c, 10
.copy_loop
	ld a, [de]
	push af
	swap a
	and $f
	add b
	ld [hli], a
	pop af
	and $f
	add b
	ld [hli], a
	inc de
	dec c
	jr nz, .copy_loop
	ret

MiningAction_Results:
	ld c, 30
	call DelayFrames
	ld de, 0
.loop
	ld hl, wMiningSpawnedObjects
	add hl, de
	ld a, [hl]
	and a
	jr z, .done
	ld hl, wMiningUncoveredObjects
	add hl, de
	ld a, [hl]
	and a
	jr nz, .next
	push de
	call MiningGame_GiveItem
	pop de
.next
	inc e
	ld a, e
	cp 4
	jr nz, .loop

.done
	call MiningAction_Next
	ret

MiningGame_GiveItem:
	ld hl, wMiningSpawnedObjects
	add hl, de
	ld a, [hl]
	dec a
	ld hl, MiningItemList
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hl]
	ld [wCurItem], a
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, MiningGame_ReceiveItemText
	call PrintText
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ret c
	ld hl, MiningGame_PocketFullText
	call PrintText
	ret

MiningGame_ReceiveItemText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

MiningGame_PocketFullText:
	text "But there's no"
	line "room…"
	prompt

MiningAction_Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MiningGame_UpdateObjects:
	ret

MiningGame_GenerateBoard:
	ld hl, wMiningBoardDebris
	ld bc, 130
	ld a, 1
	call ByteFill

; generate 5 different random numbers in [0, NUM_UNIQUE_ROCK_LAYERS)
.loop
	call Random
	ldh a, [hRandomAdd]
	maskbits NUM_ROCK_LAYERS
	ld b, a
	ldh a, [hRandomSub]
	maskbits NUM_ROCK_LAYERS
	ld c, a
	call Random
	ldh a, [hRandomAdd]
	maskbits NUM_ROCK_LAYERS
	ld d, a
	ldh a, [hRandomSub]
	maskbits NUM_ROCK_LAYERS
	ld e, a
	call Random
	maskbits NUM_ROCK_LAYERS

	cp b
	jr z, .loop
	cp c
	jr z, .loop
	cp d
	jr z, .loop
	cp e
	jr z, .loop
	ld [wMiningRockLayerBuffer], a

	ld a, b
	cp c
	jr z, .loop
	cp d
	jr z, .loop
	cp e
	jr z, .loop
	ld [wMiningRockLayerBuffer + 1], a

	ld a, c
	cp d
	jr z, .loop
	cp e
	jr z, .loop
	ld [wMiningRockLayerBuffer + 2], a

	ld a, d
	cp e
	jr z, .loop
	ld [wMiningRockLayerBuffer + 3], a

	ld a, e
	ld [wMiningRockLayerBuffer + 4], a


	ld a, [wMiningRockLayerBuffer + 0]
	call MiningGame_AddLayer
	ld a, [wMiningRockLayerBuffer + 1]
	call MiningGame_AddLayer
	ld a, [wMiningRockLayerBuffer + 2]
	call MiningGame_AddLayer
	ld a, [wMiningRockLayerBuffer + 3]
	call MiningGame_AddLayer
	ld a, [wMiningRockLayerBuffer + 4]
	call MiningGame_AddLayer

	ret

MiningGame_AddLayer:
	cp NUM_UNIQUE_ROCK_LAYERS
	jr nc, MiningGame_AddLayerInverted
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, MiningGameRockLayers
	add hl, bc
	ld b, h
	ld c, l
	ld hl, wMiningBoardDebris
	ld e, 17
.loop_y
	ld d, 8
	ld a, [bc]
	inc bc
.loop_x
	rrca
	jr nc, .skip
	inc [hl]
.skip
	inc hl
	dec d
	jr nz, .loop_x
	dec e
	jr nz, .loop_y
	ret

MiningGame_AddLayerInverted:
	and (NUM_UNIQUE_ROCK_LAYERS - 1)
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, MiningGameRockLayers
	add hl, bc
	ld b, h
	ld c, l
	ld hl, wMiningBoardDebris
	ld e, 130
.loop_y
	ld d, 8
	ld a, [bc]
	inc bc
.loop_x
	rrca
	jr c, .skip
	inc [hl]
.skip
	inc hl
	dec e
	jr z, .done
	dec d
	jr nz, .loop_x
	jr .loop_y

.done
	ret

MiningGame_RetryItemsFromBeginning:
; fix stack pointer
	ld a, $10
.loop
	inc sp
	dec a
	jr nz, .loop
; clear base board
	xor a
	ld hl, wMiningBoardBase
	ld bc, 130
	call ByteFill

MiningGame_GenerateItems:
	ld hl, wMiningGameFailsafeCounter
	xor a
	ld [hl], a
; 25% chance of 2 items
; 50% chance of 3 items
; 25% chance of 4 items
	call Random
	ld c, 3
	bit 0, a
	jr z, .skip1
	dec c
.skip1
	bit 1, a
	jr z, .skip2
	inc c
.skip2
; clear object list
	xor a
	ld hl, wMiningSpawnedObjects
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
; choose c different random numbers
	ld b, 0
.loop
	call Random
	maskbits MINING_GAME_NUM_ITEMS
	cp MINING_GAME_NUM_ITEMS
	jr nc, .loop
	inc a
	ld d, a
	call .is_in_list
	jr c, .loop
	ld hl, wMiningSpawnedObjects
	dec c
	add hl, bc
	ld [hl], d
	ld a, c
	and a
	jr nz, .loop

; place items
	ld hl, wMiningSpawnedObjects
	ld e, 0
.place_item_loop
	ld a, [hl]
	and a
	jr z, .done_item
	call MiningGame_TryPlaceItem
	ld a, [hli]
	push hl
	call MiningGame_GetItemTileCount
	ld hl, wMiningUncoveredObjects
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	inc e
	ld a, e
	cp 4
	jr nz, .place_item_loop
.done_item
	farcall ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.is_in_list
	ld hl, wMiningSpawnedObjects
	ld e, 4
.is_in_list_loop
	ld a, [hli]
	cp d
	jr z, .yes
	dec e
	jr nz, .is_in_list_loop
	and a
	ret

.yes
	scf
	ret

MiningGame_GetItemTileCount:
	dec a
	ld c, a
	ld b, 0
	ld hl, MiningItemList + 1
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ret

MiningGame_TryPlaceItem:
	push hl
	push de
	ld hl, wTempByteValue
	ld [hl], e
	call .try
	pop de
	pop hl
	ret

.try
; get item data
	dec a
	ld c, a
	ld b, 0
	ld hl, MiningItemList + 1
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	dec a
	jr z, .got_rotation
	inc a
	call RandomRange
.got_rotation
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; get graphics
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call .copy_gfx
	call .copy_pal
	inc hl
	inc hl
	inc hl

	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a

; get try x-value
	ld a, 14
	sub b
	call RandomRange
	ld d, a
; get try y-value
	ld a, 11
	sub c
	call RandomRange
	ld e, a

; get topleft board location
	push hl
	push bc
	ld hl, wMiningBoardBase
	ld a, e
	ld bc, 13 ; board width
	call AddNTimes
	ld e, d
	ld d, 0
	add hl, de
	pop bc
	pop de
; check if it fits
.retry_loop
	push de
	push bc
.box_loop_y
	push bc
	push hl
.box_loop_x
	ld a, [de]
	inc de
	cp -1
	jr z, .next
	ld a, [hl]
	and a
	jr nz, .abort_loop
.next
	inc hl
	dec b
	jr nz, .box_loop_x
	pop hl
	ld bc, 13
	add hl, bc
	pop bc
	dec c
	jr nz, .box_loop_y

; all clear, copy item
	pop bc
	push bc
	ld a, c
	ld bc, $10000 - 13
	call AddNTimes
	pop bc
	pop de

.copy_box_y
	push bc
	push hl
	ld a, [wTempByteValue]
	add 4
	swap a
	ld c, a
.copy_box_x
	ld a, [de]
	inc de
	cp -1
	jr z, .skip
	add c
	or %10000000
	ld [hl], a
.skip
	inc hl
	dec b
	jr nz, .copy_box_x
	pop hl
	ld bc, 13
	add hl, bc
	pop bc
	dec c
	jr nz, .copy_box_y

	ret

.abort_loop
	ld hl, wMiningGameFailsafeCounter
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jp nc, MiningGame_RetryItemsFromBeginning
	pop hl
	pop bc
	pop bc
	pop de
	jp .retry_loop

.copy_gfx
	push hl
	ldh a, [rVBK]
	push af
	ld a, 1
	ldh [rVBK], a

	ld a, [wTempByteValue]
	add $94
	ld h, a
	ld l, 0

	ld b, BANK(MiningItemList)
	ld c, $10

	call Get2bpp

	pop af
	ldh [rVBK], a
	pop hl
	ret

.copy_pal
	push hl
	ldh a, [rSVBK]
	push af
	ld a, [wTempByteValue]
	swap a
	rrca
	ld e, a
	ld d, HIGH(wBGPals1)
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $b6
	ld [de], a
	inc de
	ld a, $4e
	ld [de], a
	inc de
	ld b, 6
.copy_pal_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_pal_loop
	pop af
	ldh [rSVBK], a
	pop hl
	ret

MiningGame_GenerateObstacles:
; choose between [7,10] obstacles
	call Random
	and %11
	add 7

	ld e, a
.loop
	call MiningGame_TryPlaceObstacle
	dec e
	jr nz, .loop
	ret

NUM_OBSTACLES EQU 14

MiningGame_TryPlaceObstacle:
	push de
; get random obstacle
.rand_loop
	call Random
	maskbits NUM_OBSTACLES
	cp NUM_OBSTACLES
	jr nc, .rand_loop

; get obstacle data
	ld hl, MiningObstacleList
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a

; get try x-value
	ld a, 14
	sub b
	call RandomRange
	ld d, a
; get try y-value
	ld a, 11
	sub c
	call RandomRange
	ld e, a

; get topleft board location
	push hl
	push bc
	ld hl, wMiningBoardBase
	ld a, e
	ld bc, 13 ; board width
	call AddNTimes
	ld e, d
	ld d, 0
	add hl, de
	pop bc
	pop de
; check if there's space there
	push de
	push bc
.box_loop_y
	push bc
	push hl
.box_loop_x
	ld a, [de]
	inc de
	and a
	jr z, .next
	ld a, [hl]
	and a
	jr nz, .abort_loop
.next
	inc hl
	dec b
	jr nz, .box_loop_x
	pop hl
	ld bc, 13
	add hl, bc
	pop bc
	dec c
	jr nz, .box_loop_y

	pop bc
	push bc
	ld a, c
	ld bc, $10000 - 13
	call AddNTimes
	pop bc
	pop de

.copy_box_y
	push bc
	push hl
.copy_box_x
	ld a, [de]
	inc de
	and a
	jr z, .skip
	ld [hl], a
.skip
	inc hl
	dec b
	jr nz, .copy_box_x
	pop hl
	ld bc, 13
	add hl, bc
	pop bc
	dec c
	jr nz, .copy_box_y

	pop de
	ret

.abort_loop
	pop hl
	pop bc
	pop bc
	pop de
	pop de
	ret

MiningGame_ModifyBoard:
	call .add_full_layer_50
	ld hl, wMiningSpawnedObjects
	ld e, 4
.obj_loop
	ld a, [hli]
	and a
	call z, .add_full_layer_75
	dec e
	jr nz, .obj_loop
	ret

.add_full_layer_50
	call Random
	and %1
	ret z
	jr .add_full_layer

.add_full_layer_75
	call Random
	and %11
	ret z
.add_full_layer
	push hl
	push de
	call .do_add_full_layer
	pop de
	pop hl
	ret

.do_add_full_layer
	ld hl, wMiningBoardDebris
	ld e, 130
.full_layer_loop
	ld a, [hl]
	cp 6
	jr z, .next
	inc [hl]
.next
	inc hl
	dec e
	jr nz, .full_layer_loop
	ret

MiningGame_FinishBoard:
; make sure everything is in a valid range
	ld hl, wMiningBoardDebris
	ld e, 130
.loop
	ld a, [hl]
	cp 2
	ld b, 2
	jr c, .setboard
	cp 6
	ld b, 6
	jr nc, .setboard
	ld b, a
.setboard
	ld [hl], b
	ld a, b
	and 1
	ld a, b
	jr z, .no_round
	inc a
.no_round
	ld [hl], a
	inc hl
	dec e
	jr nz, .loop

MiningGame_DrawBoard:
	ld de, 0
	hlcoord 0, 2
	ld b, 10 ; height
.y_loop
	ld c, 13 ; width
	push hl
.x_loop
	call .copy_tile
	inc hl
	inc de
	dec c
	jr nz, .x_loop
	pop hl
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec b
	jr nz, .y_loop
	call WaitBGMap2
	ret

.copy_tile
	call .get_debris_board
	and a
	jr z, .copy_base_board
	push bc
	ld b, 4
	cp 1
	jr z, .got_base_pal
	cp 2
	jr z, .got_base_pal
	ld b, 5
.got_base_pal
	ld [hl], a
	call .set_attr_data
	pop bc
	ret

.copy_base_board
	call .get_base_board
	push bc
	ld b, a
	cp $40
	jr nc, .place_object_tile
	ld a, b
	and a
	jr z, .place_base_tile
	ld [hl], a
	ld b, 6
	call .set_attr_data
	pop bc
	ret

.place_base_tile
	ld b, 4
	call .set_attr_data
	xor a
	ld [hl], a
	pop bc
	ret

.place_object_tile
	swap a
	sub 4
	and %111
	or $08
	push bc
	ld b, a
	call .set_attr_data
	pop bc
	ld a, b
	bit 7, a
	call nz, .new_object_tile
	ld [hl], a
	pop bc
	ret

.set_attr_data
	push hl
	push de
	ld de, $10000 - wTileMap
	add hl, de
	ld de, wAttrMap
	add hl, de
	pop de
	ld [hl], b
	pop hl
	ret

.new_object_tile
	push hl
	ld hl, wMiningBoardBase
	add hl, de
	ld a, [hl]
	and %01111111
	ld [hl], a

	ld a, b
	and %00110000
	push de
	swap a
	ld e, a
	ld d, 0
	ld hl, wMiningUncoveredObjects
	add hl, de
	dec [hl]
	jr nz, .not_done
	ld a, 1
	ld [wMiningFoundNewObjectTile], a
.not_done
	pop de

	pop hl
	ld a, b
	and %01111111
	ret

.get_base_board
	push hl
	ld hl, wMiningBoardBase
	jr .get_board

.get_debris_board
	push hl
	ld hl, wMiningBoardDebris
.get_board
	add hl, de
	ld a, [hl]
	pop hl
	ret

MiningGame_CopyOAMNonSel:
	ld de, wVirtualOAMSprite00
	ld b, 0
	jr MiningGame_CopyOAM

MiningGame_CopyOAMSel:
	ld de, wVirtualOAMSprite08
	ld b, 1

MiningGame_CopyOAM:
	ld a, [hli]
.loop
	push af
	ld a, [hli]
	add 12
	ld [de], a ; y
	inc de
	ld a, [hli]
	add 6
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	add b
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

PlaceToolBoxOAM:
	ld a, [wMiningTool]
	and a ; cp TOOL_PICK
	jr z, .pick

; hammer
	ld hl, .hammer_oam
	call MiningGame_CopyOAMSel
	ld hl, .pick_oam
	jp MiningGame_CopyOAMNonSel

.pick
	ld hl, .pick_oam
	call MiningGame_CopyOAMSel
	ld hl, .hammer_oam
	jp MiningGame_CopyOAMNonSel

.hammer_oam
	db 8
	dsprite 3, 0, 15, 0, $00, 4
	dsprite 3, 0, 16, 0, $02, 4
	dsprite 3, 0, 17, 0, $04, 4
	dsprite 3, 0, 18, 0, $06, 4
	dsprite 5, 0, 15, 0, $08, 4
	dsprite 5, 0, 16, 0, $0a, 4
	dsprite 5, 0, 17, 0, $0c, 4
	dsprite 5, 0, 18, 0, $0e, 4

.pick_oam
	db 8
	dsprite 8, 0, 15, 0, $10, 6
	dsprite 8, 0, 16, 0, $12, 6
	dsprite 8, 0, 17, 0, $14, 6
	dsprite 8, 0, 18, 0, $16, 6
	dsprite 10, 0, 15, 0, $18, 6
	dsprite 10, 0, 16, 0, $1a, 6
	dsprite 10, 0, 17, 0, $1c, 6
	dsprite 10, 0, 18, 0, $1e, 6

MiningGame_PlaceCursor:
	ld hl, wMiningGameAnimTimer
	inc [hl]
	ld a, [hl]
	and %10000
	jr z, .clear
	ld a, [wMenuCursorX]
	inc a
	ld h, a
	ld a, [wMenuCursorY]
	add 4
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, l
	ld [wVirtualOAMSprite16 + 0], a
	ld a, h
	ld [wVirtualOAMSprite16 + 1], a
	ld a, $30
	ld [wVirtualOAMSprite16 + 2], a
	ld a, [wMiningTool]
	and a
	ld a, 6
	jr z, .got_pal
	ld a, 4
.got_pal
	ld [wVirtualOAMSprite16 + 3], a
	ret

.clear
	ld a, $a0
	ld [wVirtualOAMSprite16 + 0], a
	xor a
	ld [wVirtualOAMSprite16 + 1], a
	ld [wVirtualOAMSprite16 + 2], a
	ld [wVirtualOAMSprite16 + 3], a
	ret

MiningText_SomethingPinged:
	text "Something pinged"
	line "in the wall!"
	cont "@"
	text_asm
	ld hl, wMiningSpawnedObjects
	ld e, 0
.loop
	ld a, [hli]
	and a
	jr z, .done_count
	inc e
	ld a, e
	cp 4
	jr nz, .loop
.done_count
	ld a, e
	ld [wStringBuffer1], a
	ld hl, .done
	ret
.done
	text_decimal wStringBuffer1, 1, 1
	text " confirmed!"
	prompt

MiningText_Empty:
	text_start
	done

MiningGameBG: INCBIN "gfx/underground/minigame.2bpp.lz"
MiningGameOB: INCBIN "gfx/underground/minigame_obj.2bpp.lz"

MiningGameTilemap: INCBIN "gfx/underground/minigame.tilemap"
MiningGameAttrmap: INCBIN "gfx/underground/minigame.attrmap"

MiningGameRockLayers: INCLUDE "engine/games/rock_layers.asm"

INCLUDE "data/games/mining_items.asm"
INCLUDE "data/games/mining_obstacles.asm"

MiningGameCrackData:
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e6
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $89
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ab
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $cd
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e2, $30
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e4, $50
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e6, $70
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $89, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ab, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $cd, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e2, $30, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e4, $50, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $e6, $70, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $89, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ab, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $cd, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $e2, $30, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $e4, $50, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $e6, $70, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $89, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $ab, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ef, $cd, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $e2, $30, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $e4, $50, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $e6, $70, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $89, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $ab, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ef, $cd, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $e2, $30, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $e4, $50, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $e6, $70, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $89, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $ab, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $ef, $cd, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $e2, $30, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $e4, $50, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $e6, $70, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $89, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $ab, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $ef, $cd, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $e2, $30, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $e4, $50, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $e6, $70, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $89, $10, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $ab, $10, $10, $10, $10, $10, $10, $10
	db $ef, $ef, $cd, $10, $10, $10, $10, $10, $10, $10
	db $ef, $e2, $30, $10, $10, $10, $10, $10, $10, $10
	db $ef, $e4, $50, $10, $10, $10, $10, $10, $10, $10
	db $ef, $e6, $70, $10, $10, $10, $10, $10, $10, $10
	db $ef, $89, $10, $10, $10, $10, $10, $10, $10, $10
	db $ef, $ab, $10, $10, $10, $10, $10, $10, $10, $10
	db $ef, $cd, $10, $10, $10, $10, $10, $10, $10, $10
	db $e2, $30, $10, $10, $10, $10, $10, $10, $10, $10
	db $e4, $50, $10, $10, $10, $10, $10, $10, $10, $10
	db $e6, $70, $10, $10, $10, $10, $10, $10, $10, $10
	db $89, $10, $10, $10, $10, $10, $10, $10, $10, $10
	db $ab, $10, $10, $10, $10, $10, $10, $10, $10, $10
	db $cd, $10, $10, $10, $10, $10, $10, $10, $10, $10
