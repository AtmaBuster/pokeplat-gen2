	object_const_def ; object_event constants

EternaGalacticBuilding3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaGalacticBuilding3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  1, ETERNA_GALACTIC_BUILDING_2F, 3
	warp_event  7,  1, ETERNA_GALACTIC_BUILDING_2F, 4
	warp_event  9,  1, ETERNA_GALACTIC_BUILDING_4F, 1
	warp_event 13,  1, ETERNA_GALACTIC_BUILDING_4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
