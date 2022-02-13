	object_const_def ; object_event constants

RavagedPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RavagedPath_RockScript:
	jumpstd smashrock

RavagedPath_PotionScript:
	itemball POTION

RavagedPath_TMRockTombScript:
	tmhmball TM_ROCK_TOMB

RavagedPath_LuckIncenseScript:
	itemball LUCK_INCENSE

RavagedPath_TMWaterPulseScript:
	tmhmball TM_WATER_PULSE

IF DEF(_DEMO1)
RavagedPath_EndOfDemoScript:
	jumptextfaceplayer .Text
.Text:
	text "Hey!"

	para "This is the end of"
	line "the demo version."

	para "Thanks a lot for"
	line "playing!"

	para "Did you try out"
	line "the mining game in"
	cont "the OREBURGH MINE?"

	para "I worked hard on"
	line "that, so please"
	cont "give it a go. :)"

	para "Please share any"
	line "bugs and feedback"
	cont "with us. We'd love"
	cont "to hear from you!"
	done
ENDC

RavagedPath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 29, ROUTE_204_S, 1
	warp_event 19, 25, ROUTE_204_N, 1

	db 0 ; coord events

	db 0 ; bg events

IF DEF(_DEMO1)
	db 11 ; object events
ELSE
	db 10 ; object events
ENDC
	object_event 15, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event 15, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event  4,  2, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event  3,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event 10, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event  8, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_RockScript, -1
	object_event 15, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RavagedPath_PotionScript, EVENT_RAVAGED_PATH_POTION
	object_event  4, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, RavagedPath_TMRockTombScript, EVENT_RAVAGED_PATH_TM_ROCK_TOMB
	object_event  9,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RavagedPath_LuckIncenseScript, EVENT_RAVAGED_PATH_LUCK_INCENSE
	object_event 18,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, RavagedPath_TMWaterPulseScript, EVENT_RAVAGED_PATH_TM_WATER_PULSE
IF DEF(_DEMO1)
	object_event 19, 25, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RavagedPath_EndOfDemoScript, -1
ENDC
