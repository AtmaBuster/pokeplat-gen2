	object_const_def ; object_event constants

OreburghApartmentE1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentE1F_FirstMonGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "You remind me so"
	line "much of the time"
	cont "I got my first"
	cont "#MON."
	done

OreburghApartmentE1F_WhichMovesGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "I always have a"
	line "rottem time trying"
	cont "to decide which"
	cont "moves my #MON"
	cont "should learn."
	done
	
OreburghApartmentE1F_TrainingGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Hiya! Your #MON"
	line "could use some"
	cont "toughening up."

	para "Why not try"
	line "training in the"
	cont "OREBURGH MINE?"
	done

OreburghApartmentE1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, OREBURGH_CITY, 10
	warp_event  7,  7, OREBURGH_CITY, 10
	warp_event  8,  1, OREBURGH_APARTMENT_E_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE1F_FirstMonGuyScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE1F_WhichMovesGuyScript, -1
	object_event  9,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE1F_TrainingGuyScript, -1
