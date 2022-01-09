	object_const_def ; object_event constants

CanalaveEastGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CanalaveEastGate_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  4, ROUTE_218, 3
	warp_event  9,  5, ROUTE_218, 4
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
