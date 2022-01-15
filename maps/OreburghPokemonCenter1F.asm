	object_const_def ; object_event constants

OreburghPokemonCenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghPokemonCenter1F_NurseScript:
	jumpstd pokecenternurse

OreburghPokemonCenter1F_PCGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "Switch on the PC"
	line "at any #MON"
	cont "CENTER."

	para "Connect to"
	line "“SOMEONE's PC” and"
	cont "access the #MON"
	cont "STORAGE SYSTEM."

	para "That's all you need"
	line "to do to store or"
	cont "bring out your"
	cont "#MON."
	done

OreburghPokemonCenter1F_TeamGalacticGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Hmmm!"

	para "What, or who, is"
	line "TEAM GALACTIC?!"

	para "They make"
	line "wonderful claims"
	cont "of a dream energy"
	cont "source on one"
	cont "hand…"

	para "But rumor has it,"
	line "they steal #MON"
	cont "from others by"
	cont "force."

	para "It's a mystery!"
	line "They're mysterious!"

	para "Isn't anyone"
	line "investigating"
	cont "them?"
	done

OreburghPokemonCenter1F_MapEvents:
	db 0, 0 ; filler

	db 3	; warp events
	warp_event  3,  7, OREBURGH_CITY, 6
	warp_event  4,  7, OREBURGH_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_NurseScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_PCGirlScript, -1
;	object_event  2,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_, -1
;	object_event  8,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_, -1
	object_event  6,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_TeamGalacticGuyScript, -1
;	object_event  7,  3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_, -1
;	object_event  8,  3, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghPokemonCenter1F_, -1
