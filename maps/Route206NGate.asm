	object_const_def ; object_event constants

Route206NGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route206NGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  1, ETERNA_CITY, 11
	warp_event  5,  1, ETERNA_CITY, 12
	warp_event  4,  9, ROUTE_206, 1
	warp_event  5,  9, ROUTE_206, 1
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
