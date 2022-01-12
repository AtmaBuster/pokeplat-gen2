	object_const_def ; object_event constants
	const OREBURGHMINEB2F_ROARK
	const OREBURGHMINEB2F_WORKER1
	const OREBURGHMINEB2F_WORKER2
	const OREBURGHMINEB2F_WORKER3
	const OREBURGHMINEB2F_MACHOP1
	const OREBURGHMINEB2F_MACHOP2
	const OREBURGHMINEB2F_MACHOP3
	const OREBURGHMINEB2F_ROCK1
	const OREBURGHMINEB2F_ROCK2
	const OREBURGHMINEB2F_ITEMBALL1
	const OREBURGHMINEB2F_ITEMBALL2

OreburghMineB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghMineB2F_EscapeRopeScript:
	itemball ESCAPE_ROPE

OreburghMineB2F_PotionScript:
	itemball POTION

OreburghMineB2F_RockScript:
	jumpstd smashrock

TrainerWorkerMason:
	trainer WORKER, MASON, EVENT_BEAT_WORKER_MASON, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'm gonna let you"
	line "in on a secret…"

	para "I snuck my #MON"
	line "to work!"
	done

.BeatenText:
	text "Well, now aren't"
	line "you something!"
	done

.AfterText:
	text "OK, OK, time for"
	line "work!"

	para "I'll work up a"
	line "thirst with my"
	cont "#MON!"
	done

TrainerWorkerColin:
	trainer WORKER, COLIN, EVENT_BEAT_WORKER_COLIN, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Fine, all righty"
	line "then. Just a quick"
	cont "battle over break."
	done

.BeatenText:
	text "Wahaha! Mercy, I"
	line "cry mercy!"
	done

.AfterText:
	text "I'd better get on"
	line "back to work…"

	para "You know, I would"
	line "rather be"
	cont "traveling with"
	cont "#MON the way"
	cont "you do."
	done

OreburghMineB2F_RoarkScript:
	opentext
	writetext .StandBackText
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 84
	applymovement OREBURGHMINEB2F_ROCK2, .BreakRockMovement
	disappear OREBURGHMINEB2F_ROCK2
	faceplayer
	opentext
	writetext .NeedToBeSmashedText
	waitbutton
	closetext
	applymovement OREBURGHMINEB2F_ROARK, .RoarkLeaveMovement
	disappear OREBURGHMINEB2F_ROARK
	setevent EVENT_TALKED_TO_ROARK_IN_MINE
	setevent EVENT_OREBURGH_CITY_RIVAL
	end

.StandBackText:
	text "OK, stand back and"
	line "watch this."

	para "Using the hidden"
	line "move ROCK SMASH, a"
	cont "boulder blocking"
	cont "your way…"
	done

.NeedToBeSmashedText:
	text "Fallen boulders"
	line "need to be smashed"
	cont "so they're out of"
	cont "the way."

	para "If you could get"
	line "the BADGE from the"
	cont "GYM in town, you'd"
	cont "be able to do this"
	cont "too."

	para "Of course, you'd"
	line "have to beat the"
	cont "GYM LEADER first."

	para "That'd be me!"
	done

.BreakRockMovement:
	rock_smash 10
	step_end

.RoarkLeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

OreburghMineB2F_WorkerScript:
	jumptextfaceplayer .Text
.Text:
	text "I met these MACHOP"
	line "on ROUTE 207."

	para "They've now become"
	line "my most trusted"
	cont "partners!"
	done

OreburghMineB2F_Machop1Script:
	opentext
	writetext .Text
	cry MACHOP
	waitsfx
	waitbutton
	closetext
	end

.Text:
	text "MACHOP: Chopmacho!"
	done

OreburghMineB2F_Machop2Script:
	opentext
	writetext .Text
	cry MACHOP
	waitsfx
	waitbutton
	closetext
	end

.Text:
	text "MACHOP: Chopchop!"
	done

OreburghMineB2F_Machop3Script:
	opentext
	writetext .Text
	cry MACHOP
	waitsfx
	waitbutton
	closetext
	end

.Text:
	text "MACHOP: Maaacho!"
	done

IF DEF(_DEMO1)
OreburghMineB2F_DemoMiningGameScript:
	faceplayer
	checkflag ENGINE_COALBADGE
	iffalse .ComeBack
	opentext
	writetext .WannaMineText
	yesorno
	iffalse .SaidNo
	special MiningGame
	closetext
	end

.SaidNo:
	writetext .NoText
	waitbutton
	closetext
	end

.ComeBack:
	jumptext .ComeBackText

.WannaMineText:
	text "Hi! We're a bit"
	line "short-handed right"
	cont "now."

	para "Would you like to"
	line "help out?"
	done

.NoText:
	text "That's all right."

	para "Come back if you"
	line "change your mind."
	done

.ComeBackText:
	text "Hi! We don't need"
	line "any help mining"
	cont "right now."

	para "Maybe you can come"
	line "back after you've"
	cont "got a GYM BADGE."
	done
ENDC

OreburghMineB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, OREBURGH_MINE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

IF DEF(_DEMO1)
	db 12 ; object events
ELSE
	db 11 ; object events
ENDC
	object_event 13, 22, SPRITE_ROARK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_RoarkScript, EVENT_OREBURGH_MINE_B2F_ROARK
	object_event  7, 22, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerWorkerColin, -1
	object_event 22, 15, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerWorkerMason, -1
	object_event 18, 12, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_WorkerScript, -1
	object_event 17, 12, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_Machop1Script, -1
	object_event 23, 12, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_Machop2Script, -1
	object_event  5, 20, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_Machop3Script, -1
	object_event 12, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_RockScript, -1
	object_event 14, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_RockScript, -1
	object_event  2, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghMineB2F_EscapeRopeScript, EVENT_OREBURGH_MINE_B2F_ESCAPE_ROPE
	object_event 22, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghMineB2F_PotionScript, EVENT_OREBURGH_MINE_B2F_POTION
IF DEF(_DEMO1)
	object_event  5, 17, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB2F_DemoMiningGameScript, -1
ENDC
