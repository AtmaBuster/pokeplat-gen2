	object_const_def ; object_event constants

EternaGalacticBuilding4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaGalacticBuilding4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  1, ETERNA_GALACTIC_BUILDING_3F, 3
	warp_event  7,  1, ETERNA_GALACTIC_BUILDING_3F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
