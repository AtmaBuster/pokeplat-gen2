BattleCommand_bellydrum:
; bellydrum
	callfar GetHalfMaxHP
	callfar CheckUserHasEnoughHP
	jr nc, .failed

	push bc
	ld b, $f0 | ATTACK
	ld a, STAT_SKIPTEXT
	call _ForceRaiseStat
	pop bc
	ld a, [wFailedMessage]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	callfar SubtractHPFromUser
	call UpdateUserInParty

	ld hl, BellyDrumText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
