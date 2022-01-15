	object_const_def ; object_event constants

JubilifeApartmentNE2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentNE2F_GuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Did you buy some"
	line "HEAL BALLS at the"
	cont "# MART?"

	para "A HEAL BALL heals"
	line "the #MON it"
	cont "captures on the"
	cont "spot."

	para "That means you can"
	line "catch a #MON"
	cont "and have it"
	cont "battle-ready right"
	cont "away."

	para "Of course, if your"
	line "team has six"
	cont "#MON in it, it"
	cont "won't do any good."
	done

JubilifeApartmentNE2F_KidScript:
	jumptextfaceplayer .Text
.Text:
	text "I like how #MON"
	line "can use attacks."

	para "That makes things"
	line "fun and different."

	para "Sometimes, when"
	line "they get stronger,"
	cont "#MON learn new"
	cont "moves."

	para "That keeps things"
	line "fresh and fun when"
	cont "using moves."
	done

JubilifeApartmentNE2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, JUBILIFE_APARTMENT_NE_1F, 3
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE2F_GuyScript, -1
	object_event  6,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE2F_KidScript, -1
