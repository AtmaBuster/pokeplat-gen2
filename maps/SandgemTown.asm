	object_const_def ; object_event constants
	const SANDGEMTOWN_DAWNLUCAS
	const SANDGEMTOWN_RIVAL
	const SANDGEMTOWN_ROWAN

SandgemTown_MapScripts:
	db 3 ; scene scripts
	scene_script .Dummy  ; SCENE_SANDGEMTOWN_FIRST_VISIT
	scene_script .Scene1 ; SCENE_SANDGEMTOWN_AFTER_LAB
	scene_script .Dummy  ; SCENE_SANDGEMTOWN_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SANDGEM
	return

.Scene1:
	sdefer .AfterLabScript
.Dummy:
	end

.AfterLabScript:
	setevent EVENT_EXITED_LAB
	turnobject SANDGEMTOWN_DAWNLUCAS, UP
	applymovement PLAYER, .ExitLabMovement
	appear SANDGEMTOWN_ROWAN
	opentext
	writetext .RowanPlayerNameText
	closetext
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	follow PLAYER, SANDGEMTOWN_ROWAN
	applymovement PLAYER, .OutOfTheWayMovement
	stopfollow
	turnobject SANDGEMTOWN_ROWAN, RIGHT
	opentext
	writetext .HaveSomethingText
	waitbutton
	verbosegivetmhm TM_RETURN
; bag cannot be full normally, ignore fail case
	writetext .ThatIsATMText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_ROWAN, .ReEnterLabMovement
	playsound SFX_ENTER_DOOR
	disappear SANDGEMTOWN_ROWAN
	waitsfx
	opentext
	writetextgender .DawnTMText, .LucasTMText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_DAWNLUCAS, .ApproachPlayerMovement
	opentext
	writetextgender .DawnShowYouText, .LucasShowYouText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow SANDGEMTOWN_DAWNLUCAS, PLAYER
	applymovement SANDGEMTOWN_DAWNLUCAS, .LabToPMCMovement
	turnobject PLAYER, UP
	opentext
	writetextgender .DawnPMCText, .LucasPMCText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_DAWNLUCAS, .PMCToMartMovement
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetextgender .DawnMartText, .LucasMartText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SANDGEMTOWN_DAWNLUCAS, 15
	turnobject SANDGEMTOWN_DAWNLUCAS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetextgender .DawnTellFamilyText, .LucasTellFamilyText
	waitbutton
	closetext
	applymovement SANDGEMTOWN_DAWNLUCAS, .MartToRouteMovement
	special RestartMapMusic
	disappear SANDGEMTOWN_DAWNLUCAS
	setscene SCENE_SANDGEMTOWN_NOTHING
	setevent EVENT_TELLING_MOM_ABOUT_DEX
	end

.RowanPlayerNameText:
	text_big "<PLAYER>!@"

.HaveSomethingText:
	text "ROWAN: I have"
	line "something good"
	cont "here. You should"
	cont "take this as well."
	done

.ThatIsATMText:
	text "ROWAN: That is a"
	line "Technical Machine."
	cont "That one contains"
	cont "the move RETURN."

	para "Using a Technical"
	line "Machine, or TM,"
	cont "teaches a move"
	cont "to a #MON."

	para "Bear in mind, how-"
	line "ever, that a TM"
	cont "is single-use."

	para "The move RETURN"
	line "gains power the"
	cont "more friendly your"
	cont "#MON is with"
	cont "you."

	para "It's up to you, of"
	line "course, if you"
	cont "want to use that"
	cont "TM or not."

	para "I'll send you off"
	line "with the wish that"
	cont "your journey will"
	cont "be fun."
	done

.DawnTMText:
	text "DAWN: Oh, wow. I"
	line "didn't know the"
	cont "PROFESSOR had TMs."

	para "Was he a trainer"
	line "when he was young?"
	done

.LucasTMText:
	text "LUCAS: Well, I'll"
	line "be… The PROFESSOR"
	cont "had TMs…?"

	para "Next thing, he'll"
	line "tell me he battled"
	cont "when he was young."
	done

.DawnShowYouText:
	text "OK, <PLAYER>, I'll"
	line "act as your"
	cont "mentor."

	para "I've got a bit more"
	line "experience than"
	cont "you as a TRAINER"
	cont "and as PROF.ROWAN's"
	cont "assistant."

	para "OK, follow me!"
	done

