	object_const_def ; object_event constants

FuegoIronworksInt_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuegoIronworksInt_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  1, FUEGO_IRONWORKS_EXT, 3
	warp_event  1,  1, FUEGO_IRONWORKS_EXT, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
