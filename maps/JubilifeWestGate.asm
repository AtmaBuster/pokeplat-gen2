	object_const_def ; object_event constants

JubilifeWestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeWestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  4, JUBILIFE_CITY, 11
	warp_event  9,  5, JUBILIFE_CITY, 12
	warp_event  0,  4, ROUTE_218, 1
	warp_event  0,  5, ROUTE_218, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
