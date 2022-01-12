	object_const_def ; object_event constants

JubilifeApartmentSE2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentSE2F_KidScript:
	jumptextfaceplayer .Text
.Text:
	text "Did you know?"

	para "Some kinds of"
	line "#MON evolve"
	cont "when they get"
	cont "stronger from"
	cont "battling!"

	para "When they evolve,"
	line "they can take on"
	cont "completely"
	cont "different forms!"
	done

JubilifeApartmentSE2F_WomanScript:
	jumptextfaceplayer .Text
.Text:
	text "Evolution makes"
	line "#MON just that"
	cont "much more"
	cont "fascinating."

	para "The mysteries of"
	line "evolution…"

	para "Can that dandy"
	line "PROF.ROWAN unravel"
	cont "them?"
	done

JubilifeApartmentSE2F_CooltrainerScript:
	jumptextfaceplayer .Text
.Text:
	text "Didn't PROF.ROWAN"
	line "conduct research"
	cont "with PROF.OAK of"
	cont "the KANTO region?"
	done

JubilifeApartmentSE2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, JUBILIFE_APARTMENT_SE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE2F_KidScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE2F_WomanScript, -1
	object_event 10,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSE2F_CooltrainerScript, -1
