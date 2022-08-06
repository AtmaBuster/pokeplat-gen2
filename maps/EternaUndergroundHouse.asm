	object_const_def ; object_event constants

EternaUndergroundHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaUndergroundHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  5, ETERNA_CITY, 9
	warp_event  3,  5, ETERNA_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
