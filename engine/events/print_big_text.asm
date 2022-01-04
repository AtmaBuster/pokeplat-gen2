PrintBigText::
; load required big characters
	farcall _LoadBigFontCharacters
; write string
	ld bc, wStringBuffer5
	hlcoord 1, 14
	ld e, 0
.string_loop
	ld a, [bc]
	inc bc
	cp "@"
	jr z, .done
	cp " "
	jr nz, .not_space
	inc hl
	jr .skip_char

.not_space
	call .PrintBigChar
.skip_char
	inc e
	call PrintLetterDelay
	jr .string_loop

.done
; wait button
	call WaitButton
; clear textbox
	hlcoord 1, 14
	lb bc, 3, 18
	ld a, " "
	call FillBoxWithByte
	call WaitBGMap
; reload font
	farcall _LoadStandardFont
	ret

.PrintBigChar:
	push de
	push hl
	ld a, e
	add a
	add e
	add $80
	ld de, SCREEN_WIDTH
; first tile
	ld [hl], a
; second tile
	inc a
	add hl, de
	ld [hl], a
; third tile
	inc a
	add hl, de
	ld [hl], a
; move to next pos
	pop hl
	inc hl
; done
	pop de
	ret
