	object_const_def ; object_event constants

FloaromaTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 13, 23, FLOAROMA_POKEMON_CENTER_1F, 1
	warp_event 21, 17, FLOAROMA_POKEMART, 2
	warp_event  9, 15, FLOAROMA_HOUSE_W, 1
	warp_event 21, 23, FLOAROMA_HOUSE_E, 1
	warp_event 16, 15, FLOAROMA_FLOWER_SHOP, 2
	warp_event  4, 10, FLOAROMA_MEADOW, 1
	warp_event  5, 10, FLOAROMA_MEADOW, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
