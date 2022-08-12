	object_const_def ; object_event constants

EternaGalacticBuilding1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaGalacticBuilding1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 11, ETERNA_CITY, 10
	warp_event  9, 11, ETERNA_CITY, 10
	warp_event 11,  3, ETERNA_GALACTIC_BUILDING_2F, 1
	warp_event 15,  3, ETERNA_GALACTIC_BUILDING_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
