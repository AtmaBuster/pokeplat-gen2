	object_const_def ; object_event constants
	const TWINLEAFHOUSE1_OBJECT1
	const TWINLEAFHOUSE1_OBJECT2

TwinleafHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwinleafHouse1GrannyScript:
	faceplayer
	checkevent EVENT_GOT_POKEDEX
	iftrue .AfterDex
	jumptext .Granny

.AfterDex:
	jumptext .AfterDexText

.Granny:
	text "Did you hear?"

	para "The #MON PROF."
	line "returned to the"
	cont "next town over."
	
	para "They say he was"
	line "gone for four long"
	cont "years."

	para "I wonder if he"
	line "found some amazing"
	cont "#MON while he"
	cont "was gone?"
	done

.AfterDexText:
	text "Well! PROFESSOR"
	line "ROWAN gave you a"
	cont "#DEX, did he?"
	done

TwinleafHouse1TwinScript:
	faceplayer
	checkevent EVENT_GOT_POKEDEX
	iftrue .AfterDex
	jumptext .Twin

.AfterDex:
	jumptext .AfterDexText

.Twin:
	text "Listen, listen,"
	next "<PLAYER>."

	para "I want a cute"
	line "#MON!"
	done

.AfterDexText:
	text "Listen, listen,"
	line "<PLAYER>."

	para "Do you think I can"
	line "be friends with"
	cont "#MON like you?"
	done

TwinleafHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, TWINLEAF_TOWN, 3
	warp_event 3, 7, TWINLEAF_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwinleafHouse1GrannyScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwinleafHouse1TwinScript, -1
