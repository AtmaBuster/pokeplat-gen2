	object_const_def ; object_event constants

TrainersSchool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainersSchool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, JUBILIFE_CITY, 10
	warp_event  5,  7, JUBILIFE_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
