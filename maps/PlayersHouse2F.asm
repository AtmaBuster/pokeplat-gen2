	object_const_def ; object_event constants
	const PLAYERSHOUSE2F_RIVAL

PlayersHouse2F_MapScripts:
	db 3 ; scene scripts
	scene_script .Scene0 ; SCENE_PLAYERSHOUSE2F_INIT
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE2F_RIVAL
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE2F_DONE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom

.Scene0:
	turnobject PLAYER, UP
	opentext
	writetext IntroSandgemTextCont
	waitbutton
	closetext
	setscene SCENE_FINISHED
	turnobject PLAYER, DOWN
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .Done
	variablesprite SPRITE_DAWN_LUCAS, SPRITE_CHRIS
	variablesprite SPRITE_DAWN_LUCAS2, SPRITE_CHRIS
.Done:
.Dummy:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	return

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

PlayersRoomRivalScript1:
	settableindex 0
	sjump PlayersRoomRivalScript

PlayersRoomRivalScript2:
	settableindex 1
	sjump PlayersRoomRivalScript

PlayersRoomRivalScript3:
	settableindex 2

PlayersRoomRivalScript:
	appear PLAYERSHOUSE2F_RIVAL
	playsound SFX_EXIT_BUILDING
	applymovement PLAYERSHOUSE2F_RIVAL, PlayersRoom_RivalMoveDown
	showemote EMOTE_SHOCK, PLAYERSHOUSE2F_RIVAL, 15
	opentext
	writetext PlayersRoom_RivalText1
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, RIGHT
	applymovementtable PLAYERSHOUSE2F_RIVAL, PlayersRoom_RivalApproachPlayer
	opentext
	writetext PlayersRoom_RivalText2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYERSHOUSE2F_RIVAL, 15
	applymovementtable PLAYERSHOUSE2F_RIVAL, PlayersRoom_RivalToPC
	turnobject PLAYER, LEFT
	opentext
	writetext PlayersRoom_RivalText3
	waitbutton
	closetext
	turnobject PLAYERSHOUSE2F_RIVAL, RIGHT
	opentext
	writetext PlayersRoom_RivalText4
	waitbutton
	closetext
	applymovementtable PLAYERSHOUSE2F_RIVAL, PlayersRoom_RivalPCToPlayer
	opentext
	writetext PlayersRoom_RivalText5
	waitbutton
	closetext
	applymovementtable PLAYERSHOUSE2F_RIVAL, PlayersRoom_RivalExit
	playsound SFX_EXIT_BUILDING
	disappear PLAYERSHOUSE2F_RIVAL
	waitsfx
	special RestartMapMusic
	setscene SCENE_PLAYERSHOUSE2F_DONE
	end

PlayersRoom_RivalMoveDown:
	step DOWN
	turn_head LEFT
	step_end

PlayersRoom_RivalApproachPlayer:
	dw .player_right
	dw .player_left
	dw .player_down

.player_left
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

.player_right
	step DOWN
	step LEFT
	step_end

.player_down
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

PlayersRoom_RivalToPC:
	dw .player_right
	dw .player_left
	dw .player_down

.player_right
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

.player_left
	step DOWN
	step LEFT
	step LEFT
	step UP
	step_end

.player_down
	step UP
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

PlayersRoom_RivalPCToPlayer:
	dw .player_right
	dw .player_left
	dw .player_down

.player_right
	step RIGHT
	step RIGHT
	step_end

.player_left
	step_end

.player_down
	step DOWN
	step RIGHT
	step_end

PlayersRoom_RivalExit:
	dw .player_right
	dw .player_left
	dw .player_down

.player_right
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

.player_left
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

.player_down
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PlayersRoom_RivalText1:
	text "<RIVAL>: There you"
	line "are!"
	done

PlayersRoom_RivalText2:
	text "Hey <PLAYER>!"
	line "Did you just see"
	cont "the TV?"
	cont "Sure you did!"

	para "PROF.ROWAN's that"
	line "really important"
	cont "guy who studies"
	cont "#MON, right?"

	para "That means he must"
	line "have lots and lots"
	cont "of #MON."

	para "So, if we ask him,"
	line "I bet he'd give us"
	cont "some #MON!"
	done

PlayersRoom_RivalText3:
	text "Oh, hey!"
	line "Is that a new PC?"
	done

PlayersRoom_RivalText4:
	text "<RIVAL>: Uh…"
	line "Where was I?"
	done

PlayersRoom_RivalText5:
	text "Oh, right, right!"
	line "We're going to see"
	cont "PROF.ROWAN and get"
	cont "some #MON."

	para "I'll be waiting"
	line "outside."

	para "Ok, <PLAYER>? If"
	line "you're late, I'm"
	cont "fining you"
	cont "¥10 million!"
	done

IntroSandgemTextCont:
	text "That conlcudes our"
	line "special program,"
	cont "“Let's Ask PROF."
	cont "ROWAN!”"

	para "Brought to you by"
	line "JUBILIFE TV on"
	cont "Nationwide Net!"

	para "See you next week,"
	line "same time, same"
	cont "channel!"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	db 3 ; coord events
	coord_event 5,  2, SCENE_PLAYERSHOUSE2F_RIVAL, PlayersRoomRivalScript1
	coord_event 3,  2, SCENE_PLAYERSHOUSE2F_RIVAL, PlayersRoomRivalScript2
	coord_event 4,  3, SCENE_PLAYERSHOUSE2F_RIVAL, PlayersRoomRivalScript3

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript

	db 1 ; object events
	object_event  7,  0, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_PLAYERS_HOUSE
