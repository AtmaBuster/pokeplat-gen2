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
	text "Trainer Tips!"

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
	text "Trainer Tips!"

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
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route203_LassScript, -1
	object_event 26, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 35, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 40,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 42, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_PokeBallScript, EVENT_ROUTE_203_POKE_BALL
	object_event 25,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_RepelScript, EVENT_ROUTE_203_REPEL
	object_event 33, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route203_XDefendScript, EVENT_ROUTE_203_X_DEFEND
