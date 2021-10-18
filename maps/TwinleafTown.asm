	object_const_def ; object_event constants

TwinleafTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	return

TwinleafTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15,  7, DEBUG_ROOM, 1
	warp_event 15, 13, PLAYERS_HOUSE_1F, 1
	warp_event  5,  7, DEBUG_ROOM, 1
	warp_event  5, 13, DEBUG_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
