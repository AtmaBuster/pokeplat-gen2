	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM

PlayersHouse1F_MapScripts:
	db 3 ; scene scripts
	scene_script .Scene0 ; SCENE_PLAYERSHOUSE1F_FIRST_TIME
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE1F_NOTHING

	db 0 ; callbacks

.Scene0:
	sdefer .FirstTime
.Dummy:
	end

.FirstTime:
	applymovement PLAYER, .DownStairsMovement
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM, 15
	applymovement PLAYERSHOUSE1F_MOM, .MomApproachMovement
	opentext
	writetext .RivalGoneText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MOM, .MomReturnMovement
	setscene SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME
	end

.RivalGoneText:
	text "MOM: <PLAYER>!"

	para "<RIVAL> already"
	line "left."

	para "I don't know"
	line "what it was about,"
	cont "but he sure was in"
	cont "a hurry!"
	done

.DownStairsMovement:
	step DOWN
	step_end

.MomApproachMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

.MomReturnMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

PlayersHouse1F_MomScript:
	faceplayer
	checkscene
	ifequal SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME, .BeforeExit
	checkflag ENGINE_FLYPOINT_TWINLEAF
	iftrue .HaveLeftHouse
	jumptext .TakeCareText

.HaveLeftHouse:
	jumptext .RivalWaitingText

.BeforeExit:
	jumptext .ImpatientText

.TakeCareText:
	text "Mom: Bye-bye,"
	line "<PLAYER>!"

	para "You take care now!"
	done

.RivalWaitingText:
	text "Mom: What is it?"

	para "Isn't <RIVAL>"
	line "waiting for you?"
	done

.ImpatientText:
	text "Mom: You know how"
	line "impatient <RIVAL>"
	cont "is, don't you?"

	para "He took off before"
	line "I could even ask"
	cont "what it was about."
	done

PlayersHouse1F_TryExitFirstTimeScript:
	turnobject PLAYERSHOUSE1F_MOM, DOWN
	turnobject PLAYER, UP
	opentext
	writetext .DontGoIntoGrassText
	waitbutton
	closetext
	setscene SCENE_PLAYERSHOUSE1F_NOTHING
	end

.DontGoIntoGrassText:
	text "Mom: Oh, yes!"
	line "<PLAYER>!"

	para "Don't go into the"
	line "tall grass. Wild"
	cont "#MON might try"
	cont "to attack."

	para "It would be OK if"
	line "you had your own"
	cont "#MON, but you"
	cont "don't, so…"

	para "Well, take care,"
	line "sweetie!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, TWINLEAF_TOWN, 1
	warp_event  7,  7, TWINLEAF_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  7,  7, SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME, PlayersHouse1F_TryExitFirstTimeScript
	coord_event  6,  7, SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME, PlayersHouse1F_TryExitFirstTimeScript

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse1F_MomScript, -1
