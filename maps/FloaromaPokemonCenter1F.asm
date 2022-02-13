	object_const_def ; object_event constants

FloaromaPokemonCenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaPokemonCenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, FLOAROMA_TOWN, 1
	warp_event  4,  7, FLOAROMA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