.LucasShowYouText:
	text "Hey, <PLAYER>! I"
	line "want to show you"
	cont "a few things."
	cont "So, follow me!"
	done

.DawnPMCText:
	text "This building with"
	line "the red roof is a" ; this needs to change
	cont "#MON CENTER."

	para "It's the place that"
	line "heals #MON that"
	cont "have been hurt in"
	cont "battle."

	para "You can find a"
	line "#MON CENTER in"
	cont "most towns."
	done

.LucasPMCText:
	text "This building with"
	line "the red roof is a" ; this needs to change
	cont "#MON CENTER."

	para "You can get your"
	line "#MON healed if"
	cont "it's been hurt in"
	cont "battle."

	para "You'll find a"
	line "#MON CENTER in"
	cont "most towns."
	done

.DawnMartText:
	text "The building with"
	line "the blue roof over" ; this needs to change
	cont "here is the"
	cont "# MART. It's a"
	cont "shop where you can"
	cont "buy and sell items"
	cont "and medicine."

	para "<PLAYER>, since"
	line "you're a novice"
	cont "TRAINER, you won't"
	cont "be able to buy"
	cont "many kinds of"
	cont "merchandise yet."

	para "Don't let it bother"
	line "you!"
	done

.LucasMartText:
	text "Over here, the"
	line "building with the"
	cont "blue roof is the" ; this needs to change
	cont "# MART."

	para "It's a shop where"
	line "you can buy and"
	cont "sell all sorts of"
	cont "items."

	para "<PLAYER>, since"
	line "you're a rookie"
	cont "TRAINER, you won't"
	cont "be able to buy"
	cont "very much stuff."

	para "Don't worry about"
	line "it, OK>"
	done

.DawnTellFamilyText:
	text "Oh, that's right!"

	para "<PLAYER>…"

	para "Don't you need to"
	line "let your family"
	cont "know that you're"
	cont "going to help"
	cont "PROF.ROWAN with"
	cont "the #DEX?"

	para "You may need to go"
	line "far away, so I"
	cont "think you should"
	cont "let someone know."

	para "Oh, but before you"
	line "go, heal up your"
	cont "#MON at the"
	cont "#MON CENTER."

	para "It will be a lot"
	line "less scary that"
	cont "way."

	para "OK, bye now!"
	done

.LucasTellFamilyText:
	text "Oh, yeah, right!"

	para "<PLAYER>…"

	para "You should let"
	line "your family know"
	cont "you're helping"
	cont "PROF.ROWAN put"
	cont "together his"
	cont "#DEX."

	para "Sometimes you have"
	line "to go far away, so"
	cont "you should let"
	cont "someone know."

	para "Oh, but first, go"
	line "heal up your"
	cont "#MON at the"
	cont "#MON CENTER."

	para "You'll be safe"
	line "then. OK, be"
	cont "seeing you!"
	done

.ExitLabMovement:
	step DOWN
	step_end

.OutOfTheWayMovement:
	step RIGHT
	turn_head LEFT
	step_end

.ReEnterLabMovement:
	step UP
	step_end

.ApproachPlayerMovement:
	step UP
	turn_head RIGHT
	step_end

.LabToPMCMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

.PMCToMartMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

.MartToRouteMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

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
	playsound SFX_BUMP
	opentext
	writetext .ThudText
	closetext
	showemote EMOTE_SHOCK, SANDGEMTOWN_RIVAL, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
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
	clearevent EVENT_SANDGEM_TOWN_DAWNLUCAS
	setscene SCENE_SANDGEMTOWN_AFTER_LAB
	warpfacing UP, ROWANS_LAB, 4, 11
	end

.DawnGreetingText:
	text "DAWN: Oh! There"
	line "you are! Please,"
	cont "come with me."
	cont "The PROFESSOR is"
	cont "waiting!"
	done

.LucasGreetingText:
	text "LUCAS: Hi! I've"
	line "been waiting for"
	cont "you! Please, come"
	cont "with me."
	cont "The PROF's waiting"
	cont "to see you."
	done

