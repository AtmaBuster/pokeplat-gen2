	object_const_def ; object_event constants

LakeVerityCavern_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LakeVerityCavern_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 17, LAKE_VERITY_HIGH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
