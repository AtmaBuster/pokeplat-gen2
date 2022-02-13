	object_const_def ; object_event constants

Route204N_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route204N_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 17, RAVAGED_PATH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
