	object_const_def ; object_event constants

PokemonCommunicationCenter_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks

PokemonCommunicationCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 15, JUBILIFE_CITY, 9
	warp_event  7, 15, JUBILIFE_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	