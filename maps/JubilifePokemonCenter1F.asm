	object_const_def ; object_event constants
	const JUBILIFE_POKEMON_CENTER_1F_NURSE

JubilifePokemonCenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifePokemonCenter1FNurseScript:
	jumpstd pokecenternurse

JubilifePokemonCenter1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, JUBILIFE_CITY, 4
	warp_event  4,  7, JUBILIFE_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokemonCenter1FNurseScript, -1
