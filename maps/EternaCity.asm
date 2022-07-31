	object_const_def ; object_event constants

EternaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ETERNA
	return

EternaCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 15, ETERNA_POKEMON_CENTER_1F, 1
	warp_event 17, 27, ETERNA_POKEMART, 2
	warp_event 18, 35, ETERNA_GYM, 2
	warp_event  9, 35, ETERNA_HOUSE_W, 2
	warp_event 29, 19, ETERNA_HOUSE_E, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
