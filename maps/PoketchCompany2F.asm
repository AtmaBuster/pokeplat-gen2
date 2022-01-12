	object_const_def ; object_event constants

PoketchCompany2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PoketchCompany2F_GoodAppsGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "We'll try to think"
	line "like a TRAINER and"
	cont "find what #TCH"
	cont "apps would be"
	cont "good."
	done

PoketchCompany2F_PresidentDadScript:
	jumptextfaceplayer .Text
.Text:
	text "#MON WATCH!"
	line "That's #TCH for"
	cont "short."

	para "Say it the long"
	line "way and…"

	para "What does #MON"
	line "stand for again?"

	para "Anyway, I'm the"
	line "father of the"
	cont "president of the"
	cont "#TCH COMPANY!"
	done

PoketchCompany2F_ClefairyScript:
	faceplayer
	opentext
	writetext .Text
	cry CLEFAIRY
	waitsfx
	closetext
	end

.Text:
	text "CLEFAIRY: Cleffy?"
	done

PoketchCompany2F_PachirisuScript:
	faceplayer
	opentext
	writetext .Text
	cry PACHIRISU
	waitsfx
	closetext
	end

.Text:
	text "PACHIRISU:"
	line "Patchii?"
	done

PoketchCompany2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  0, POKETCH_COMPANY_1F, 5
	warp_event  4,  0, POKETCH_COMPANY_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany2F_GoodAppsGuyScript, -1
	object_event  0,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany2F_PresidentDadScript, -1
	object_event  1,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany2F_ClefairyScript, -1
	object_event  2,  7, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany2F_PachirisuScript, -1
