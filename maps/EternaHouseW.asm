	object_const_def ; object_event constants

EternaHouseW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaHouseW_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ETERNA_CITY, 4
	warp_event  3,  7, ETERNA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
