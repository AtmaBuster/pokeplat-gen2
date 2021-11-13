	object_const_def ; object_event constants

TVStation2F2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation2F2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	
	warp_event  2,  9, TV_STATION_2F, 3
	warp_event  3,  9, TV_STATION_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
