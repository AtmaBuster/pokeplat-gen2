	object_const_def ; object_event constants

OldChateauDining_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldChateauDining_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  9, OLD_CHATEAU_ENTRYWAY, 11
	warp_event 17,  9, OLD_CHATEAU_ENTRYWAY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
