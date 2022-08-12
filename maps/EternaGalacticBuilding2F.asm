	object_const_def ; object_event constants

EternaGalacticBuilding2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaGalacticBuilding2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  1, ETERNA_GALACTIC_BUILDING_1F, 3
	warp_event  7,  1, ETERNA_GALACTIC_BUILDING_1F, 4
	warp_event  9,  1, ETERNA_GALACTIC_BUILDING_3F, 1
	warp_event 13,  1, ETERNA_GALACTIC_BUILDING_3F, 2


	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
