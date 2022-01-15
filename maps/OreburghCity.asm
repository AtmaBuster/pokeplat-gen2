	object_const_def ; object_event constants
	const OREBURGHCITY_RIVAL
	const OREBURGHCITY_YOUNGSTER1
	const OREBURGHCITY_OBJECT2
	const OREBURGHCITY_OBJECT3
	const OREBURGHCITY_OBJECT4
	const OREBURGHCITY_OBJECT5
	const OREBURGHCITY_OBJECT6
	const OREBURGHCITY_OBJECT7
	const OREBURGHCITY_OBJECT8
	const OREBURGHCITY_OBJECT9
	const OREBURGHCITY_OBJECT10
	const OREBURGHCITY_OBJECT11

OreburghCity_MapScripts:
	db 3 ; scene scripts
	scene_script .Dummy ; SCENE_OREBURGHCITY_FIRST_VISIT
	scene_script .Dummy ; SCENE_OREBURGHCITY_AFTER_GYM
	scene_script .Dummy ; SCENE_OREBURGHCITY_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_OREBURGH
	return

.Dummy:
	end

OreburghCity_FirstTimeScript:
	showemote EMOTE_SHOCK, OREBURGHCITY_YOUNGSTER1, 15
	applymovement OREBURGHCITY_YOUNGSTER1, .ApproachPlayerMovement
	opentext
	writetext .HowdyText
	waitbutton
	closetext
	follow OREBURGHCITY_YOUNGSTER1, PLAYER
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement OREBURGHCITY_YOUNGSTER1, .WalkToGymMovement
	stopfollow
	opentext
	writetext .SomeoneThereText
	waitbutton
	closetext
	special RestartMapMusic
	setscene SCENE_OREBURGHCITY_NOTHING
	end

.HowdyText:
	text "Howdy, TRAINER!"

	para "Huh? Uh-oh! You"
	line "don't have a single"
	cont "GYM BADGE?"

	para "You'd better do"
	line "something about"
	cont "that!"

	para "I'll take you to"
	line "the #MON GYM."
	done

.SomeoneThereText:
	text "Huh? There's"
	line "someone there."
	done

.ApproachPlayerMovement:
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

.WalkToGymMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

OreburghCity_NameSignScript:
	jumptext .Text
.Text:
	text "OREBURGH CITY"
	line "City of Energy"
	done

OreburghCity_GymSignScript:
	jumptext .Text
.Text:
	text "OREBURGH CITY"
	line "#MON GYM"

	para "LEADER: ROARK"

	para "“Call me ROARK"
	line "the Rock!”"
	done

OreburghCity_MuseumSignScript:
	jumptext .Text
.Text:
	text "OREBURGH MINING"
	line "MUSEUM"

	para "“Coal Mining and"
	line "You!”"
	done

OreburghCity_MineSignScript:
	jumptext .Text
.Text:
	text "OREBURGH MINE"

	para "Beware of Busy"
	line "#MON!"
	done

OreburghCity_MartSignScript:
	jumptext .Text
.Text:
	text "All Your Item"
	line "Needs Fulfilled!"
	cont "#MON MART"
	done

OreburghCity_PMCSignScript:
	jumptext .Text
.Text:
	text "Heal your #MON!"
	line "#MON CENTER"
	done

OreburghCity_GymKidScript:
	faceplayer
	checkevent EVENT_TALKED_TO_ROARK_IN_MINE
	iftrue .AfterMine
	jumptext .YourFriendText

.AfterMine:
	checkflag ENGINE_COALBADGE
	iftrue .AfterBadge
	jumptext .LeaderWaitingText

.AfterBadge:
	jumptext .AfterBadgeText

.YourFriendText:
	text "Is that guy in"
	line "front of the GYM"
	cont "your friend?"

	para "He's sort of"
	line "twitcy and"
	cont "impatient."
	done

.LeaderWaitingText:
	text "Oh, hi, you're"
	line "back!"

	para "The GYM LEADER's"
	line "waiting for you."
	done

.AfterBadgeText:
	text "Can I see your"
	line "TRAINER CASE?"

	para "It's got the GYM"
	line "BADGE you just"
	cont "won, right?"
	done

OreburghCity_RivalScript:
	faceplayer
	checkevent EVENT_TALKED_TO_OREBURGH_RIVAL
	iftrue .AfterTalk
	setevent EVENT_TALKED_TO_OREBURGH_RIVAL
	jumptext .FinallyHereText

.AfterTalk:
	jumptext .RepeatText

.FinallyHereText:
	text "<RIVAL>: Hunh?"

	para "Oh, it's you,"
	line "<PLAYER>!"

	para "You finally got"
	line "here? You're slow"
	cont "like always."

	para "But anyway, the"
	line "GYM LEADER's tough!"

	para "Like, seriously"
	line "serious! If the"
	cont "GYM LEADER's this"
	cont "tough, I wonder"
	cont "how he compares to"
	cont "my dad…"

	para "Huh! I just"
	line "drifted there."

	para "Anyway, the GYM"
	line "LEADER's gone off"
	cont "to the coal mine."

	para "If you want to"
	line "take on the GYM"
	cont "LEADER, you'd"
	cont "better go off to"
	cont "the mine!"
	done

