BattleCommand_assist:
; clear assist move buffer
	ld hl, wAssistMoveList
	ld bc, 20
	xor a
	call ByteFill
; split based on whose side
	ldh a, [hBattleTurn]
	and a
	jr nz, _Assist_Enemy
; get party moves (excluding current battle mon)
	ld a, [wPartyCount]
	dec a
	ld e, a
	ld bc, wAssistMoveList
.loop
	ld a, [wCurBattleMon]
	cp e
	jr z, .next

	ld hl, wPartyMon1Species
	ld a, e
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hli]
	cp EGG
	jr z, .next
	inc hl ; get to moves
	ld d, 4
.move_loop
	ld a, [hli]
	and a
	jr z, .next
	ld [bc], a
	inc bc
	dec d
	jr nz, .move_loop
.next
	ld a, e
	and a
	jr z, _Assist_Join
	dec e
	jr .loop

_Assist_Enemy:
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jp z, PrintButItFailed
; get party moves (excluding current battle mon)
	ld a, [wOTPartyCount]
	dec a
	ld e, a
	ld bc, wAssistMoveList
.loop
	ld a, [wCurOTMon]
	cp e
	jr z, .next

	ld hl, wOTPartyMon1Species
	ld a, e
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hli]
	cp EGG
	jr z, .next
	inc hl ; get to moves
	ld d, 4
.move_loop
	ld a, [hli]
	and a
	jr z, .next
	ld [bc], a
	inc bc
	dec d
	jr nz, .move_loop
.next
	ld a, e
	and a
	jr z, _Assist_Join
	dec e
	jr .loop

_Assist_Join:
; make sure there is a valid move
	ld hl, wAssistMoveList
.check_loop
	ld a, [hli]
	and a
	jp z, PrintButItFailed
	call IsAssistMove
	jr c, .check_loop
; select a move from the list to use
.select_move_loop
	call BattleRandom
	maskbits 20
	cp 20
	jr nc, .select_move_loop
	ld c, a
	ld b, 0
	ld hl, wAssistMoveList
	add hl, bc
	ld a, [hl]
	and a
	jr z, .select_move_loop
	call IsAssistMove
	jr c, .select_move_loop
	ld a, [hl]
	push af
	call AnimateCurrentMove2
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a
	farcall UpdateMoveData
	farjump ResetTurn

IsAssistMove:
	push bc
	push de
	push hl

	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, AssistExceptionMoves
	ld de, 2
	call IsInHalfwordArray

	pop hl
	pop de
	pop bc
	ret

INCLUDE "data/moves/assist_exception_moves.asm"
