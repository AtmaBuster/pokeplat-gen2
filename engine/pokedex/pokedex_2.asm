AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	call DelayFrames
	ret

.FrameIDs:
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SlowpokeSpriteData
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a ; y
	inc de
	ld a, [hli]
	ld [de], a ; x
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	jr .loop

.SlowpokeSpriteData:
	dsprite 11, 0,  9, 0, $00, 0
	dsprite 11, 0, 10, 0, $01, 0
	dsprite 11, 0, 11, 0, $02, 0
	dsprite 12, 0,  9, 0, $10, 0
	dsprite 12, 0, 10, 0, $11, 0
	dsprite 12, 0, 11, 0, $12, 0
	dsprite 13, 0,  9, 0, $20, 0
	dsprite 13, 0, 10, 0, $21, 0
	dsprite 13, 0, 11, 0, $22, 0
	db -1

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	push hl
	ld a, [wTempSpecies]
	call GetPokemonIndexFromID
	ld b, l
	ld c, h
	ld a, [wLastDexMode]
	and a
	jr nz, .got_number
	farcall GetSinnohDexNumber
	ld a, c
	cp -1
	jr z, .invalid_number
.got_number
	ld hl, sp + 0
	ld d, h
	ld e, l
	pop hl
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 2, 3
	call PrintNum
	pop bc
	jr .continue

.invalid_number
	pop hl
	ld a, "?"
	ld [hli], a
	ld [hli], a
	ld [hl], a

.continue
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wTempSpecies]
	call CheckCaughtMon
	pop hl
	pop bc
	ret z

	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
; Get the height of the Pokemon.
	ld a, [wTempSpecies]
	push bc
	ld b, a
	call GetMonHeight
	ld b, d
	ld d, e
	ld e, b
	pop bc
	ld a, b
	push af

	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
; Print the height, with two of the four digits in front of the decimal point
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, (2 << 4) | 4
	call PrintNum
; Replace the decimal point with a ft symbol
	hlcoord 14, 7
	ld [hl], $5e
	pop af
	pop hl

.skip_height
	ld a, [wTempSpecies]
	push hl
	push bc
	ld b, a
	call GetMonWeight
	ld b, d
	ld d, e
	ld e, b
	pop bc
	ld a, b

	ld a, e
	or d
	jr z, .skip_weight
	push de
; Print the weight, with four of the five digits in front of the decimal point
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, (4 << 4) | 5
	call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61 ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a ; check for page 2
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 11
	call FarString
	ret

UnreferencedPOKeString:
; unused
	db "#@"

GetMonHeight:
; get, convert (to inches), and return mon b height in de (ft in d, in. in e)
	push hl
	ld a, b
	call GetPokemonIndexFromID
	dec hl
	add hl, hl
	ld bc, MonHeights
	add hl, bc
	ld a, BANK(MonHeights)
	call GetFarHalfword
	ld d, h
	ld e, l
	pop hl
	xor a
	ldh [hMultiplicand + 0], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
; x *= 1000
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hMultiplier], a
	call Multiply
; x += 127
	push hl
	ld hl, hMultiplicand + 2
	ld a, [hl]
	add 127
	ld [hld], a
	ld a, [hl]
	adc 0
	ld [hl], a
	pop hl
; x /= 254
	ld a, 254
	ldh [hDivisor], a
	ld b, 4
	call Divide
; get ft/in
	ld a, 12
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	push hl
	ld bc, 100
	ld hl, 0
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ldh a, [hQuotient + 4]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ret

GetMonWeight:
; get, convert (to lbs), and return mon b height in de
	push hl
	ld a, b
	call GetPokemonIndexFromID
	dec hl
	add hl, hl
	ld bc, MonWeights
	add hl, bc
	ld a, BANK(MonWeights)
	call GetFarHalfword
	ld d, h
	ld e, l
	pop hl
; setup math
	xor a
	ldh [hMultiplicand + 0], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
; x *= 2500
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
; x += 567
	push hl
	ld hl, hMultiplicand + 2
	ld a, [hl]
	add 55
	ld [hld], a
	ld a, [hl]
	adc 2
	ld [hl], a
	pop hl
; x /= 1134
	ld a, 189
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld a, 6
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld d, a
	ldh a, [hQuotient + 3]
	ld e, a
	ret

GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld a, b
	call GetPokemonIndexFromID
	dec hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, de
	ld de, PokedexDataPointerTable
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

GetDexEntryPagePointer:
	call GetDexEntryPointer
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"

INCLUDE "data/pokemon/height_weight.asm"
