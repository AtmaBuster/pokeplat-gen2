	object_const_def ; object_event constants

OreburghCity_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  6,  5, OREBURGH_GATE_1F, 2
	warp_event 34, 37, OREBURGH_MINE_B1F, 1
	warp_event 35, 37, OREBURGH_MINE_B1F, 1
	warp_event 36, 37, OREBURGH_MINE_B1F, 1
	warp_event 37, 37, OREBURGH_MINE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
