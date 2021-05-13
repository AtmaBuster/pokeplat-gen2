UpdateItemDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farcall PrintItemDescription
	ret

UpdateItemDescriptionMart:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	ret z
	ld a, [wMartSellingTM]
	and a
	jr nz, .tmhm_description
	decoord 1, 14
	farcall PrintItemDescription
	ret

.tmhm_description
	ld a, [wCurSpecies]
	ld [wCurItem], a
	push de
	farcall GetTMHMItemMove
	pop hl
	ld a, [wTempTMHM]
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDesc
	ret
