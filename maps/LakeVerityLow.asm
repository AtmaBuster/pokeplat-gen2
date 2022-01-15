	object_const_def ; object_event constants
	const LAKEVERITY_RIVAL
	const LAKEVERITY_CYRUS

LakeVerityLow_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Dummy  ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	sdefer .MeetCyrusScript
.Dummy:
	end

.MeetCyrusScript:
	applymovement LAKEVERITY_RIVAL, .RivalEnterMovement
	opentext
	writetext .WhatsGoingOnText
	waitbutton
	closetext
	applymovement PLAYER, .PlayerEnterMovement
	opentext
	writetext .ExpositionText
	waitbutton
	closetext
	applymovement LAKEVERITY_CYRUS, .CyrusApproachMovement
	opentext
	writetext .StepAsideText
	waitbutton
	closetext
	applymovement LAKEVERITY_RIVAL, .OutOfTheWayMovement
	applymovement LAKEVERITY_CYRUS, .CyrusLeaveMovement
	disappear LAKEVERITY_CYRUS
	applymovement LAKEVERITY_RIVAL, .ReturnToPositionMovement
	turnobject PLAYER, DOWN
	opentext
	writetext .WeirdGuyText
	waitbutton
	turnobject PLAYER, RIGHT
	turnobject LAKEVERITY_RIVAL, LEFT
	writetext .LegendaryMonText
	waitbutton
	writetext .MespritText
	cry MESPRIT
	waitsfx
	closetext
	showemote EMOTE_SHOCK, LAKEVERITY_RIVAL, 15
	turnobject PLAYER, UP
	applymovement LAKEVERITY_RIVAL, .SearchMovement1
	pause 30
	applymovement LAKEVERITY_RIVAL, .SearchMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext .ThatWasMonText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, LAKEVERITY_RIVAL, 15
	opentext
	writetext .NoBallsText
	waitbutton
	closetext
	applymovement LAKEVERITY_RIVAL, .RivalExitMovement
	playsound SFX_ENTER_DOOR
	disappear LAKEVERITY_RIVAL
	waitsfx
	setevent EVENT_MET_CYRUS_AT_LAKE_VERITY
	setscene SCENE_FINISHED
	clearevent EVENT_ROUTE_201_GRASS_GUY
	end

.WhatsGoingOnText:
	text "<RIVAL>: What's"
	line "going on…?"
	done

.ExpositionText:
	text "…The flowing time…"

	para "…The expanding"
	line "space…"

	para "I will make it all"
	line "mine one day…"

	para "CYRUS is my name."
	line "Remember it…"

	para "Until then, sleep"
	line "while you can,"
	cont "legendary #MON"
	cont "of the lake bed…"
	done

.StepAsideText:
	text "Allow me to pass."
	line "Step aside."
	done

.WeirdGuyText:
	text "<RIVAL>: What was"
	line "that about?"
	cont "Weird guy…"
	done

.LegendaryMonText:
	text "OK, <PLAYER>! Let's"
	line "catch that"
	cont "legendary #MON!"
	done

.MespritText:
	text "Kyauuun!"
	done

.ThatWasMonText:
	text "<RIVAL>: !"
	line "Did you hear that,"
	cont "<PLAYER>?"

	para "That was the"
	line "legendary #MON"
	cont "crying! That had"
	cont "to be it!"

	para "OK! This is our"
	line "chance! Let's catch"
	cont "it!"
	done

.NoBallsText:
	text "…Wait!"
	line "What…?!"

	para "We don't have any-"
	line "thing on us!"

	para "You know,"
	line "# BALLS!"

	para "P-O-K-accent-E"
	line "BALLS!"

	para "If we don't have"
	line "those, we can't"
	cont "catch #MON or"
	cont "take them around"
	cont "with us!"

	para "…Do you think"
	line "PROF.ROWAN'd give"
	cont "us some if we"
	cont "asked him?"

	para "You know, remember"
	line "what he said? He"
	cont "said to visit him"
	cont "at his lab if we"
	cont "needed anything."

	para "OK, <PLAYER>! I'll"
	line "race you!"

	para "First one to the"
	line "PROFESSOR's lab in"
	cont "SANDGEM TOWN"
	cont "rules!"
	done

.RivalEnterMovement:
.PlayerEnterMovement:
	step UP
	step UP
	step UP
	step_end

.CyrusApproachMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

.OutOfTheWayMovement:
	step RIGHT
	turn_head LEFT
	step_end

.CyrusLeaveMovement:
	step DOWN
.RivalExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

.ReturnToPositionMovement:
	step LEFT
	turn_head DOWN
	step_end

.SearchMovement1:
	big_step UP
	big_step UP
	big_step UP
	step_end

.SearchMovement2:
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

LakeVerityLow_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28, 21, ROUTE_201, 1
	warp_event 29, 21, ROUTE_201, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 29, 21, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_VERITY_RIVAL
	object_event 27, 15, SPRITE_VOLKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_VERITY_CYRUS
