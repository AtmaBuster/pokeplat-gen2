	object_const_def ; object_event constants

Route218_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route218_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 41, 14, JUBILIFE_WEST_GATE, 3
	warp_event 41, 15, JUBILIFE_WEST_GATE, 4
	warp_event  6, 12, CANALAVE_EAST_GATE, 1
	warp_event  6, 13, CANALAVE_EAST_GATE, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
