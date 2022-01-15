	object_const_def ; object_event constants

OreburghApartmentNW1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentNW1F_KidScript:
	jumptextfaceplayer .Text
.Text:
	text "A GYM LEADER isn't"
	line "like just any"
	cont "TRAINER you meet."

	para "Obviously, they're"
	line "a lot tougher."
	cont "A lot."

	para "I'd take as many"
	line "#MON as"
	cont "possible if I were"
	cont "you."
	done

OreburghApartmentNW1F_WomanScript:
	jumptextfaceplayer .Text
.Text:
	text "ROARK lets us"
	line "train our #MON"
	cont "in the mine."
	done

OreburghApartmentNW1F_ManScript:
	jumptextfaceplayer .Text
.Text:
	text "There are eight"
	line "GYM LEADERS in the"
	cont "SINNOH region."

	para "The objective for"
	line "TRAINERS is to get"
	cont "GYM BADGES from"
	cont "them all."

	para "That means you"
	line "have to defeat all"
	cont "of them in battles"
	cont "at their GYMS!"
	done

OreburghApartmentNW1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, OREBURGH_CITY, 8
	warp_event  7,  7, OREBURGH_CITY, 8
	warp_event  8,  1, OREBURGH_APARTMENT_NW_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW1F_KidScript, -1
	object_event  4,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW1F_WomanScript, -1
	object_event  7,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW1F_ManScript, -1
