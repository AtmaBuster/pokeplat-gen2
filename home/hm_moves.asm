; HM moves can't be forgotten

IsHM::
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret

IsHMMove::
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .HMMoves
	ld de, 2
	jp IsInHalfwordArray

.HMMoves:
	dw CUT
	dw FLY
	dw SURF
	dw STRENGTH
	dw DEFOG
	dw ROCK_SMASH
	dw WATERFALL
	dw ROCK_CLIMB
	dw -1 ; end
