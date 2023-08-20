	object_const_def ; object_event constants

EternaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 19, ETERNA_CITY, 3
	warp_event  8, 19, ETERNA_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
