	object_const_def ; object_event constants

ValleyWindworksExt_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ValleyWindworksExt_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 13, VALLEY_WINDWORKS_INT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
