	object_const_def ; object_event constants

OreburghGate1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghGate1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, ROUTE_203, 1
	warp_event 23, 15, OREBURGH_CITY, 1
	warp_event 17,  3, OREBURGH_GATE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
