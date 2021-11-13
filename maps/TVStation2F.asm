	object_const_def ; object_event constants

TVStation2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	
	warp_event  8,  0, TV_STATION_3F, 1
	warp_event  5,  0, TV_STATION_1F, 3
	warp_event  1,  0, TV_STATION_2F2, 1
	warp_event 11,  0, TV_STATION_ELEVATOR, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
