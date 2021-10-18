	object_const_def ; object_event constants

JubilifeCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return

JubilifeCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 33, 13, DEBUG_ROOM, 1
	warp_event 22, 11, DEBUG_ROOM, 1
	warp_event 12, 11, DEBUG_ROOM, 1
	warp_event  9, 29, DEBUG_ROOM, 1
	warp_event 23, 31, DEBUG_ROOM, 1
	warp_event 14, 25, DEBUG_ROOM, 1
	warp_event 20, 23, DEBUG_ROOM, 1
	warp_event 31, 19, DEBUG_ROOM, 1
	warp_event 31, 25, DEBUG_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
