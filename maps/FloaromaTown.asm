	object_const_def ; object_event constants

FloaromaTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 15, FLOAROMA_POKEMON_CENTER_1F, 1
	warp_event 21,  9, FLOAROMA_POKEMART, 2
	warp_event  9,  7, FLOAROMA_HOUSE_W, 1
	warp_event 21, 15, FLOAROMA_HOUSE_E, 1
	warp_event 16,  7, FLOAROMA_FLOWER_SHOP, 2
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
