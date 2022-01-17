	object_const_def ; object_event constants
	const ROWANSLAB_ROWAN
	const ROWANSLAB_DAWNLUCAS

RowansLab_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Dummy  ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	sdefer .FirstVisitScript
.Dummy:
	end

.FirstVisitScript:
	applymovement ROWANSLAB_DAWNLUCAS, .FrontOfPlayerMovement
	follow ROWANSLAB_DAWNLUCAS, PLAYER
	applymovement ROWANSLAB_DAWNLUCAS, .ToRowanMovement
	stopfollow
	opentext
	writetext .LookWhosHereText
	waitbutton
	closetext
	pause 15
	opentext
	writetext .RatherHappyText
	buttonsound
	scall .BufferStarterName
	writetext .NoMistakeText
	buttonsound
	; nickname, skip?
	writetext .FirstSawText
	waitbutton
	turnobject PLAYER, RIGHT
	writetextgender .DawnKindText, .LucasKindText
	waitbutton
	turnobject PLAYER, UP
	writetext .MainTopicText
	buttonsound
	writetext .ProperIntroductionText
.YesNoLoop:
	yesorno
	iftrue .SaidYes
	writetext .VeryPatientText
	sjump .YesNoLoop

.SaidYes:
	writetext .GoodAnswerText
	waitbutton
	writetext .GotPokedexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	setevent EVENT_GOT_POKEDEX
	writetext .ExplainDexText
	waitbutton
	writetextgender .DawnHaveDexText, .LucasHaveDexText
	waitbutton
	writetext .WhatDidYouFeelText
	waitbutton
	turnobject PLAYER, RIGHT
	writetextgender .DawnAskedToHelpText, .LucasAskedToHelpText
	waitbutton
	closetext
	applymovement ROWANSLAB_DAWNLUCAS, .DawnLucasLeaveMovement
	disappear ROWANSLAB_DAWNLUCAS
	setscene SCENE_FINISHED
	end

.LookWhosHereText:
	text "PROFESSOR: Well,"
	line "well, look who's"
	cont "here."

	para "<PLAYER>, was it?"
	line "Let's have a look"
	cont "at your #MON."
	done

.RatherHappyText:
	text "…"

	para "Hmm…"
	line "I see…"

	para "This #MON seems"
	line "to be rather"
	cont "happy."
	done

.NoMistakeText:
	text "Hm!"

	para "Entrusting you"
	line "with that @"
	text_ram wStringBuffer3
	text ""
	cont "was no mistake,"
	cont "it seems."
	done

.FirstSawText:
	text "PROFESSOR: When I"
	line "first saw you two"
	cont "about to step into"
	cont "the tall grass"
	cont "without #MON, I"
	cont "was shocked."

	para "I was astounded by"
	line "these foolhardy"
	cont "children."

	para "But now, you've"
	line "astounded me in an"
	cont "entirely different"
	cont "way."

	para "Already, there is"
	line "a bond growing"
	cont "between you and"
	cont "that #MON."

	para "I feel priveleged"
	line "to have met you."

	para "I'm sure @"
	text_ram wStringBuffer3
	text ""
	line "feels the same way"
	cont "about you."

	para "That's why I'll ask"
	line "you to cherish"
	cont "that @"
	text_ram wStringBuffer3
	text " of"
	cont "yours."
	done

.DawnKindText:
	text "DAWN: I'm so glad"
	line "you're kind toward"
	cont "#MON!"

	para "If you weren't, I'd"
	line "have to…"

	para "Oh, I just can't"
	line "say it…"
	done

.LucasKindText:
	text "LUCAS: Boy, am I"
	line "glad you're kind"
	cont "toward #MON!"

	para "If you weren't,"
	line "well…"

	para "I don't even want"
	line "to think about it."
	done

.MainTopicText:
	text "PROFESSOR: Er-hem!"
	line "Let's move on to"
	cont "the main topic."

	para "There is something"
	line "I want you to do"
	cont "for me."
	done

.ProperIntroductionText:
	text "First, allow me to"
	line "properly introduce"
	cont "myself."

	para "My name, as you"
	line "know, is ROWAN."
	cont "I study #MON."

	para "First of all, I"
	line "want to know what"
	cont "kinds of #MON"
	cont "live in the SINNOH"
	cont "region."

	para "To do so, it is"
	line "necessary to"
	cont "collect data using"
	cont "the #DEX."

	para "This is what I"
	line "will ask of you."

	para "I want to entrust"
	line "you with this"
	cont "#DEX."

	para "Will you use it to"
	line "record data on all"
	cont "the #MON in"
	cont "SINNOH for me?"
	done

.VeryPatientText:
	text "ROWAN:…"

	para "…"

	para "…"

	para "…"

	para "I can stand here"
	line "without speaking"
	cont "for hours. I'm a"
	cont "very patient man."

	para "Let me ask you"
	line "again, <PLAYER>."

	para "I want to entrust"
	line "you with this"
	cont "#DEX."

	para "Will you use it to"
	line "record data on all"
	cont "the #MON in"
	cont "SINNOH for me?"
	done

