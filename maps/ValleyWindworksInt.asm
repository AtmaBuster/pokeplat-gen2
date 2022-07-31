	object_const_def ; object_event constants

ValleyWindworksInt_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ValleyWindworksInt_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 8, 9, VALLEY_WINDWORKS_EXT, 1
	warp_event 9, 9, VALLEY_WINDWORKS_EXT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
