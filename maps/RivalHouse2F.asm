	object_const_def ; object_event constants
	const RIVALHOUSE2F_RIVAL

RivalHouse2F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Dummy  ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	sdefer .FindRival
.Dummy:
	end

.FindRival:
	applymovement PLAYER, .StairsMovement
	opentext
	writetext .TakeStuffText
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject RIVALHOUSE2F_RIVAL, RIGHT
	showemote EMOTE_SHOCK, RIVALHOUSE2F_RIVAL, 15
	opentext
	writetext .WaitingText
	waitbutton
	closetext
	applymovement RIVALHOUSE2F_RIVAL, .RivalExitMovement
	applymovement PLAYER, .PlayerOutOfTheWayMovement
	applymovement RIVALHOUSE2F_RIVAL, .RivalFinishExitMovement
	disappear RIVALHOUSE2F_RIVAL
	special RestartMapMusic
	setevent EVENT_TALKED_TO_RIVAL_IN_ROOM
	setscene SCENE_FINISHED
	setmapscene TWINLEAF_TOWN, SCENE_TWINLEAFTOWN_NOTHING
	end

.TakeStuffText:
	text "<RIVAL>:…I'd better"
	line "take my BAG and"
	cont "JOURNAL, too…"
	done

.WaitingText:
	text "Oh, hey, <PLAYER>!"

	para "I'll be waiting on"
	line "the road! It's a"
	cont "¥10 million fine"
	cont "if you're late!"
	done

.StairsMovement:
.PlayerOutOfTheWayMovement:
	step DOWN
	step_end

.RivalExitMovement:
	step RIGHT
	step RIGHT
	step UP
	turn_head RIGHT
	step_end

.RivalFinishExitMovement:
	step RIGHT
	step UP
	step_end

RivalHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RIVAL_HOUSE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVALS_HOUSE_2F_RIVAL