.RepeatText:
	text "<RIVAL>: I told"
	line "you the GYM LEADER"
	cont "went down to the"
	cont "OREBURGH MINE."

	para "If you want to"
	line "take the GYM"
	cont "challenge, you"
	cont "have to go down to"
	cont "the mine."
	done

OreburghCity_DireHitScript:
	itemball DIRE_HIT

OreburghCity_VentWorkerScript:
	jumptextfaceplayer .Text
.Text:
	text "These vents"
	line "exchange the hot"
	cont "air down below"
	cont "with the fresh"
	cont "air outside."

	para "Looking down them"
	line "gives me the urge"
	cont "to start yelling"
	cont "into 'em! Hello!"
	done

OreburghCity_VentGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Have you seen the"
	line "vents?"

	para "They release steam"
	line "from down below."
	done

OreburghCity_GymLeaderWomanScript:
	faceplayer
	checkevent EVENT_TALKED_TO_ROARK_IN_MINE
	iftrue .After
	jumptext .BeforeText

.After:
	jumptext .AfterText

.BeforeText:
	text "The GYM LEADER"
	line "went off to work"
	cont "in the mine."
	done

.AfterText:
	text "The GYM LEADER is"
	line "young, but he's the"
	cont "mine's safety"
	cont "supervisor."

	para "He's an expert in"
	line "more than just one"
	cont "field!"
	done

OreburghCity_RunningShoesGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "When I run around"
	line "with my RUNNING"
	cont "SHOES on, I'm the"
	cont "center of"
	cont "attention!"

	para "…At least that's"
	line "what it feels"
	cont "like. There's"
	cont "always someone"
	cont "looking at me."
	done

OreburghCity_TMHMGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "TMs are single use"
	line "only, but HMs can"
	cont "be used over and"
	cont "over."

	para "It's tricky to"
	line "decide which"
	cont "#MON should"
	cont "learn what moves."
	done

OreburghCity_FossilGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "Natural time"
	line "capsules buried"
	cont "many, many years"
	cont "ago…"

	para "That's what FOSSILS"
	line "are."
	done

OreburghCity_MtCoronetGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Up ahead there's a"
	line "huge mountain that"
	cont "towers above"
	cont "everything."

	para "It divides SINNOH"
	line "into two distinct"
	cont "halves."
	done

OreburghCity_MineWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "Everyone's proud of"
	line "the mine."

	para "They're digging for"
	line "coal under the sea"
	cont "as we speak…"

	para "It's amazing how"
	line "they do it!"
	done

OreburghCity_MachopSongGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Chop, chop,"
	line "MACHOP!"


	para "Chop, chop away on"
	line "the rocks!"
	done

OreburghCity_SlagHeapGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "This pile of dirty"
	line "sand is called a"
	cont "slag heap."

	para "It's the waste from"
	line "sorting coal."
	done

OreburghCity_SuperPotionGuyScript:
	faceplayer
	opentext
	checkevent EVENT_OREBURGH_GOT_SUPER_POTION
	iftrue .After
	writetext .SuperPotionText
	waitbutton
	verbosegiveitem SUPER_POTION
	iffalse .BagFull
	setevent EVENT_OREBURGH_GOT_SUPER_POTION
.After:
	writetext .AfterText
.BagFull:
	waitbutton
	closetext
	end

.SuperPotionText:
	text "There's no"
	line "question. This is"
	cont "hard, hard work."

	para "But working along-"
	line "side #MON…"

	para "It gives me a"
	line "boost somehow."

	para "Here, take one of"
	line "these."
	done

.AfterText:
	text "Feeling hale and"
	line "hearty puts a"
	cont "smiile on my face."

	para "And that makes me"
	line "happy."
	done

OreburghCity_MachopScript:
	opentext
	writetext .Text
	cry MACHOP
	waitsfx
	waitbutton
	closetext
	end

.Text:
	text "MACHOP: Macho!"
	line "Chopo!"
	done

OreburghCity_AfterGymRivalScript:
	moveobject OREBURGHCITY_RIVAL, 13, 10
	appear OREBURGHCITY_RIVAL
	applymovement OREBURGHCITY_RIVAL, .ApproachPlayerMovement
	follow PLAYER, OREBURGHCITY_RIVAL
	applymovement PLAYER, .BumpMovement
	opentext
	writetext .ThudText
	playmusic MUSIC_RIVAL_ENCOUNTER
	writetext .WhoopsText
	waitbutton
	turnobject OREBURGHCITY_RIVAL, DOWN
	writetext .Route207Text
	waitbutton
	turnobject OREBURGHCITY_RIVAL, UP
	writetext .NextStopText
	waitbutton
	closetext
	applymovement PLAYER, .OutOfTheWayMovement
	stopfollow
	applymovement OREBURGHCITY_RIVAL, .LeaveMovement
	special RestartMapMusic
	disappear OREBURGHCITY_RIVAL
	setscene SCENE_OREBURGHCITY_NOTHING
	end

