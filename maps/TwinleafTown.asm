	object_const_def ; object_event constants
	const TWINLEAFTOWN_POKEFAN_M
	const TWINLEAFTOWN_OBJECT2
	const TWINLEAFTOWN_OBJECT3
	const TWINLEAFTOWN_RIVAL

TwinleafTown_MapScripts:
	db 3 ; scene scripts
	scene_script .Dummy ; SCENE_TWINLEAFTOWN_MEET_RIVAL
	scene_script .Dummy ; SCENE_TWINLEAFTOWN_CANT_LEAVE
	scene_script .Dummy ; SCENE_TWINLEAFTOWN_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TWINLEAF
	return

.Dummy:
	end

TwinleafTown_TechnologyGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Technology is"
	line "incredible!"

	para "Now you can play"
	line "with people around"
	cont "the world…"
	cont "wirelessly!"
	done

TwinleafTown_ExitGuardGuyScript:
	faceplayer
	checkevent EVENT_TALKED_TO_RIVAL_IN_ROOM
	iftrue .AfterRival
	jumptext .LookingForYouText

.AfterRival:
	checkevent EVENT_MET_CYRUS_AT_LAKE_VERITY
	iftrue .AfterCyrus
	jumptext .TearingOffText

.AfterCyrus:
	checkevent EVENT_GOT_POKEDEX
	iftrue .AfterPokedex
	jumptext .GrowingUpToughText

.AfterPokedex:
	jumptext .AfterPokedexText

.LookingForYouText:
	text "Hiya, <PLAYER>."

	para "<RIVAL> was"
	line "looking for you."

	para "I think he's home"
	line "now. Why don't you"
	cont "go check it out?"
	done

.TearingOffText:
	text "Hiya, <PLAYER>."

	para "You're looking for"
	line "<RIVAL>? He just"
	cont "went tearing off"
	cont "a little bit ago."

	para "He's probably not"
	line "gone too far. Why"
	cont "not go after him?"
	done

.GrowingUpToughText:
	text "<RIVAL>? He went"
	line "tearing off in a"
	cont "huge rush a while"
	cont "ago."

	para "…Ouch. He ran into"
	line "me earlier. It's"
	cont "still hurting."

	para "That kid's growing"
	line "up tough."
	done

.AfterPokedexText:
	text "Everyone goes off"
	line "on adventures,"
	cont "and then they"
	cont "gradually grow up…"
	done

TwinleafTown_PokemonWomanScript:
	faceplayer
	checkevent EVENT_MET_CYRUS_AT_LAKE_VERITY
	iftrue .AfterCyrus
	jumptext .WildMonAttackText

.AfterCyrus:
	checkevent EVENT_GOT_POKEDEX
	iftrue .AfterPokedex
	jumptext .LookGoodText

.AfterPokedex:
	jumptext .AfterPokedexText

.WildMonAttackText:
	text "It's true that wild"
	line "#MON do attack"
	cont "people sometimes…"

	para "But, #MON also"
	line "open their hearts"
	cont "to you, so you can"
	cont "become friends."
	done

.LookGoodText:
	text "Oh! A #MON!"
	line "You look good"
	cont "together!"
	done

.AfterPokedexText:
	text "Oh, you're helping"
	line "put together a"
	cont "#DEX?"

	para "That means you're"
	line "going to travel"
	cont "all over the place"
	cont "with #MON!"

	para "That sounds like a"
	line "lot of fun! I'm a"
	cont "little envious to"
	cont "be honest!"
	done

TwinleafTown_NameSignScript:
	jumptext .Text
.Text:
	text "TWINLEAF TOWN"
	line "Fresh and free!"
	done

TwinleafTown_PlayersMailboxScript:
	jumptext .Text
.Text:
	text "<PLAYER>'s House"
	done

TwinleafTown_RivalsMailboxScript:
	jumptext .Text
.Text:
	text "<RIVAL>'s House"
	done

