	object_const_def ; object_event constants

PoketchCompany2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PoketchCompany2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  0, POKETCH_COMPANY_1F, 5
	warp_event  4,  0, POKETCH_COMPANY_3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
