DebugRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DebugRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, DEBUG_ROOM, 1
	warp_event  0,  0, DEBUG_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
