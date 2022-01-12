	object_const_def ; object_event constants

JubilifeApartmentSE1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentSE1F_ManScript:
	jumptextfaceplayer .Text
.Text:
	text "#MON are"
	line "wonderful, and"
	cont "deeply mysterious"
	cont "creatures."

	para "But to TRAINERS,"
	line "the key thing is"
	cont "to do battle with"
	cont "their #MON."

	para "That's what it"
	line "boils down to."
	done

JubilifeApartmentSE1F_WomanScript:
	jumptextfaceplayer .Text
.Text:
	text "Hello there,"
	line "TRAINER!"

	para "If you get stumped"
	line "and don't know what"
	cont "to do…"

	para "Talk to people!"

	para "Talk to everyone"
	line "you see!"

	para "Go places!"

	para "Go wherever you"
	line "can!"

	para "You'll find many"
	line "new places by"
	cont "doing that."
	done

JubilifeApartmentSE1F_PachirisuScript:
	opentext
	writetext .Text
	cry PACHIRISU
	waitsfx
	closetext
	end

.Text:
	text "PACHIRISU:"
	line "Kukkuuh!"
	done

JubilifeApartmentSE1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, JUBILIFE_CITY, 2
	warp_event  7,  7, JUBILIFE_CITY, 2
	warp_event  8,  1, JUBILIFE_APARTMENT_SE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE1F_ManScript, -1
	object_event  4,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE1F_WomanScript, -1
	object_event  6,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE1F_PachirisuScript, -1
