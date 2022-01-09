	object_const_def ; object_event constants

OreburghApartmentN1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentN1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, OREBURGH_CITY, 9
	warp_event  7,  7, OREBURGH_CITY, 9
	warp_event  8,  1, OREBURGH_APARTMENT_N_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
