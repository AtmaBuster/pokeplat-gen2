	object_const_def ; object_event constants

Route205N_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route205N_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 10, ETERNA_FOREST_INT, 3
	warp_event  4, 11, ETERNA_FOREST_INT, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
