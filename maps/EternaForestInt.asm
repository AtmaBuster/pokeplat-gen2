	object_const_def ; object_event constants

EternaForestInt_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaForestInt_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 55, ROUTE_205_S, 1
	warp_event 11, 55, ROUTE_205_S, 2
	warp_event 53, 22, ROUTE_205_N, 1
	warp_event 53, 23, ROUTE_205_N, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
