	object_const_def ; object_event constants

WaywardCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WaywardCave1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 36, 33, ROUTE_206, 6
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
