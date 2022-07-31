	object_const_def ; object_event constants

Route205House_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route205House_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_205_S, 3
	warp_event  3,  7, ROUTE_205_S, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
