	object_const_def ; object_event constants

RavagedPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RavagedPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	
	warp_event 13, 29, ROUTE_204_S, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
