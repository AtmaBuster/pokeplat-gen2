	object_const_def ; object_event constants

JubilifePokeMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifePokeMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, JUBILIFE_CITY, 5
	warp_event  3,  7, JUBILIFE_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
