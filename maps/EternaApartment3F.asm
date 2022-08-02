	object_const_def ; object_event constants

EternaApartment3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaApartment3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, ETERNA_APARTMENT_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
