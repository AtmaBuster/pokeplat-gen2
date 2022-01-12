	object_const_def ; object_event constants

PoketchCompany1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PoketchCompany1F_ReceptionistScript:
	jumptextfaceplayer .Text
.Text:
	text "Welcome to the"
	line "#TCH COMPANY."

	para "We're actually a"
	line "family-run"
	cont "business, so we're"
	cont "not so impressive."
	done

PoketchCompany1F_PresidentScript:
	jumptextfaceplayer .Text
.Text:
IF DEF(_DEMO1)
	text "Hi, hi!"

	para "I'm the president"
	line "of the #TCH"
	cont "COMPANY!"

	para "I'm developing a"
	line "new app, but it's"
	cont "not quite done."

	para "My guess is that"
	line "it will be ready"
	cont "when the next"
	cont "version comes out."
	done
ELSE
	text "Hi, hi!"

	para "I'm the president"
	line "of the #TCH"
	cont "COMPANY!"
	done
ENDC

PoketchCompany1F_AppDeveloperScript:
	jumptextfaceplayer .Text
.Text:
	text "Oh, you can be"
	line "sure I will keep"
	cont "developing #TCH"
	cont "apps."

	para "Just like #MON,"
	line "my #TCH is"
	cont "something that"
	cont "evolves!"
	done

PoketchCompany1F_TVGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "Hey, do you watch"
	line "TV? “#TCH"
	cont "Detective” is a"
	cont "great show."

	para "Seeing that"
	line "program compels me"
	cont "to use my #TCH"
	cont "more!"
	done

PoketchCompany1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  1,  7, JUBILIFE_CITY, 6
	warp_event  2,  7, JUBILIFE_CITY, 6
	warp_event  8,  7, JUBILIFE_CITY, 7
	warp_event  9,  7, JUBILIFE_CITY, 7
	warp_event  4,  0, POKETCH_COMPANY_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany1F_ReceptionistScript, -1
	object_event 10,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany1F_PresidentScript, -1
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany1F_AppDeveloperScript, -1
	object_event  3,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany1F_TVGirlScript, -1
;	object_event  4,  0, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany1F_, -1