.ThudText:
	text_big "Thud!!@"

.WhoopsText:
	text "<RIVAL>: Whoops!"
	line "<PLAYER>!"

	para "You got the GYM"
	line "BADGE, huh?"

	para "ETERNA CITY is the"
	line "next place with a"
	cont "GYM that gives"
	cont "away BADGES, yeah?"
	done

.Route207Text:
	text "So, yeah, I went"
	line "to ROUTE 207, but"
	cont "you can't go there"
	cont "without a BICYCLE,"

	para "I made my team"
	line "battle and"
	cont "toughened them up,"
	cont "so it wasn't a"
	cont "waste."
	done

.NextStopText:
	text "So, I'm going back"
	line "to JUBILIFE CITY."

	para "Next stop, the"
	line "ETERNA GYM BADGE!"

	para "Ten seconds before"
	line "I dash!"

	para "Nine…"

	para "Bah! Who's got time"
	line "to count?!"
	done

.ApproachPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	step_end

.BumpMovement:
	step UP
	turn_head DOWN
	step_end

.OutOfTheWayMovement:
	step RIGHT
	turn_head LEFT
	step_end

.LeaveMovement:
	step LEFT
	step UP
	step UP
	step_end

OreburghCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event  6,  5, OREBURGH_GATE_1F, 2
	warp_event 34, 37, OREBURGH_MINE_B1F, 1
	warp_event 35, 37, OREBURGH_MINE_B1F, 1
	warp_event 36, 37, OREBURGH_MINE_B1F, 1
	warp_event 37, 37, OREBURGH_MINE_B1F, 1
	warp_event 37, 11, OREBURGH_POKEMON_CENTER_1F, 1
	warp_event 25,  5, OREBURGH_POKEMART, 2
	warp_event 13,  5, OREBURGH_APARTMENT_NW_1F, 2
	warp_event 19,  5, OREBURGH_APARTMENT_N_1F, 2
	warp_event 43, 15, OREBURGH_APARTMENT_E_1F, 2
	warp_event 15, 11, OREBURGH_HOUSE_W, 1
	warp_event 31,  7, OREBURGH_HOUSE_N, 1
	warp_event 41, 25, OREBURGH_HOUSE_E, 1
	warp_event 22, 11, OREBURGH_GYM, 1
	warp_event 40,  5, OREBURGH_MUSEUM, 1

	db 2 ; coord events
	coord_event  7,  8, SCENE_OREBURGHCITY_FIRST_VISIT, OreburghCity_FirstTimeScript
	coord_event  7,  8, SCENE_OREBURGHCITY_AFTER_GYM, OreburghCity_AfterGymRivalScript

	db 6 ; bg events
	bg_event  9,  6, BGEVENT_READ, OreburghCity_NameSignScript
	bg_event 19, 11, BGEVENT_READ, OreburghCity_GymSignScript
	bg_event 39,  6, BGEVENT_READ, OreburghCity_MuseumSignScript
	bg_event 37, 34, BGEVENT_READ, OreburghCity_MineSignScript
	bg_event 26,  5, BGEVENT_READ, OreburghCity_MartSignScript
	bg_event 38, 11, BGEVENT_READ, OreburghCity_PMCSignScript

;	db 18 ; object events
	db 12 ; object events
	object_event 22, 12, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_RivalScript, EVENT_OREBURGH_CITY_RIVAL
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_GymKidScript, -1
;	object_event 13, 14, SPRITE_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_VentWorkerScript, -1
;	object_event 22,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_VentGuyScript, -1
	object_event 28,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_GymLeaderWomanScript, -1
;	object_event 32, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_RunningShoesGirlScript, -1
	object_event 30, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_TMHMGirlScript, -1
	object_event 40, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_FossilGirlScript, -1
	object_event 37, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_MtCoronetGuyScript, -1
	object_event 36, 21, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_MineWomanScript, -1
	object_event 39, 27, SPRITE_WORKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_MachopSongGuyScript, -1
	object_event 32, 29, SPRITE_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_SlagHeapGuyScript, -1
	object_event 44, 30, SPRITE_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghCity_SuperPotionGuyScript, -1
	object_event 32, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghCity_DireHitScript, EVENT_OREBURGH_CITY_DIRE_HIT
;	object_event 33, 30, SPRITE_LUCAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
;	object_event 42, 27, SPRITE_LUCAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 45, 32, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OreburghCity_MachopScript, -1
