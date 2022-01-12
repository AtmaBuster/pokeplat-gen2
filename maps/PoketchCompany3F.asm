	object_const_def ; object_event constants

PoketchCompany3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PoketchCompany3F_GrannyScript:
	jumptextfaceplayer .Text
.Text:
	text "People everywhere"
	line "make #TCH apps."

	para "You'll be able to"
	line "get new apps from"
	cont "surprising places."
IF DEF(_DEMO1)
	done
ELSE
	para "The PCs here have"
	line "guides on the"
	cont "various #TCH"
	cont "apps."
	done
ENDC

PoketchCompany3F_KidScript:
	jumptextfaceplayer .Text
.Text:
	text "Do you have a"
	line "#TCH? There's"
	cont "a girl's model and"
	cont "a boy's model, each"
	cont "in different"
	cont "colors."
	done

PoketchCompany3F_WomanScript:
	jumptextfaceplayer .Text
.Text:
	text "My husband's the"
	line "president."

	para "We started out in"
	line "a small workshop"
	cont "where he made what"
	cont "he liked."

	para "Now we're making"
	line "something that"
	cont "makes the world"
	cont "happy."

	para "Imagine that!"
	done

PoketchCompany3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, POKETCH_COMPANY_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany3F_GrannyScript, -1
	object_event  5,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany3F_KidScript, -1
	object_event  9,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoketchCompany3F_WomanScript, -1
