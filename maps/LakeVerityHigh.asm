	object_const_def ; object_event constants

LakeVerityHigh_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LakeVerityHigh_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 28, 21, ROUTE_201, 3
	warp_event 29, 21, ROUTE_201, 4
	warp_event 15,  7, LAKE_VERITY_CAVERN, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
