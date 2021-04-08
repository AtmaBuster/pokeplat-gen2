BattleCommand_hiddenpower:
; hiddenpower

	ld a, [wAttackMissed]
	and a
	ret nz
	farcall HiddenPowerDamage
	ret
