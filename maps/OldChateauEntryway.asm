	object_const_def ; object_event constants

OldChateauEntryway_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldChateauEntryway_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 18, 11, ETERNA_FOREST_INT, 5
	warp_event 19, 11, ETERNA_FOREST_INT, 6
	warp_event 12,  4, OLD_CHATEAU_ENTRYWAY, 7
	warp_event 12,  5, OLD_CHATEAU_ENTRYWAY, 8
	warp_event 25,  4, OLD_CHATEAU_ENTRYWAY, 9
	warp_event 25,  5, OLD_CHATEAU_ENTRYWAY, 10
	warp_event  5,  3, OLD_CHATEAU_ENTRYWAY, 3
	warp_event  5,  4, OLD_CHATEAU_ENTRYWAY, 4
	warp_event 32,  3, OLD_CHATEAU_ENTRYWAY, 5
	warp_event 32,  4, OLD_CHATEAU_ENTRYWAY, 6
	warp_event 19,  5, OLD_CHATEAU_DINING, 1
	warp_event 19,  1, OLD_CHATEAU_BEDROOMS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
