	object_const_def ; object_event constants
	const ROUTE203_RIVAL
	const ROUTE203_OBJECT1
	const ROUTE203_OBJECT2
	const ROUTE203_OBJECT3
	const ROUTE203_OBJECT4
	const ROUTE203_OBJECT5
	const ROUTE203_OBJECT6
	const ROUTE203_OBJECT7
	const ROUTE203_OBJECT8
	const ROUTE203_OBJECT9

Route203_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_DEFAULT
	scene_script .Dummy ; SCENE_FINISHED

	db 0 ; callbacks

.Dummy:
	end

Route203_RivalBattleScriptU:
	settableindex 0
	sjump Route203_RivalBattleScript

Route203_RivalBattleScriptD:
	settableindex 1
Route203_RivalBattleScript:
	showemote EMOTE_SHOCK, ROUTE203_RIVAL, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovementtable ROUTE203_RIVAL, .ApproachPlayerMovement
	opentext
	writetext .IntroText
	waitbutton
	closetext
	callstd tableindexfromstarter
	winlosstext .WinText, 0
	loadtrainertable .RivalTrainerTable
	startbattle
	reloadmapafterbattle
	opentext
	writetext .AfterText
	waitbutton
	closetext
	applymovement ROUTE203_RIVAL, .LeaveMovement
	disappear ROUTE203_RIVAL
	setscene SCENE_FINISHED
	end

.IntroText:
	text "<RIVAL>: Hey!"
	line "<PLAYER>!"

	para "Tell me you got a"
	line "little tougher!"

	para "Me? Do you even"
	line "need to ask?"

	para "Of course I got"
	line "tougher!"

	para "Come on! I'll"
	line "demonstrate it!"
	done

.WinText:
	text "What's going on?"
	line "What, I lost?!"
	done

.AfterText:
	text "<RIVAL>: Waah!"
	line "What do you mean I"
	cont "lost?!"

	para "Well, that's it!"
	line "That's the last"
	cont "time that I'll ever"
	cont "lose!"

	para "I'm going to be the"
	line "world's toughest"
	cont "TRAINER, and you"
	cont "know it!"

	para "The first thing to"
	line "do is take on the"
	cont "OREBURGH CITY"
	cont "#MON GYM!"

	para "I'm gonna toughen"
	line "up for that,"
	cont "totally!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementU
	dw .ApproachPlayerMovementD

.ApproachPlayerMovementU:
	step LEFT
	step LEFT
	step LEFT
	step_end

.ApproachPlayerMovementD:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step_end

.LeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.RivalTrainerTable:
	db RIVAL1, RIVAL1_2_CHIMCHAR
	db RIVAL1, RIVAL1_2_PIPLUP
	db RIVAL1, RIVAL1_2_TURTWIG

Route203_LassScript:
	jumptextfaceplayer .Text
.Text:
	text "Your favorite"
	line "#MON should be"
	cont "placed on top of"
	cont "your party list."

	para "That way, it will"
	line "be the first to go"
	cont "out in a battle."
	done

Route203_JubilifeSignScript:
	jumptextsign .Text
.Text:
	text "<SIGNL> ROUTE 203"
	line "    JUBILIFE CITY"
	done

Route203_TrainerTips1Script:
	jumptext .Text
.Text:
	text "TRAINER TIPS!"

	para "#MON moves use"
	line "energy called"
	cont "POWER POINTS, or"
	cont "PP for short."

	para "If the PP of moves"
	line "runs low, head for"
	cont "a #MON CENTER."
	done

Route203_TrainerTips2Script:
	jumptext .Text
.Text:
	text "TRAINER TIPS!"

	para "If a #MON is"
	line "about to evolve,"
	cont "it can be stopped."

	para "Press the B BUTTON"
	line "during evolution"
	cont "to startle the"
	cont "#MON into"
	cont "stopping."

	para "That is how"
	line "evolution can be"
	cont "cancelled."
	done

Route203_OreburghSignScript:
	jumptextsign .Text
