_HandlePlayerStep::
	ld a, [wPlayerStepFlags]
	and a
	ret z
	bit PLAYERSTEP_START_F, a
	jr nz, .update_overworld_map
	bit PLAYERSTEP_STOP_F, a
	jr nz, .update_player_coords
	bit PLAYERSTEP_CONTINUE_F, a
	jr nz, .finish
	ret

.update_overworld_map
	ld a, 4
	ld [wHandlePlayerStep], a
	call UpdateOverworldMap
	jr .finish

.update_player_coords
	call UpdatePlayerCoords
	jr .finish

.finish
	call HandlePlayerStep
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	sub d
	ld [wPlayerBGMapOffsetX], a
	ld a, [wPlayerBGMapOffsetY]
	sub e
	ld [wPlayerBGMapOffsetY], a
	ret

ScrollScreen::
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ldh a, [hSCX]
	add d
	ldh [hSCX], a
	ldh a, [hSCY]
	add e
	ldh [hSCY], a
	ret

HandlePlayerStep:
	ld hl, wHandlePlayerStep
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw GetMovementPermissions
	dw BufferScreen
	dw .mobile
	dw .fail2
; The rest are never used.  Ever.
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1

.fail1
	ret

.mobile
	farcall StubbedTrainerRankings_StepCount
	ret

.fail2
	ret

UpdatePlayerCoords:
	ld a, [wPlayerStepDirection]
	and a
	jr nz, .check_step_down
	ld hl, wYCoord
	inc [hl]
	ret

.check_step_down
	cp UP
	jr nz, .check_step_left
	ld hl, wYCoord
	dec [hl]
	ret

.check_step_left
	cp LEFT
	jr nz, .check_step_right
	ld hl, wXCoord
	dec [hl]
	ret

.check_step_right
	cp RIGHT
	ret nz
	ld hl, wXCoord
	inc [hl]
	ret

UpdateOverworldMap:
	ld a, [wPlayerStepDirection]
	and a
	jr z, .step_down
	cp UP
	jr z, .step_up
	cp LEFT
	jr z, .step_left
	cp RIGHT
	jr z, .step_right
	ret

.step_down
	call .ScrollOverworldMapDown
	call LoadMapPart
	call ScrollMapDown
	ret

.step_up
	call .ScrollOverworldMapUp
	call LoadMapPart
	call ScrollMapUp
	ret

.step_left
	call .ScrollOverworldMapLeft
	call LoadMapPart
	call ScrollMapLeft
	ret

.step_right
	call .ScrollOverworldMapRight
	call LoadMapPart
	call ScrollMapRight
	ret

.ScrollOverworldMapDown:
	ld a, [wBGMapAnchor]
	add 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wMetatileStandingY
	inc [hl]
	ld a, [hl]
	cp 2 ; was 1
	jr nz, .done_down
	ld [hl], 0
	call .ScrollMapDataDown
.done_down
	ret

.ScrollMapDataDown:
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

.ScrollOverworldMapUp:
	ld a, [wBGMapAnchor]
	sub 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wMetatileStandingY
	dec [hl]
	ld a, [hl]
	cp -1 ; was 0
	jr nz, .done_up
	ld [hl], $1
	call .ScrollMapDataUp
.done_up
	ret

.ScrollMapDataUp:
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapLeft:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	dec [hl]
	ld a, [hl]
	cp -1
	jr nz, .done_left
	ld [hl], 1
	call .ScrollMapDataLeft
.done_left
	ret

.ScrollMapDataLeft:
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapRight:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	inc [hl]
	ld a, [hl]
	cp 2
	jr nz, .done_right
	ld [hl], 0
	call .ScrollMapDataRight
.done_right
	ret

.ScrollMapDataRight:
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret

ReloadWalkedTile::
	hlcoord 8, 6
	ld de, wBGMapBuffer
	call .CommitTiles
	hlcoord 8, 6, wAttrMap
	ld de, wBGMapPalBuffer
	call .CommitTiles
	ld a, [wBGMapAnchor]
	swap a
	rrca
	add 8 << 3
	rlca
	swap a
	add $c0
	ld l, a
	ld a, [wBGMapAnchor + 1]
	adc 0
	ld h, a
	ld c, 4
	ld de, wBGMapBufferPtrs
.ptr_loop
	ld a, h
	and HIGH($9800 | $9900 | $9a00 | $9b00)
	ld h, a
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	inc de

	ld a, BG_MAP_WIDTH
	call .AddHLDecC
	jr nz, .ptr_loop
	call .ApplyAttributes
	ret

.CommitTiles:
	ld c, 4
.tile_loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, SCREEN_WIDTH - 1
	call .AddHLDecC
	jr nz, .tile_loop
	ret
	ret

.AddHLDecC:
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	dec c
	ret

.ApplyAttributes:
	di
.wait_for_vblank
	ldh a, [rLY]
	cp $90
	jr c, .wait_for_vblank
	ld a, [wOverBridge]
	and a
	jr z, .under_bridge
	ldh a, [rVBK]
	push af
	ld a, 1
	ldh [rVBK], a
	ld hl, wBGMapBufferPtrs
	ld c, 4
.attr_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	res 7, a
	ld [de], a
	inc de
	ld a, [de]
	res 7, a
	ld [de], a
	dec c
	jr nz, .attr_loop
	pop af
	ldh [rVBK], a
	reti

.under_bridge
	ld hl, wBGMapBufferPtrs
	ld c, 4
.attr_loop_u
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call .check_under_bridge_tile
	inc de
	call .check_under_bridge_tile
	dec c
	jr nz, .attr_loop_u
	reti

.check_under_bridge_tile
	ld a, [de]
	push hl
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, BANK(Tileset0PalMap) ; all same bank
	call GetFarByte
	pop hl
	bit 7, a
	ret z
	push af
	ld a, 1
	ldh [rVBK], a
	pop af
	ld [de], a
	xor a
	ldh [rVBK], a
	ret

ScrollMapUp::
	call ReloadWalkedTile
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapDown::
	call ReloadWalkedTile
	hlcoord 0, SCREEN_HEIGHT - 2
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld bc, BG_MAP_WIDTH tiles
	add hl, bc
; cap d at HIGH(vBGMap0)
	ld a, h
	and %00000011
	or HIGH(vBGMap0)
	ld e, l
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapLeft::
	call ReloadWalkedTile
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapRight::
	call ReloadWalkedTile
	hlcoord SCREEN_WIDTH - 2, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	and %11100000
	ld b, a
	ld a, e
	add SCREEN_HEIGHT
	and %00011111
	or b
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ldh [hBGMapUpdate], a
	ret
