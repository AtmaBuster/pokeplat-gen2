SpindaLineTypes::
	db %00011111, %10000000, %00000000
	db %00111111, %11000000, %00000000
	db %01111111, %11100000, %00000000
	db %11111111, %11110000, %00000000
	db %00000011, %11110000, %00000000
	db %00000111, %11111000, %00000000
	db %00001111, %11111100, %00000000
	db %00011111, %11111110, %00000000
	db %00000000, %01111110, %00000000
	db %00000000, %11111111, %00000000
	db %00000001, %11111111, %10000000
	db %00000011, %11111111, %11000000
	db %00000000, %00001111, %11000000
	db %00000000, %00011111, %11100000
	db %00000000, %00111111, %11110000
	db %00000000, %01111111, %11111000
	db %00001110, %00000000, %00000000
	db %00011111, %00000000, %00000000
	db %00111111, %10000000, %00000000
	db %00000000, %00000000, %00000000
	db %00000001, %11000000, %00000000
	db %00000011, %11100000, %00000000
	db %00000111, %11110000, %00000000
	db %00000000, %00000000, %00000000
	db %00000000, %00111000, %00000000
	db %00000000, %01111100, %00000000
	db %00000000, %11111110, %00000000
	db %00000000, %00000000, %00000000
	db %00000000, %00000111, %00000000
	db %00000000, %00001111, %10000000
	db %00000000, %00011111, %11000000
	db %00000000, %00000000, %00000000

GetSpotCoords:
	push af
	and %11
	ld c, a
	pop af
	and %1100
	rrca
	rrca
	ld b, a
	ret

PutSpindaSpots:
; Spot 0 // top-left
	ldh a, [hSpindaDVs]
	push af
	swap a
	call GetSpotCoords
	xor a
	call PutSpindaSpot
; Spot 1 // top-right
	pop af
	call GetSpotCoords
	ld a, 1
	call PutSpindaSpot
; Spot 2 // bottom-left
	ldh a, [hSpindaDVs + 1]
	push af
	swap a
	call GetSpotCoords
	ld a, 2
	call PutSpindaSpot
; Spot 3 // bottom-right
	pop af
	call GetSpotCoords
	ld a, 3

PutSpindaSpot:
; a = spot type (0 = top-left, 1 = top-right, 2 = bottom-left, 3 = bottom-right)
; b = spot x
; c = spot y
	ld d, a
; if spot type is 2 or 3, double y
	cp 2
	jr c, .top_spot
	ld a, c
	add a
	ld c, a
.top_spot
	ld a, b
	add a
	add b
	add a
	add a
	ld b, a
; get start addr
	ld a, d
	add a
	add c
	add c
	push de
	ld e, d
	ld d, 0
	ld hl, .SpotStart
	add hl, de
	add hl, de
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, 0
	add hl, de
	pop de
	ld a, d
	cp 2
	ld de, SpindaSpot1
	jr c, .MakeLineList
	ld de, SpindaSpot2
.MakeLineList
	push hl
	ld c, 12
	ld hl, wSpindaSpotLineList
.line_list_loop
	ld a, [de]
	inc de
	cp -1
	jr z, .put_empty
	add b
	jr .next_line_list

.put_empty
	ld a, 31 * 3
.next_line_list
	ld [hli], a
	dec c
	jr nz, .line_list_loop
	pop hl

	ld c, 3
.col_loop
	push bc
	push hl
	call .DoSpotColumn
	pop hl
	ld bc, $60
	add hl, bc
	call .IncLineList
	pop bc
	dec c
	jr nz, .col_loop
	
	ret

.DoSpotColumn:
	ld c, 0
.row_loop
	push bc
	call .DoSpotLine
	pop bc
	inc c
	ld a, c
	cp 12
	jr nz, .row_loop
	ret

.DoSpotLine:
; get bitmask
	ld b, HIGH(wSpindaSpotLineList)
	ld a, [bc]
	ld c, a
	ld b, HIGH(SpindaLineTypes)
	ld a, [bc]
	ld b, a
; get bits to switch
	ld a, [hli]
	xor [hl]
; apply bitmask
	and b
; switch bits
	push af
	xor [hl]
	ld [hld], a
	pop af
	xor [hl]
	ld [hli], a
	inc hl
	ret

.IncLineList:
	push hl
	ld hl, wSpindaSpotLineList
	ld c, 12
.inc_list_loop
	inc [hl]
	inc hl
	dec c
	jr nz, .inc_list_loop
	pop hl
	ret

.SpotStart
	dw wDecompressScratch + 0
	dw wDecompressScratch + $120
	dw wDecompressScratch + $20
	dw wDecompressScratch + $140

SpindaSpot1: ; Top
	db  0,  3,  6,  9
	db  9,  9,  9,  9
	db  9,  6,  3,  0
SpindaSpot2: ; Bottom
	db 48, 51, 54, 54
	db 54, 51, 48, -1
	db -1, -1, -1, -1
