	object_const_def ; object_event constants

OreburghGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 19, OREBURGH_CITY, 14
	warp_event  5, 19, OREBURGH_CITY, 14

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
