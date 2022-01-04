	object_const_def ; object_event constants
	const ROUTE202_DAWNLUCAS

Route202_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_DEFAULT
	scene_script .Dummy ; SCENE_FINISHED

	db 0 ; callbacks

.Dummy:
	end

Route202_CatchTutorialScriptU:
	settableindex 0
	sjump Route202_CatchTutorialScript

Route202_CatchTutorialScriptD:
	settableindex 1
Route202_CatchTutorialScript:
	applymovementtable ROUTE202_DAWNLUCAS, .ApproachPlayerMovement
	opentext
	checkevent EVENT_GOT_PARCEL
	iftrue .CatchTutorial
	checkevent EVENT_STOPPED_BY_DAWNLUCAS_ROUTE_202
	iftrue .SecondTime
	writetextgender .DawnTellFamilyText, .LucasTellFamilyText
	setevent EVENT_STOPPED_BY_DAWNLUCAS_ROUTE_202
	sjump .Join

.SecondTime:
	writetextgender .DawnTellFamilyText2, .LucasTellFamilyText2
.Join:
	waitbutton
	closetext
	follow PLAYER, ROUTE202_DAWNLUCAS
	applymovement PLAYER, .PlayerMoveBackMovement
	stopfollow
	applymovementtable ROUTE202_DAWNLUCAS, .ReturnToStartMovement
	end

.CatchTutorial:
	playmusic MUSIC_RIVAL_ENCOUNTER ; dawnlucas encounter
	writetextgender .DawnCatchMonText, .LucasCatchMonText
	waitbutton
	closetext
	follow ROUTE202_DAWNLUCAS, PLAYER
	applymovement ROUTE202_DAWNLUCAS, .EnterGrassMovement
	stopfollow
	loadwildmon BIDOOF, 2
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE202_DAWNLUCAS, RIGHT
	opentext
	writetextgender .DawnDoneCatchText, .LucasDoneCatchText
	waitbutton
	verbosegiveitem POKE_BALL, 5
; ignore fail case
	writetextgender .DawnLotsOfMonText, .LucasLotsOfMonText
	waitbutton
	closetext
	applymovement ROUTE202_DAWNLUCAS, .LeaveMovement
	disappear ROUTE202_DAWNLUCAS
	setscene SCENE_FINISHED
	end

.DawnTellFamilyText:
	text "DAWN: <PLAYER>?!"

	para "Did you tell your"
	line "family that you're"
	cont "helping the"
	cont "PROFESSOR?"

	para "…You didn't,"
	line "did you?"

	para "I know that you're"
	line "eager to see all"
	cont "kinds of #MON."

	para "But you shouldn't"
	line "make your mom"
	cont "worry that you've"
	cont "disappeared."
	done

.LucasTellFamilyText:
	text "LUCAS: <PLAYER>?!"

	para "Did you tell your"
	line "family that you're"
	cont "helping the"
	cont "PROFESSOR?"

	para "…I bet you didn't,"
	line "did you?"

	para "I know that you're"
	line "eager to see all"
	cont "kinds of #MON."

	para "But you shouldn't"
	line "make your mom"
	cont "worry like that."
	done

.DawnTellFamilyText2:
	text "DAWN: You should"
	line "tell your family"
	cont "that you're helping"
	cont "the PROFESSOR."

	para "The faster the"
	line "better, too."
	done

.LucasTellFamilyText2:
	text "LUCAS: Why don't"
	line "you go tell your"
	cont "family that the"
	cont "PROFESSOR asked"
	cont "for your help?"

	para "You should do it"
	line "right away."
	done

.DawnCatchMonText:
	text "DAWN: Oh, that's"
	line "right!"

	para "<PLAYER>, I haven't"
	line "shown you how to"
	cont "catch a #MON."

	para "I'll demonstrate"
	line "how to catch one,"
	cont "so just watch, OK?"
	done

.LucasCatchMonText:
	text "LUCAS: <PLAYER>, do"
	line "you know how to"
	cont "catch a #MON?"

	para "I'll demonstrate"
	line "how to catch one,"
	cont "so just watch, OK?"
	done

.DawnDoneCatchText:
	text "DAWN: Giggle…"
	line "See? Isn't it neat?"

	para "Actually, it's"
	line "better to lower"
	cont "your target's HP" ; change this text or change catch tutorial
	cont "more than I did."

	para "It's important to"
	line "get the #MON's"
	cont "HP down as low as"
	cont "possible."

	para "This is because a"
	line "healthy #MON is"
	cont "very difficult to"
	cont "catch."

	para "Oh, #MON also"
	line "get easier to"
	cont "catch if you make"
	cont "them sleep or"
	cont "something by using"
	cont "a #MON's move."

	para "OK, <PLAYER>, to"
	line "get you started,"
	cont "I'll give you five"
	cont "# BALLS!"
	done

.LucasDoneCatchText:
	text "LUCAS: And that's"
	line "how it's done."

	para "Actually, I should"
	line "have lowered the"
	cont "target's HP some"
	cont "more."

	para "Yup, the important"
	line "thing is to lower"
	cont "the #MON's HP as"
	cont "much as possible."

	para "See, a healthy"
	line "#MON isn't easy"
	cont "to catch."

	para "Oh, yeah. They"
	line "also get easier to"
	cont "catch if you make"
	cont "one of your"
	cont "#MON put them"
	cont "to sleep or such."

	para "Here, <PLAYER>, I'll"
	line "give you five"
	cont "# BALLS to get"
	cont "you started."
	done

.DawnLotsOfMonText:
	text "If you have lots"
	line "of #MON with"
	cont "you, it will be"
	cont "safer on long"
	cont "trips."

	para "Plus, it will be a"
	line "lot more fun with"
	cont "your #MON"
	cont "friends along."

	para "OK, I need to get"
	line "going. Bye, now!"
	done

.LucasLotsOfMonText:
	text "If you have lots"
	line "of #MON wit"
	cont "you, you'll be able"
	cont "to travel farther."

	para "That way, you'll"
	line "have a better shot"
	cont "of meeting more"
	cont "#MON."

	para "See you around!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementU
	dw .ApproachPlayerMovementD

.ApproachPlayerMovementD:
	step DOWN
.ApproachPlayerMovementU:
	step RIGHT
	step RIGHT
	step_end

.PlayerMoveBackMovement:
	step RIGHT
	step_end

.ReturnToStartMovement:
	dw .ReturnToStartMovementU
	dw .ReturnToStartMovementD

.ReturnToStartMovementU:
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

.ReturnToStartMovementD:
	remove_fixed_facing
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end

.EnterGrassMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

.LeaveMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route202_SandgemSignScript:
	jumptextsign .Text
.Text:
	text "<SIGN|> ROUTE 202"
	line "<SIGND> SANDGEM TOWN"
	done

Route202_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event 14, 16, SCENE_DEFAULT, Route202_CatchTutorialScriptU
	coord_event 14, 17, SCENE_DEFAULT, Route202_CatchTutorialScriptD

	db 1 ; bg events
	bg_event 16, 16, BGEVENT_READ, Route202_SandgemSignScript

	db 1 ; object events
	object_event 11, 16, SPRITE_DAWN_LUCAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_202_DAWNLUCAS
