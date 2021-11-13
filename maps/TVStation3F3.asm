	object_const_def ; object_event constants

TVStation3F3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation3F3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	
	warp_event  4,  5, TV_STATION_3F, 4
	warp_event  5,  5, TV_STATION_3F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
