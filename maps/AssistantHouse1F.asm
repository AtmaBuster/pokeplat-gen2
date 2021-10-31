	object_const_def ; object_event constants

AssistantHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AssistantHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SANDGEM_TOWN, 3
	warp_event  7,  7, SANDGEM_TOWN, 3
	warp_event  5,  0, ASSISTANT_HOUSE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
