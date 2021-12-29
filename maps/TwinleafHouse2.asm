	object_const_def ; object_event constants
	const TWINLEAFHOUSE2_OBJECT1

TwinleafHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwinleafHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, TWINLEAF_TOWN, 4
	warp_event 3, 7, TWINLEAF_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  0, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
