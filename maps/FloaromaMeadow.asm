	object_const_def ; object_event constants

FloaromaMeadow_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaMeadow_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 33, FLOAROMA_TOWN, 6
	warp_event  9, 33, FLOAROMA_TOWN, 7
	warp_event 30,  4, FUEGO_IRONWORKS_EXT, 1
	warp_event 31,  4, FUEGO_IRONWORKS_EXT, 2
	warp_event 27, 25, FLOAROMA_MEADOW_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
