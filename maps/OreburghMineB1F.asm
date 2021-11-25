	object_const_def ; object_event constants

OreburghMineB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghMineB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  1, OREBURGH_CITY, 3
	warp_event  7, 21, OREBURGH_MINE_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
