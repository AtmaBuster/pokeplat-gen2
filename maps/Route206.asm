	object_const_def ; object_event constants

Route206_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route206_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13,  5, ROUTE_206_N_GATE, 4
	warp_event 11, 67, ROUTE_206_S_GATE, 1
	warp_event 12, 67, ROUTE_206_S_GATE, 2
	warp_event 11, 73, ROUTE_206_S_GATE, 3
	warp_event 12, 73, ROUTE_206_S_GATE, 4
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
