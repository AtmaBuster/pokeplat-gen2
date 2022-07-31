	object_const_def ; object_event constants

Route205S_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route205S_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  2, ETERNA_FOREST_INT, 1
	warp_event 13,  2, ETERNA_FOREST_INT, 2
	warp_event 19,  9, ROUTE_205_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
