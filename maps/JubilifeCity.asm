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
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
