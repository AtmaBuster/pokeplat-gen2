	object_const_def ; object_event constants

OreburghCity_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event  6,  5, OREBURGH_GATE_1F, 2
	warp_event 34, 37, OREBURGH_MINE_B1F, 1
	warp_event 35, 37, OREBURGH_MINE_B1F, 1
	warp_event 36, 37, OREBURGH_MINE_B1F, 1
	warp_event 37, 37, OREBURGH_MINE_B1F, 1
	warp_event 37, 11, OREBURGH_POKEMON_CENTER_1F, 1
	warp_event 25,  5, OREBURGH_POKEMART, 2
	warp_event 13,  5, OREBURGH_APARTMENT_NW_1F, 2
	warp_event 19,  5, OREBURGH_APARTMENT_N_1F, 2
	warp_event 43, 15, OREBURGH_APARTMENT_E_1F, 2
	warp_event 15, 11, OREBURGH_HOUSE_W, 1
	warp_event 31,  7, OREBURGH_HOUSE_N, 1
	warp_event 41, 25, OREBURGH_HOUSE_E, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
