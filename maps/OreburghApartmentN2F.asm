	object_const_def ; object_event constants

OreburghApartmentN2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentN2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, OREBURGH_APARTMENT_N_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