.Text:
	text "<SIGNR> ROUTE 203"
	line "    OREBURGH CITY"
	done

Route203_PokeBallScript:
	itemball POKE_BALL

Route203_RepelScript:
	itemball REPEL

Route203_XDefendScript:
	itemball X_DEFEND

TrainerYoungsterMichael:
	trainer YOUNGSTER, MICHAEL, EVENT_BEAT_YOUNGSTER_MICHAEL, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I get my energy"
	line "from my #MON!"

	para "Here we go!"
	line "KRICKETOT! ZUBAT!"
	done

.BeatenText:
	text "Ack! My #MON…"
	done

.AfterText:
	text "Keep out of the"
	line "grass or dodge the"
	cont "eyes of TRAINERS…?"

	para "I have a hard time"
	line "deciding."
	done

TrainerYoungsterDallas:
	trainer YOUNGSTER, DALLAS1, EVENT_BEAT_YOUNGSTER_DALLAS1, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'm never apart"
	line "from my SHINX."

	para "Our bond is"
	line "strong!"
	done

.BeatenText:
	text "So sad…"
	line "And so crushed…"
	done

.AfterText:
	text "I don't bear"
	line "grudges over"
	cont "losing."

	para "But I promise I'll"
	line "get tougher!"
	done

TrainerYoungsterBastian:
	trainer YOUNGSTER, BASTIAN, EVENT_BEAT_YOUNGSTER_BASTIAN, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Before I challenge"
	line "the GYM LEADER,"
	cont "I'll test my"
	cont "strength on you!"
	done

.BeatenText:
	text "I guess it means"
	line "I'm not ready for"
	cont "the GYM challenge…"
	done

.AfterText:
	text "I guess if you"
	line "don't have a single"
	cont "GYM BADGE, you're a"
	cont "total nobody…"
	done

TrainerLassKaitlin:
	trainer LASS, KAITLIN, EVENT_BEAT_LASS_KAITLIN, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I found a TRAINER"
	line "while looking for"
	cont "some #MON!"
	done

.BeatenText:
	text "Hunh? You're"
	line "finished so soon?"
	done

.AfterText:
	text "I walk through the"
	line "tall grass until"
	cont "I find the #MON"
	cont "I want."
	done

TrainerLassMadeline:
	trainer LASS, MADELINE1, EVENT_BEAT_LASS_MADELINE1, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I got a nifty-keen"
	line "GYM BADGE from the"
	cont "GYM LEADER in"
	cont "OREBURGH CITY!"
	done

.BeatenText:
	text "Oh, I lost!"
	line "Lalala!"
	done

.AfterText:
	text "I'm collecting lots"
	line "of GYM BADGES."

	para "They're so sparkly"
	line "and pretty!"
	done

Route203_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 44,  9, OREBURGH_GATE_1F, 1

	db 2 ; coord events
	coord_event  4, 14, SCENE_DEFAULT, Route203_RivalBattleScriptU
	coord_event  4, 15, SCENE_DEFAULT, Route203_RivalBattleScriptD

	db 4 ; bg events
	bg_event  5, 13, BGEVENT_READ, Route203_JubilifeSignScript
	bg_event 21,  9, BGEVENT_READ, Route203_TrainerTips1Script
	bg_event 37, 12, BGEVENT_READ, Route203_TrainerTips2Script
	bg_event 41,  9, BGEVENT_READ, Route203_OreburghSignScript

	db 10 ; object events
	object_event  8, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_203_RIVAL
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMichael, -1
	object_event 13, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route203_LassScript, -1
	object_event 26, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterDallas, -1
	object_event 35, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerYoungsterBastian, -1
	object_event 42, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassKaitlin, -1
	object_event 39,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerLassMadeline, -1
	object_event 15,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_PokeBallScript, EVENT_ROUTE_203_POKE_BALL
	object_event 25,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_RepelScript, EVENT_ROUTE_203_REPEL
	object_event 33, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_XDefendScript, EVENT_ROUTE_203_X_DEFEND
