	object_const_def ; object_event constants

SandgemTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandgemTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8,  5, ROWANS_LAB, 1
	warp_event  7, 13, SANDGEM_HOUSE_1, 1
	warp_event 13, 13, ASSISTANT_HOUSE_1F, 1
	warp_event 21,  5, SANDGEM_POKEMART, 1
	warp_event 13,  5, SANDGEM_POKEMON_CENTER_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
