	object_const_def ; object_event constants

Route206SGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route206SGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  1, ROUTE_206, 2
	warp_event  5,  1, ROUTE_206, 3
	warp_event  4,  9, ROUTE_206, 4
	warp_event  5,  9, ROUTE_206, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
