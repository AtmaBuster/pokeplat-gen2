	object_const_def ; object_event constants

OreburghGateB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerVeteranGrant:
	trainer VETERAN, GRANT, EVENT_BEAT_VETERAN_GRANT, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'm a VETERAN, yes,"
	line "but don't you dare"
	cont "treat me like a"
	cont "senior citizen!"
	done

.BeatenText:
	text "Grrr…"

	para "So young, and yet"
	line "so talented!"
	done

.AfterText:
	text "I'll always remain"
	line "young at heart."

	para "Never let them say"
	line "you're too old!"
	done

OreburghGateB1F_BikerScript:
	jumptextfaceplayer .Text
.Text:
	text "Do you see those"
	line "bumps on the"
	cont "ground?"

	para "It feels awesome"
	line "taking those fast"
	cont "on a BICYCLE."
	done

OreburghGateB1F_BigPearlScript:
	itemball BIG_PEARL

OreburghGateB1F_TMFlashScript:
	tmhmball TM_FLASH

OreburghGateB1F_TMBrickBreakScript:
	tmhmball TM_BRICK_BREAK

OreburghGateB1F_EarthPlateScript:
	itemball EARTH_PLATE

OreburghGateB1F_TMFocusPunchScript:
	tmhmball TM_FOCUS_PUNCH

OreburghGateB1F_RockScript:
	jumpstd smashrock

OreburghGateB1F_BoulderScript:
	jumpstd strengthboulder

OreburghGateB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 39,  3, OREBURGH_GATE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event 28,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_BikerScript, -1
	object_event  8, 13, SPRITE_VETERAN, SPRITEMOVEDATA_TURN_DOWN_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerVeteranGrant, -1
	object_event  4, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_BoulderScript, -1
	object_event  4,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_BoulderScript, -1
	object_event  5,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_RockScript, -1
	object_event 42,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_RockScript, -1
	object_event 30,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_RockScript, -1
	object_event 21, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGateB1F_RockScript, -1
	object_event 32,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghGateB1F_BigPearlScript, -1
	object_event 45,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, OreburghGateB1F_TMFlashScript, -1
	object_event 16,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, OreburghGateB1F_TMBrickBreakScript, -1
	object_event  3, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghGateB1F_EarthPlateScript, -1
	object_event  4,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, OreburghGateB1F_TMFocusPunchScript, -1
