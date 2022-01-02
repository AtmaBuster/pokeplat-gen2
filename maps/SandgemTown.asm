	object_const_def ; object_event constants
	const SANDGEMTOWN_DAWNLUCAS
	const SANDGEMTOWN_RIVAL

SandgemTown_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_SANDGEMTOWN_FIRST_VISIT
	scene_script .Dummy ; SCENE_SANDGEMTOWN_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SANDGEM
	return

.Dummy:
	end

SandgemTown_FirstVisitScriptU:
	settableindex 0
	sjump SandgemTown_FirstVisitScript

SandgemTown_FirstVisitScriptD:
	settableindex 1
SandgemTown_FirstVisitScript:
	applymovementtable SANDGEMTOWN_DAWNLUCAS, .ApproachPlayerMovement
	opentext
	writetextgender .DawnGreetingText, .LucasGreetingText
	waitbutton
	closetext
	follow SANDGEMTOWN_DAWNLUCAS, PLAYER
	applymovementtable SANDGEMTOWN_DAWNLUCAS, .BringToLabMovement
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetextgender .DawnLabText, .LucasLabText
	waitbutton
	closetext
	appear SANDGEMTOWN_RIVAL
	applymovement SANDGEMTOWN_RIVAL, .RivalExitMovement
	opentext
	writetext .ThudText
	waitbutton
	playmusic MUSIC_RIVAL_ENCOUNTER
	writetext .RivalText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_RIVAL, .RivalLeaveMovement
	disappear SANDGEMTOWN_RIVAL
	special RestartMapMusic
	turnobject SANDGEMTOWN_DAWNLUCAS, RIGHT
	opentext
	writetextgender .DawnYourFriendText, .LucasYourFriendText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_DAWNLUCAS, .DawnLucasEnterMovement
	playsound SFX_ENTER_DOOR
	disappear SANDGEMTOWN_DAWNLUCAS
	waitsfx
	applymovement PLAYER, .PlayerEnterMovement
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warpfacing UP, ROWANS_LAB, 4, 11
	end

.DawnGreetingText:
	text "DawnGreetingText"
	done
.LucasGreetingText:
	text "LucasGreetingText"
	done
.DawnLabText:
	text "DawnLabText"
	done
.LucasLabText:
	text "LucasLabText"
	done
.ThudText:
	text "ThudText"
	done
.RivalText:
	text "RivalText"
	done
.DawnYourFriendText:
	text "DawnYourFriendTex"
	line "t"
	done
.LucasYourFriendText:
	text "LucasYourFriendTe"
	line "xt"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementUp
	dw .ApproachPlayerMovementDown

.BringToLabMovement:
	dw .BringToLabMovementUp
	dw .BringToLabMovementDown

.ApproachPlayerMovementUp:
	step UP
.ApproachPlayerMovementDown:
	step LEFT
	step LEFT
	step LEFT
	step_end

.BringToLabMovementUp:
	step DOWN
.BringToLabMovementDown:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

.RivalExitMovement:
	step DOWN
	step_end

.RivalLeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.DawnLucasEnterMovement:
	step UP
	step LEFT
	step UP
	step_end

.PlayerEnterMovement:
	step UP
	step UP
	step_end

SandgemTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8,  5, ROWANS_LAB, 1
	warp_event  7, 13, SANDGEM_HOUSE_1, 1
	warp_event 13, 13, ASSISTANT_HOUSE_1F, 1
	warp_event 21,  5, SANDGEM_POKEMART, 1
	warp_event 13,  5, SANDGEM_POKEMON_CENTER_1F, 1

	db 2 ; coord events
	coord_event  4,  6, SCENE_SANDGEMTOWN_FIRST_VISIT, SandgemTown_FirstVisitScriptU
	coord_event  4,  7, SCENE_SANDGEMTOWN_FIRST_VISIT, SandgemTown_FirstVisitScriptD

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  7, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SANDGEM_TOWN_DAWNLUCAS
	object_event  8,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SANDGEM_TOWN_RIVAL
