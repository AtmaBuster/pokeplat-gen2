	object_const_def ; object_event constants

TVStation1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	
	warp_event  6,  9, JUBILIFE_CITY, 8
	warp_event  7,  9, JUBILIFE_CITY, 8
	warp_event 10,  0, TV_STATION_2F, 2
	warp_event 13,  0, TV_STATION_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
