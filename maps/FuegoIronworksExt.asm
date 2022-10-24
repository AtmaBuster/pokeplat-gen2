	object_const_def ; object_event constants

FuegoIronworksExt_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuegoIronworksExt_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 19, FLOAROMA_MEADOW, 3
	warp_event 13, 19, FLOAROMA_MEADOW, 4
	warp_event  5,  7, FUEGO_IRONWORKS_INT, 1
	warp_event  6,  7, FUEGO_IRONWORKS_INT, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
