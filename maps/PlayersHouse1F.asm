	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM
	const PLAYERSHOUSE1F_RIVALMOM

PlayersHouse1F_MapScripts:
	db 4 ; scene scripts
	scene_script .Scene0 ; SCENE_PLAYERSHOUSE1F_FIRST_TIME
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME
	scene_script .Dummy  ; SCENE_PLAYERSHOUSE1F_NOTHING
	scene_script .Scene3 ; SCENE_PLAYERSHOUSE1F_AFTER_RIVAL1

	db 0 ; callbacks

.Scene0:
	sdefer .FirstTime
.Dummy:
	end

.Scene3:
	sdefer .AfterRival1
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

.AfterRival1:
	opentext
	writetext .WhatsTheMatterText
	waitbutton
	closetext
	setscene SCENE_PLAYERSHOUSE1F_NOTHING
	setmapscene ROUTE_201, SCENE_ROUTE201_FIND_RIVAL_2
	end

.WhatsTheMatterText:
	text "Mom: What's the"
	line "matter, dear?"

	para "…"
	line "…"

	para "Wow. That's what"
	line "happened to you?"

	para "You and <RIVAL>"
	line "are lucky to have"
	cont "met PROF.ROWAN."

	para "Imagine if you"
	line "didn't…"

	para "I wouldn't like to"
	line "thing what the"
	cont "wild #MON might"
	cont "have done to you."

	para "<PLAYER>, go see"
	line "PROF.ROWAN, and"
	cont "thank him properly"
	cont "for your #MON."

	para "His lab is in"
	line "SANDGEM TOWN, isn't"
	cont "it? Now that you"
	cont "have your own"
	cont "#MON, the tall"
	cont "grass won't be so"
	cont "threatening."
	done

PlayersHouse1F_MomScript:
	faceplayer
	checkscene
	ifequal SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME, .BeforeExit
	checkflag ENGINE_FLYPOINT_TWINLEAF
	iftrue .HaveLeftHouse
	jumptext .TakeCareText

.HealMons:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyHealed
	opentext
	writetext .WelcomeHomeText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	checkevent EVENT_GOT_PARCEL
	iftrue .Done
	checkevent EVENT_TELLING_MOM_ABOUT_DEX
	iftrue .TellMomAboutDex
.Done:
	end

.AlreadyHealed:
	random 5
	ifequal 0, .RandomText1
	ifequal 1, .RandomText2
	ifequal 2, .RandomText3
	ifequal 3, .RandomText4
	jumptext .LookingGoodText

.RandomText1:
	jumptext .TreatWithKindnessText
.RandomText2:
	jumptext .RemindOfFatherText
.RandomText3:
	jumptext .VisitRivalsMomText
.RandomText4:
	jumptext .GetWorriedText

.HaveLeftHouse:
	checkevent EVENT_GOT_STARTER
	iftrue .HealMons
	jumptext .RivalWaitingText

.BeforeExit:
	jumptext .ImpatientText

.TellMomAboutDex:
	opentext
	writetext .WhatIsItText
	waitbutton
	verbosegiveitem JOURNAL
; bag cannot be full normally, ignore fail case
	writetext .ThatsAJournalText
	waitbutton
	turnobject PLAYERSHOUSE1F_MOM, LEFT
	writetext .FullOfAdventureText
	waitbutton
	faceplayer
	writetext .IllBeAllRightText
	waitbutton
	closetext
	appear PLAYERSHOUSE1F_RIVALMOM
	turnobject PLAYERSHOUSE1F_MOM, DOWN
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM, 15
	applymovement PLAYERSHOUSE1F_RIVALMOM, .RivalMomEnterMovement
	opentext
	writetext .IsRivalHereText
	buttonsound
	writetext .NotHereText
	buttonsound
	writetext .MustHaveLeftText
	buttonsound
	writetext .DeliverToHimText
	waitbutton
	faceplayer
	writetext .WontYoutext
	waitbutton
	closetext
	callstd tableindexfromfacing
	applymovementtable PLAYERSHOUSE1F_RIVALMOM, .RivalMomGoToPlayerMovement
	setlasttalked PLAYERSHOUSE1F_RIVALMOM
	faceplayer
	faceobject PLAYER, PLAYERSHOUSE1F_RIVALMOM
	opentext
	writetext .TakeThisToHimText
	waitbutton
	verbosegiveitem PARCEL
; bag cannot be full normally, ignore fail case
	writetext .ByeByeText
	buttonsound
	writetext .LetMeThinkText
	waitbutton
	closetext
	applymovementtable PLAYERSHOUSE1F_RIVALMOM, .RivalMomLeaveMovement
	disappear PLAYERSHOUSE1F_RIVALMOM
	setevent EVENT_GOT_PARCEL
	end

.TakeCareText:
	text "Mom: Bye-bye,"
	line "<PLAYER>!"

	para "You take care now!"
	done

.WelcomeHomeText:
	text "Mom: Welcome home,"
	line "<PLAYER>. Are you"
	cont "and your #MON"
	cont "healthy?"

	para "Take a quick rest,"
	line "dear."
	done

