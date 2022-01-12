	object_const_def ; object_event constants

JubilifeApartmentSW1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentSW1F_KidScript:
	jumptextfaceplayer .Text
.Text:
	text "I got my PIKACHU"
	line "through a trade"
	cont "from someone"
	cont "somewhere in the"
	cont "world."

	para "It grows quickly,"
	line "so its level goes"
	cont "up quickly, too."

	para "Bit it doesn't"
	line "always listen to"
	cont "me…"

	para "That's because I"
	line "only have one"
	cont "GYM BADGE."

	para "We don't always"
	line "have an easy time,"
	cont "but it's still my"
	cont "irreplaceable"
	cont "partner!"
	done

JubilifeApartmentSW1F_ManScript:
	jumptextfaceplayer .Text
.Text:
	text "If everyone around"
	line "the world had"
	cont "#MON…"

	para "Then everyone"
	line "around the world"
	cont "could communicate!"
	done

JubilifeApartmentSW1F_PikachuScript:
	faceplayer
	opentext
	writetext .Text
	cry PIKACHU
	waitsfx
	closetext
	end

.Text:
	text "PIKACHU:"
	line "Pikapikapikaaah!"
	done

JubilifeApartmentSW1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, JUBILIFE_CITY, 3
	warp_event  7,  7, JUBILIFE_CITY, 3
	warp_event  8,  1, JUBILIFE_APARTMENT_SW_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW1F_KidScript, -1
	object_event  9,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW1F_ManScript, -1
	object_event  5,  3, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW1F_PikachuScript, -1
