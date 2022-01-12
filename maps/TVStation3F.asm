	object_const_def ; object_event constants

TVStation3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation3F_RecordGirlScript:
	jumptextfaceplayer .Text
.Text:
IF DEF(_DEMO1)
	text "Sorry, but the"
	line "GLOBAL RANKING"
	cont "ROOM is undergoing"
	cont "maintainence."

	para "Please return in a"
	line "later version."
	done
ELSE
	text "The room closes to"
	line "the stairs is the"
	cont "GROUP RANKING"
	cont "ROOM."

	para "The room on the"
	line "opposite side is"
	cont "the GLOBAL RANKING"
	cont "ROOM."
	done
ENDC

TVStation3F_RecordGuyScript:
	jumptextfaceplayer .Text
.Text:
IF DEF(_DEMO1)
	text "Sorry, but the"
	line "GROUP RANKING"
	cont "ROOM is undergoing"
	cont "maintainence."

	para "Please return in a"
	line "later version."
	done
ELSE
	text "Records are fine"
	line "things. They tell"
	cont "you the history of"
	cont "stuff."

	para "You can really"
	line "sense dramatic"
	cont "stories behind all"
	cont "those numbers!"
	done
ENDC

TVStation3F_TradeGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "I just realized"
	line "something awesome!"

	para "I should be"
	line "trading #MON"
	cont "more!"

	para "The more trades I"
	line "make, the better"
	cont "my odds of winning"
	cont "the #MON"
	cont "LOTTERY!"

	para "Why? Because the"
	line "ID No. of a"
	cont "#MON differs"
	cont "from TRAINER to"
	cont "TRAINER!"
	done

;TVStation3F_InterviewGuyScript:

TVStation3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	
	warp_event  5,  0, TV_STATION_2F, 1
	warp_event  8,  0, TV_STATION_4F, 1
	warp_event  1,  0, TV_STATION_3F2, 1
	warp_event  3,  0, TV_STATION_3F3, 1
	warp_event 11,  0, TV_STATION_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
IF DEF(_DEMO1)
	object_event  1,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_RecordGirlScript, -1
	object_event  3,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_RecordGuyScript, -1
ELSE
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_RecordGirlScript, -1
	object_event  9,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_RecordGuyScript, -1
ENDC
;	object_event  6,  8, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_InterviewGuyScript, -1
	object_event  7,  8, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation3F_TradeGirlScript, -1