.LookingGoodText:
	text "Mom: <PLAYER>!"

	para "You and your"
	line "#MON are look-"
	cont "ing good!"

	para "Nothing can stop"
	line "you now!"
	done

.TreatWithKindnessText:
	text "Mom: <PLAYER>."

	para "Listen. Always"
	line "treat your #MON"
	cont "with kindness."

	para "Your #MON work"
	line "hard, not for"
	cont "themselves, but"
	cont "for you!"
	done

.RemindOfFatherText:
	text "Mom: <PLAYER>."

	para "Seeing you reminds"
	line "me so much of your"
	cont "father. You two"
	cont "are so alike!"
	done

.VisitRivalsMomText:
	text "Mom: While you're"
	line "gone I go visit"
	cont "<RIVAL>'s mom."

	para "We talk about this"
	line "and that."

	para "Well, actually,"
	line "all we do is talk"
	cont "about you two."
	done

.GetWorriedText:
	text "Mom: <PLAYER>, is"
	line "everything all"
	cont "right?"

	para "I get worried"
	line "seeing the news…"

	para "But you're all"
	line "right, aren't you?"
	cont "After all, you're"
	cont "never alone."
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

.WhatIsItText:
	text "Mom: What is it,"
	line "<PLAYER>?"

	para "…"

	para "Wow. PROF.ROWAN"
	line "asked you to do"
	cont "something that"
	cont "big."

	para "OK, dear, go for"
	line "it! Your mom's got"
	cont "your back!"

	para "Oh, I know!"
	line "<PLAYER>, I've got"
	cont "something that"
	cont "you'll find useful."
	done

.ThatsAJournalText:
	text "That's a JOURNAL."
	line "It keeps a record"
	cont "of your daily"
	cont "events."

	para "Check it, and"
	line "you'll be able to"
	cont "remember what you"
	cont "did last."
	done

.FullOfAdventureText:
	text "Gee, a journey"
	line "full of adventure…"

	para "I envy you, kiddo."

	para "Plus, you're not"
	line "alone. You have"
	cont "your #MON with"
	cont "you."

	para "I wish I could go"
	line "instead!"
	done

.IllBeAllRightText:
	text "I'm just joking,"
	line "dear!"
	cont "Yup, <PLAYER>!"

	para "I'll be all right"
	line "by myself, so you"
	cont "go and enjoy your"
	cont "adventure!"

	para "When you're exposed"
	line "to new things, and"
	cont "experience new"
	cont "sensations…"

	para "It makes your"
	line "mother happy, too."

	para "…But come back"
	line "sometimes."

	para "I would like to"
	line "see the kinds of"
	cont "#MON you've"
	cont "caught, dear."
	done

.IsRivalHereText:
	text "<RIVAL>'s mom:"
	line "Excuse me. Is my"
	cont "<RIVAL> here?"
	done

.NotHereText:
	text "Mom: Oh?"
	line "No, he's not…"
	done

.MustHaveLeftText:
	text "<RIVAL>'s mom: Oh…"
	line "Then, he must have"
	cont "left already…"

	para "What to do…"

	para "That boy shouted"
	line "about going on an"
	cont "adventure, then he"
	cont "bolted."

	para "He's so headstrong"
	line "and reckless…"

	para "I at least wanted"
	line "him to take this…"
	done

.DeliverToHimText:
	text "Mom: Not to worry,"
	line "<PLAYER> will"
	cont "deliver it to him."
	done

.WontYoutext:
	text "Won't you, <PLAYER>?"
	done

.TakeThisToHimText:
	text "<RIVAL>'s mom: Oh,"
	line "really? You'd do"
	cont "that for me?"

	para "<PLAYER>, please"
	line "take this to"
	cont "<RIVAL> for me."
	done

.ByeByeText:
	text "Mom: Bye-bye,"
	line "<PLAYER>! Enjoy"
	cont "your adventure!"
	done

.LetMeThinkText:
	text "<RIVAL>'s mom: Let"
	line "me thing…"

	para "Knowing my boy, he"
	line "would probably"
	cont "head straight to"
	cont "JUBILIFE CITY…"

	para "OK, take that to"
	line "my <RIVAL>, then."
	done

.RivalMomEnterMovement:
	step UP
	step_end

.RivalMomGoToPlayerMovement:
	dw .RivalMomGoToPlayerMovementU
	dw .RivalMomGoToPlayerMovementD
	dw .RivalMomGoToPlayerMovementR
	dw .NoStep

.RivalMomLeaveMovement:
	dw .RivalMomLeaveMovementU
	dw .RivalMomLeaveMovementD
	dw .RivalMomLeaveMovementR
	dw .NoStep

.RivalMomGoToPlayerMovementD:
	step RIGHT
	turn_head UP
.NoStep:
	step_end

.RivalMomGoToPlayerMovementU:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

.RivalMomGoToPlayerMovementR:
	step RIGHT
	step RIGHT
	step UP
	step_end

.RivalMomLeaveMovementU:
	step DOWN
	step DOWN
.RivalMomLeaveMovementR:
	step DOWN
	step LEFT
.RivalMomLeaveMovementD:
	step DOWN
	step_end

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

	db 2 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse1F_MomScript, -1
	object_event  6,  7, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PLAYERS_HOUSE_1F_RIVAL_MOM
