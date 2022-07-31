	object_const_def ; object_event constants

FloaromaMeadowHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaMeadowHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FLOAROMA_MEADOW, 5
	warp_event  3,  7, FLOAROMA_MEADOW, 5
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
