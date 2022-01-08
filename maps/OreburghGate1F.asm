	object_const_def ; object_event constants
	const OREBURGHGATE_OBJECT0
	const OREBURGHGATE_OBJECT1
	const OREBURGHGATE_OBJECT2
	const OREBURGHGATE_OBJECT3
	const OREBURGHGATE_OBJECT4
	const OREBURGHGATE_OBJECT5
	const OREBURGHGATE_OBJECT6
	const OREBURGHGATE_OBJECT7

OreburghGate1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_DEFAULT
	scene_script .Dummy ; SCENE_FINISHED

	db 0 ; callbacks

.Dummy:
	end

OreburghGate1F_GiveRockSmashScript:
	showemote EMOTE_SHOCK, OREBURGHGATE_OBJECT0, 15
OreburghGate1F_HikerScript:
	faceplayer
	checkevent EVENT_GOT_HM05_ROCK_SMASH
	iftrue .GotRockSmash
	opentext
	writetext .SparklingPoketchText
	waitbutton
	verbosegivetmhm HM_ROCK_SMASH
	setevent EVENT_GOT_HM05_ROCK_SMASH
	waitbutton
	writetext .HMExplainText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

.GotRockSmash:
	checkevent EVENT_GOT_COAL_BADGE
	iftrue .AfterRoark
	jumptext .HMExplainText

.AfterRoark:
	jumptext .AfterRoarkText

.SparklingPoketchText:
	text "That sparkling new"
	line "#TCH!"

	para "Your awkwardness"
	line "as a traveler!"

	para "Hmm… You're still a"
	line "new TRAINER, aren't"
	cont "you?"

	para "But it's all good!"
	line "You're a new fellow"
	cont "friend of #MON!"

	para "So, let me make a"
	line "gift to you of a"
	cont "HIDDEN MACHINE!"
	done

.HMExplainText:
	text "That HIDDEN"
	line "MACHINE, or HM for"
	cont "short, contains"
	cont "the hidden move"
	cont "ROCK SMASH."

	para "A #MON learning"
	line "ROCK SMASH can"
	cont "smash small"
	cont "boulders in the"
	cont "field."

	para "But the TRAINER"
	line "has to have the"
	cont "GYM BADGE from"
	cont "OREBURGH CITY."

	para "If you don't have"
	line "that BADGE, you"
	cont "can't make a"
	cont "#MON use the"
	cont "hidden move ROCK"
	cont "SMASH outside of"
	cont "battle."
	done

.AfterRoarkText:
	text "Oh! Good golly!"

	para "That's OREBURGH"
	line "CITY's GYM BADGE!"

	para "All right! Now you"
	line "can use the hidden"
	cont "move ROCK SMASH on"
	cont "small boulders!"
	done

OreburghGate1F_RockScript:
	jumpstd smashrock

TrainerCamperCurtis:
	trainer CAMPER, CURTIS, EVENT_BEAT_CAMPER_CURTIS, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "We TRAINERS will"
	line "accept challenges"
	cont "anywhere!"
	cont "It's what we do."
	done

.BeatenText:
	text "Hmm…"

	para "Insufficiently"
	line "raised?"
	done

.AfterText:
	text "#MON can appear"
	line "anywhere in caves."

	para "It's not like the"
	line "tall grass by"
	cont "roads."
	done

TrainerPicnickerDiana:
	trainer PICNICKER, DIANA, EVENT_BEAT_PICNICKER_DIANA, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "To celebrate my"
	line "getting through"
	cont "this cave, I'm"
	cont "going to battle"
	cont "you!"
	done

.BeatenText:
	text "Well, I guess a"
	line "loss is something"
	cont "to commemorate,"
	cont "too…"
	done

.AfterText:
	text "Getting through"
	line "that cave feels"
	cont "like an adventure."
	done

OreburghGate1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, ROUTE_203, 1
	warp_event 23, 15, OREBURGH_CITY, 1
	warp_event 17,  3, OREBURGH_GATE_B1F, 1

	db 1 ; coord events
	coord_event  6, 15, SCENE_DEFAULT, OreburghGate1F_GiveRockSmashScript

	db 0 ; bg events

	db 8 ; object events
	object_event  6, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_HikerScript, -1
	object_event 14, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCamperCurtis, -1
	object_event 21, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerDiana, -1
	object_event 13,  2, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_RockScript, -1
	object_event 10,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_RockScript, -1
	object_event 10, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_RockScript, -1
	object_event 11, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_RockScript, -1
	object_event 16, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGate1F_RockScript, -1
