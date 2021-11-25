	object_const_def ; object_event constants

OreburghMineB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghMineB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, OREBURGH_MINE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
