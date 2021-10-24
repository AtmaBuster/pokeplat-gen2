	object_const_def ; object_event constants

Route201_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route201_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  2, LAKE_VERITY_LOW, 1
	warp_event  5,  2, LAKE_VERITY_LOW, 2
	warp_event  4,  0, LAKE_VERITY_HIGH, 1
	warp_event  5,  0, LAKE_VERITY_HIGH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
