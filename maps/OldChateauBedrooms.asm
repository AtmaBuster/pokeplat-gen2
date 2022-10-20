	object_const_def ; object_event constants

OldChateauBedrooms_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldChateauBedrooms_MapEvents:
	db 0, 0 ; filler

	db 17 ; warp events
	warp_event 16, 15, OLD_CHATEAU_ENTRYWAY, 12
	warp_event 17, 15, OLD_CHATEAU_ENTRYWAY, 12
	warp_event  9, 12, OLD_CHATEAU_BEDROOMS, 9
	warp_event 13, 12, OLD_CHATEAU_BEDROOMS, 11
	warp_event 17, 12, OLD_CHATEAU_BEDROOMS, 13
	warp_event 21, 12, OLD_CHATEAU_BEDROOMS, 15
	warp_event 25, 12, OLD_CHATEAU_BEDROOMS, 17
	warp_event  2,  5, OLD_CHATEAU_BEDROOMS, 3
	warp_event  3,  5, OLD_CHATEAU_BEDROOMS, 3
	warp_event  9,  5, OLD_CHATEAU_BEDROOMS, 4
	warp_event 10,  5, OLD_CHATEAU_BEDROOMS, 4
	warp_event 16,  5, OLD_CHATEAU_BEDROOMS, 5
	warp_event 17,  5, OLD_CHATEAU_BEDROOMS, 5
	warp_event 23,  5, OLD_CHATEAU_BEDROOMS, 6
	warp_event 24,  5, OLD_CHATEAU_BEDROOMS, 6
	warp_event 30,  5, OLD_CHATEAU_BEDROOMS, 7
	warp_event 31,  5, OLD_CHATEAU_BEDROOMS, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
