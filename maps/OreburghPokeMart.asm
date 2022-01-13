	object_const_def ; object_event constants

OreburghPokeMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghPokeMart_Clerk1Script:
	jumpstd pokemartclerk

OreburghPokeMart_Clerk2Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OREBURGH
	closetext
	end

OreburghPokeMart_BadgeGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "The BADGES that"
	line "#MON GYMS give"
	cont "you are a measure"
	cont "of a TRAINER's"
	cont "worth."

	para "By getting more"
	line "BADGES, you get to"
	cont "buy more items in"
	cont "# MARTS."
	done

OreburghPokeMart_StaffGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "The # MART is"
	line "staffed by two"
	cont "young fellows."

	para "They offer"
	line "different kinds of"
	cont "merchandise."
	cont "Did you know?"
	done

OreburghPokeMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OREBURGH_CITY, 7
	warp_event  3,  7, OREBURGH_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokeMart_Clerk1Script, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokeMart_Clerk2Script, -1
	object_event  6,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokeMart_BadgeGuyScript, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokeMart_StaffGuyScript, -1
