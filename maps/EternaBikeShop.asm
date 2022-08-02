	object_const_def ; object_event constants

EternaBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ETERNA_CITY, 6
	warp_event  5,  7, ETERNA_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
