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

	db 10 ; warp events
	warp_event 33, 13, JUBILIFE_APARTMENT_NE_1F, 1
	warp_event 23, 31, JUBILIFE_APARTMENT_SE_1F, 1
	warp_event  9, 29, JUBILIFE_APARTMENT_SW_1F, 1
	warp_event 31, 25, JUBILIFE_POKEMON_CENTER_1F, 1
	warp_event 31, 19, JUBILIFE_POKEMART, 1
	warp_event 11, 11, POKETCH_COMPANY_1F, 1
	warp_event 14, 11, POKETCH_COMPANY_1F, 3
	warp_event 22, 11, TV_STATION_1F, 1
	warp_event 14, 25, POKEMON_COMMUNICATION_CENTER, 1
	warp_event 20, 23, TRAINERS_SCHOOL, 1

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	object_event 18, 13, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 13, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 21, 13, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 13, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 30, 13, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 31, 13, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 14, SPRITE_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 21, 14, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 14, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 30, 14, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 31, 14, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
