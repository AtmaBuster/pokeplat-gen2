	object_const_def ; object_event constants

EternaHerbShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaHerbShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  5, ETERNA_CITY, 8
	warp_event  3,  5, ETERNA_CITY, 8
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
