; These lists determine the battle music and victory music, and whether to
; award HAPPINESS_GYMBATTLE for winning.

; Note: CHAMPION and RED are unused for battle music checks, since they are
; accounted for prior to the list check.

GymLeaders:
	db ROARK
	db GARDENIA
	db MAYLENE
	db WAKE
	db FANTINA
	db BYRON
	db CANDICE
	db VOLKNER
	db AARON
	db BERTHA
	db FLINT
	db LUCIAN
	db CHAMPION
	db RED
; fallthrough
KantoGymLeaders:
	db -1
