	object_const_def ; object_event constants

JubilifeCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return

JubilifeCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 33, 13, JUBILIFE_APARTMENT_NE_1F, 1
	warp_event 23, 31, JUBILIFE_APARTMENT_SE_1F, 1
	warp_event  9, 29, JUBILIFE_APARTMENT_SW_1F, 1
	warp_event 31, 25, JUBILIFE_POKEMON_CENTER_1F, 1
	warp_event 31, 19, JUBILIFE_POKEMART, 1
	warp_event 11, 11, POKETCH_COMPANY_1F, 1
	warp_event 14, 11, POKETCH_COMPANY_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
