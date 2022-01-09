	object_const_def ; object_event constants

OreburghMuseum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  9, OREBURGH_CITY, 15
	warp_event  3,  9, OREBURGH_CITY, 15

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
