	object_const_def ; object_event constants

EternaApartment2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EternaApartment2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  1, ETERNA_APARTMENT_1F, 3
	warp_event  8,  1, ETERNA_APARTMENT_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