.DawnLabText:
	text "This is it! Our"
	line "#MON RESEARCH"
	cont "LAB!"

	para "Let's go…"
	done

.LucasLabText:
	text "See? This is our"
	line "#MON RESEARCH"
	cont "LAB."

	para "We'll just go ahead"
	line "and…"
	done

.ThudText:
	text_big "Thud!!@"

.RivalText:
	text "<RIVAL>: What the…"

	para "Oh, it's you,"
	line "<PLAYER>!"

	para "That old guy… He's"
	line "not scary so much"
	cont "as he is totally"
	cont "out there!"

	para "Aww, it doesn't"
	line "matter, <PLAYER>."

	para "I'm out of here."
	line "See you later!"
	done

.DawnYourFriendText:
	text "DAWN: Wow, what"
	line "was that?"

	para "Your friend sure"
	line "seems to be really"
	cont "impatient."

	para "Well, anyway…"
	line "Let's go inside."
	done

.LucasYourFriendText:
	text "LUCAS: What was"
	line "that?!"

	para "Your friend always"
	line "seems to be in"
	cont "such a rush."

	para "Anyway…"
	line "Let's go in."
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

SandgemTown_NameSignScript:
	jumptext .Text
.Text:
	text "SANDGEM TOWN"
	line "Town of Sand!"
	done

SandgemTown_DawnLucasHouseSignScript:
	jumptext .Text
.Text:
	text "<ASST>'s House"
	done

SandgemTown_LabSignScript:
	jumptext .Text
.Text:
	text "PROFESSOR ROWAN's"
	line "Research Lab"
	done

SandgemTown_PMCSignScript:
	jumptext .Text
.Text:
	text "Heal your #MON!"
	line "#MON CENTER"
	done

SandgemTown_MartSignScript:
	jumptext .Text
.Text:
	text "All Your Item"
	line "Needs Fulfilled!"
	cont "#MON MART"
	done

SandgemTown_PokemonCoolKidScript:
	jumptextfaceplayer .Text
.Text:
	text "Ow, wow! #MON"
	line "are so cool!"

	para "You can make yours"
	line "battle and make"
	cont "them stronger!"

	para "I wish I had some!"
	line "It's so cool!"
	done

SandgemTown_PokedexGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "That thing you"
	line "have!"

	para "It's a #DEX,"
	line "isn't it?"

	para "You're off to see"
	line "all kinds of"
	cont "#MON now!"
	cont "Lucky you!"
	done

SandgemTown_SaveWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "So I don't forget"
	line "what's happened"
	cont "till now, I'd"
	cont "better SAVE this…"

	para "There! Now I can"
	line "take a break."
	done

SandgemTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8,  5, ROWANS_LAB, 1
	warp_event  7, 13, SANDGEM_HOUSE_1, 1
	warp_event 13, 13, ASSISTANT_HOUSE_1F, 1
	warp_event 21,  5, SANDGEM_POKEMART, 2
	warp_event 13,  5, SANDGEM_POKEMON_CENTER_1F, 1

	db 2 ; coord events
	coord_event  4,  6, SCENE_SANDGEMTOWN_FIRST_VISIT, SandgemTown_FirstVisitScriptU
	coord_event  4,  7, SCENE_SANDGEMTOWN_FIRST_VISIT, SandgemTown_FirstVisitScriptD

	db 5 ; bg events
	bg_event 19, 13, BGEVENT_READ, SandgemTown_NameSignScript
	bg_event 11, 13, BGEVENT_READ, SandgemTown_DawnLucasHouseSignScript
	bg_event  5,  5, BGEVENT_READ, SandgemTown_LabSignScript
	bg_event 14,  5, BGEVENT_READ, SandgemTown_PMCSignScript
	bg_event 22,  5, BGEVENT_READ, SandgemTown_MartSignScript

	db 6 ; object events
	object_event  8,  7, SPRITE_DAWN_LUCAS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SANDGEM_TOWN_DAWNLUCAS
	object_event  8,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SANDGEM_TOWN_RIVAL
	object_event  8,  5, SPRITE_ROWAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SANDGEM_TOWN_ROWAN
	object_event 21, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemTown_PokemonCoolKidScript, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandgemTown_PokedexGuyScript, -1
	object_event 18, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SandgemTown_SaveWomanScript, -1
