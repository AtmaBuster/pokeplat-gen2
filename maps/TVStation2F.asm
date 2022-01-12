	object_const_def ; object_event constants

TVStation2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation2F_FittingRoomGuy:
	jumptextfaceplayer .Text
.Text:
IF DEF(_DEMO1)
	text "Sorry, the fitting"
	line "room is closed"
	cont "right now."

	para "Come back in a"
	line "later version."
	done
ELSE
	text "The room at the"
	line "back is our dreamy"
	cont "fitting room."

	para "Once you're done in"
	line "there, get our"
	cont "dreamy HIKER to"
	cont "take a dreamy"
	cont "photo!"
	done
ENDC

TVStation2F_WomanScript:
	jumptextfaceplayer .Text
.Text:
	text "I don't know what"
	line "to do."

	para "What accessories"
	line "will go well with"
	cont "my dress today?"
	done

TVStation2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	
	warp_event  8,  0, TV_STATION_3F, 1
	warp_event  5,  0, TV_STATION_1F, 3
	warp_event  1,  0, TV_STATION_2F2, 1
	warp_event 11,  0, TV_STATION_ELEVATOR, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
IF DEF(_DEMO1)
	object_event  1,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation2F_FittingRoomGuy, -1
ELSE
	object_event  1,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation2F_FittingRoomGuy, -1
ENDC
;	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation2F_MaskGuyScript, -1
	object_event  6,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation2F_WomanScript, -1
