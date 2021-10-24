	object_const_def ; object_event constants

RivalHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, TWINLEAF_TOWN, 2
	warp_event  7,  7, TWINLEAF_TOWN, 2
	warp_event  9,  0, RIVAL_HOUSE_2F, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
