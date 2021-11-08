	object_const_def ; object_event constants

PoketchCompany1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PoketchCompany1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  1,  7, JUBILIFE_CITY, 6
	warp_event  2,  7, JUBILIFE_CITY, 6
	warp_event  8,  7, JUBILIFE_CITY, 7
	warp_event  9,  7, JUBILIFE_CITY, 7
	warp_event  4,  0, POKETCH_COMPANY_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
