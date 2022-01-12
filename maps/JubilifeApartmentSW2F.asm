	object_const_def ; object_event constants

JubilifeApartmentSW2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentSW2F_WiScript:
	jumptextfaceplayer .Text
.Text:
	text "WI: We come from"
	line "a faraway land."

	para "I come see the"
	line "#MON I trade."

	para "I worry if it"
	line "growing properly."
	done

JubilifeApartmentSW2F_FiScript:
	jumptextfaceplayer .Text
.Text:
	text "FI: I like look at"
	line "#MON I get from"
	cont "friend in trade."

	para "It make me remem-"
	line "ber my friend."
	done

JubilifeApartmentSW2F_ManScript:
	jumptextfaceplayer .Text
.Text:
	text "You can trade"
	line "#MON with"
	cont "people around the"
	cont "world on WFC…"

	para "Just hearing that"
	line "gets my heart"
	cont "racing."

	para "Such exciting"
	line "times!"
	done

JubilifeApartmentSW2F_GirlScript:
	jumptextfaceplayer .Text
.Text:
	text "When you connect"
	line "with people on"
	cont "WFC, it's hard to"
	cont "tell if the world's"
	cont "big or small."
	done

JubilifeApartmentSW2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, JUBILIFE_APARTMENT_SW_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW2F_WiScript, -1
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW2F_FiScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW2F_ManScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentSW2F_GirlScript, -1
