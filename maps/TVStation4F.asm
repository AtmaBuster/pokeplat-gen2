	object_const_def ; object_event constants

TVStation4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation4F_MottoWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "“Participation for"
	line "all” is our TV"
	cont "network's motto."
	done

TVStation4F_ThemeWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "We're promoting the"
	line "theme “Smiles are"
	cont "dreamy.”"

	para "In keeping with"
	line "that name, we've"
	cont "added variety"
	cont "programs to our"
	cont "schedule."

	para "Please do tune in!"
	done

TVStation4F_ExploitsGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Your exploits are"
	line "fantastic!"

	para "With our TV"
	line "station, we can"
	cont "tell the whole"
	cont "world about you!"

	para "It's one of many"
	line "possibilities!"

	para "Harrumph!"
	done

TVStation4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	
	warp_event  5,  0, TV_STATION_3F, 2
	warp_event 11,  0, TV_STATION_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation4F_MottoWomanScript, -1
	object_event 11,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation4F_ThemeWomanScript, -1
	object_event  4,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation4F_ExploitsGuyScript, -1
