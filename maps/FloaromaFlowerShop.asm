	object_const_def ; object_event constants

FloaromaFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FloaromaFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, FLOAROMA_TOWN, 5
	warp_event  5,  5, FLOAROMA_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