TwinleafTown_MeetRivalScript:
	appear TWINLEAFTOWN_RIVAL
	follow PLAYER, TWINLEAFTOWN_RIVAL
	applymovement PLAYER, .RivalBumpMovement
	stopfollow
	playsound SFX_BUMP
	opentext
	writetext .ThudText
	closetext
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, TWINLEAFTOWN_RIVAL, 15
	opentext
	writetext .SeeRowanText
	waitbutton
	closetext
	applymovement TWINLEAFTOWN_RIVAL, .WalkAwayMovement
	showemote EMOTE_SHOCK, TWINLEAFTOWN_RIVAL, 15
	applymovement TWINLEAFTOWN_RIVAL, .ReturnMovment
	opentext
	writetext .ForgotSomethingText
	waitbutton
	closetext
	applymovement TWINLEAFTOWN_RIVAL, .EnterHouseMovement
	disappear TWINLEAFTOWN_RIVAL
	setscene SCENE_TWINLEAFTOWN_CANT_LEAVE
	special RestartMapMusic
	end

.ThudText:
	text_big "Thud!!@"

.SeeRowanText:
	text "<RIVAL>: What was"
	line "that about?"

	para "Oh, hey, <PLAYER>!"

	para "Hey! I'm going to"
	line "see PROF.ROWAN!"
	cont "You should come,"
	cont "too! And quickly!"
	done

.ForgotSomethingText:
	text "<RIVAL>: Oh, jeez!"
	line "Forgot something!"
	done

.RivalBumpMovement:
	turn_head UP
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end

.WalkAwayMovement:
	remove_fixed_facing
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.ReturnMovment:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

.EnterHouseMovement:
	step UP
	step_end

TwinleafTown_CantLeaveScriptL:
	settableindex 0
	sjump TwinleafTown_CantLeaveScript

TwinleafTown_CantLeaveScriptR:
	settableindex 1
TwinleafTown_CantLeaveScript:
	showemote EMOTE_SHOCK, TWINLEAFTOWN_OBJECT2, 15
	applymovementtable TWINLEAFTOWN_OBJECT2, .ApproachPlayerMovement
	follow TWINLEAFTOWN_OBJECT2, PLAYER
	applymovement TWINLEAFTOWN_OBJECT2, .MoveDownMovement
	stopfollow
	opentext
	writetext TwinleafTown_ExitGuardGuyScript.LookingForYouText
	waitbutton
	closetext
	applymovementtable TWINLEAFTOWN_OBJECT2, .ReturnMovement
	end

.MoveDownMovement:
	step DOWN
	turn_head UP
	step_end

.ApproachPlayerMovement:
	dw .ApproachLeft
	dw .ApproachRight

.ApproachRight:
	step RIGHT
.ApproachLeft:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

.ReturnMovement:
	dw .ReturnLeft
	dw .ReturnRight

.ReturnRight:
	step LEFT
.ReturnLeft:
	step LEFT
	step LEFT
	step DOWN
	step_end

TwinleafTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, PLAYERS_HOUSE_1F, 1
	warp_event  5,  7, RIVAL_HOUSE_1F, 1
	warp_event  5, 13, TWINLEAF_HOUSE_1, 1
	warp_event 15,  7, TWINLEAF_HOUSE_2, 1

	db 5 ; coord events
	coord_event  5,  8, SCENE_TWINLEAFTOWN_MEET_RIVAL, TwinleafTown_MeetRivalScript
	coord_event 10,  1, SCENE_TWINLEAFTOWN_MEET_RIVAL, TwinleafTown_CantLeaveScriptL
	coord_event 11,  1, SCENE_TWINLEAFTOWN_MEET_RIVAL, TwinleafTown_CantLeaveScriptR
	coord_event 10,  1, SCENE_TWINLEAFTOWN_CANT_LEAVE, TwinleafTown_CantLeaveScriptL
	coord_event 11,  1, SCENE_TWINLEAFTOWN_CANT_LEAVE, TwinleafTown_CantLeaveScriptR

	db 3 ; bg events
	bg_event 11,  9, BGEVENT_READ, TwinleafTown_NameSignScript
	bg_event 13, 13, BGEVENT_READ, TwinleafTown_PlayersMailboxScript
	bg_event  3,  7, BGEVENT_READ, TwinleafTown_RivalsMailboxScript

	db 4 ; object events
	object_event  6, 16, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwinleafTown_TechnologyGuyScript, -1
	object_event  8,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TwinleafTown_ExitGuardGuyScript, -1
	object_event 17,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwinleafTown_PokemonWomanScript, -1
	object_event  5,  7, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TWINLEAF_TOWN_RIVAL