.GoodAnswerText:
	text "ROWAN: Hm!"
	line "Good answer!"
	done

.GotPokedexText:
	text "<PLAYER> got the"
	line "#DEX!"
	done

.ExplainDexText:
	text "ROWAN: The #DEX"
	line "is a very"
	cont "high-tech device."

	para "It will record"
	line "data on every kind"
	cont "of #MON you see"
	cont "automatically."

	para "<PLAYER>, I ask"
	line "that you go every-"
	cont "where and meet"
	cont "every kind of"
	cont "#MON in this"
	cont "region!"
	done

.DawnHaveDexText:
	text "DAWN: I've got one,"
	line "too!"
	done

.LucasHaveDexText:
	text "LUCAS: I've got the"
	line "same kind of"
	cont "#DEX as you."
	done

.WhatDidYouFeelText:
	text "ROWAN: When you"
	line "walked along"
	cont "ROUTE 201 with"
	cont "your #MON, what"
	cont "did you feel?"

	para "I've lived for 60"
	line "long years. Even"
	cont "now, I get a"
	cont "thrill when I'm"
	cont "with a #MON."

	para "Now, you should"
	line "know that there"
	cont "are countless"
	cont "#MON in this"
	cont "world."

	para "That means there"
	line "are just as many"
	cont "thrills waiting"
	cont "for you out there!"

	para "Now go!"

	para "<PLAYER>, your"
	line "grand adventure"
	cont "begins right now!"
	done

.DawnAskedToHelpText:
	text "DAWN: The #MON"
	line "that I met for the"
	cont "first time was"
	cont "@"
	text_ram wStringBuffer4
	text "!"

	para "If you would have"
	line "chosen @"
	text_ram wStringBuffer4
	text " on"
	cont "ROUTE 201, we'd"
	cont "have the same"
	cont "#MON now!"

	para "Not that it really"
	line "matters, but…"

	para "Anyway, I'm DAWN."

	para "I also help the"
	line "PROFESSOR add new"
	cont "pages to the"
	cont "#DEX."

	para "So, in a sense, I'm"
	line "just like you."

	para "I just got a head"
	line "start on you,"
	cont "that's all."

	para "I'll be happy to"
	line "teach you things."
	cont "Glad to meet you,"
	cont "<PLAYER>!"
	done

.LucasAskedToHelpText:
	text "LUCAS: The"
	line "PROFESSOR asked me"
	cont "to help, so I'm"
	cont "also filling the"
	cont "#DEX pages."

	para "That makes us"
	line "comrades working"
	cont "toward the same"
	cont "goal."

	para "I'll teach you"
	line "stuff later, OK?"
	done

.FrontOfPlayerMovement:
	step UP
	step LEFT
	step_end

.ToRowanMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

.DawnLucasLeaveMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.BufferStarterName:
	checkevent EVENT_GOT_TURTWIG
	iftrue .Turtwig
	checkevent EVENT_GOT_CHIMCHAR
	iftrue .Chimchar
	getmonname STRING_BUFFER_3, PIPLUP
	getmonname STRING_BUFFER_4, CHIMCHAR
	end

.Turtwig:
	getmonname STRING_BUFFER_3, TURTWIG
	getmonname STRING_BUFFER_4, PIPLUP
	end

.Chimchar:
	getmonname STRING_BUFFER_3, CHIMCHAR
	getmonname STRING_BUFFER_4, TURTWIG
	end

RowansLab_RowanScript:
	faceplayer
	checkevent EVENT_EXITED_LAB
	iftrue .AfterExitLab
	jumptext .GoOnText

.AfterExitLab:
	opentext
	special ProfOaksPCBoot ; redo later
	waitbutton
	closetext
	end

.GoOnText:
	text "ROWAN: Go on!"

	para "<PLAYER>, your"
	line "grand adventure"
	cont "awaits you!"
	done

RowansLab_DawnLucasFatherScript:
	jumptextfaceplayer .Text
.Text:
	text "I'm <ASST>'s father."

	para "I'll be happy to"
	line "assist you on"
	cont "your quest for the"
	cont "PROFESSOR."

	para "Hahaha. Eh…"
	line "I'm sure we can"
	cont "count on you!"
	done

RowansLab_AideScript:
	jumptextfaceplayer .Text
.Text:
	text "PROFESSOR ROWAN"
	line "invented a new"
	cont "#DEX while"
	cont "working alongside"
	cont "a PROFESSOR from"
	cont "the KANTO region."

	para "Oh, my name is"
	line "ROSEANNE."

	para "It's an honor to be"
	line "an assistant to"
	cont "our PROFESSOR!"
	done

RowansLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SANDGEM_TOWN, 1
	warp_event  5, 11, SANDGEM_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  4, SPRITE_ROWAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RowansLab_RowanScript, -1
	object_event  5, 11, SPRITE_DAWN_LUCAS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROWANS_LAB_DAWNLUCAS
	object_event  2,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RowansLab_DawnLucasFatherScript, -1
	object_event  6,  8, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RowansLab_AideScript, -1
