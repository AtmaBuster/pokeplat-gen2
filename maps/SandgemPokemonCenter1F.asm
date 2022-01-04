	object_const_def ; object_event constants
	const SANDGEM_POKEMON_CENTER_1F_NURSE

SandgemPokemonCenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandgemPokemonCenter1FNurseScript:
	jumpstd pokecenternurse

SandgemPokemonCenter1F_NiceLadyWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "Talk to that nice"
	line "lady behind the"
	cont "counter and hand"
	cont "her your #MON."

	para "She'll heal your"
	line "#MON to perfect"
	cont "health in no time!"
	done

SandgemPokemonCenter1F_PCGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Do you see that PC"
	line "over there? That"
	cont "fancy blue one?" ; change

	para "If you've got any"
	line "#MON, it's free"
	cont "to use."
	done

SandgemPokemonCenter1F_TopFloorGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "The top floor of"
	line "any #MON"
	cont "CENTER is the"
	cont "#MON COMMUNI-"
	cont "CATION CLUB."

	para "There, you can"
	line "have all sorts of"
	cont "fun with your"
	cont "friends."
	done

SandgemPokemonCenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SANDGEM_TOWN, 5
	warp_event  4,  7, SANDGEM_TOWN, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemPokemonCenter1FNurseScript, -1
	object_event  5,  3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemPokemonCenter1F_NiceLadyWomanScript, -1
	object_event  8,  3, SPRITE_CHRIS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemPokemonCenter1F_PCGuyScript, -1
	object_event  1,  5, SPRITE_CHRIS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemPokemonCenter1F_TopFloorGirlScript, -1
