	object_const_def ; object_event constants
	const TWINLEAFHOUSE2_OBJECT1

TwinleafHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwinleafHouse2_ManScript:
	faceplayer
	checkevent EVENT_MET_CYRUS_AT_LAKE_VERITY
	iftrue .AfterCyrus
	jumptext .Text1

.AfterCyrus:
	jumptext .Text2

.Text1:
	text "You're off to hang"
	line "with <RIVAL>"
	cont "again, right?"

	para "You two sure are"
	line "tight!"
	done

.Text2:
	text "I went on an adve-"
	line "nture with some"
	cont "#MON a long"
	cont "time ago."

	para "It was only to"
	line "SANDGEM, the next"
	cont "town over, though."
	cont "Yeah, good times…"
	done

TwinleafHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, TWINLEAF_TOWN, 4
	warp_event 3, 7, TWINLEAF_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TwinleafHouse2_ManScript, -1
