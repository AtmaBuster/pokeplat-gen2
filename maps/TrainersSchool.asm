	object_const_def ; object_event constants
	const TRAINERSSCHOOL_RIVAL
	const TRAINERSSCHOOL_OBJECT1
	const TRAINERSSCHOOL_OBJECT2
	const TRAINERSSCHOOL_OBJECT3
	const TRAINERSSCHOOL_OBJECT4
	const TRAINERSSCHOOL_OBJECT5
	const TRAINERSSCHOOL_OBJECT6
	const TRAINERSSCHOOL_OBJECT7

TrainersSchool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainersSchool_RivalScript:
	faceplayer
	opentext
	writetext .ComeToStudyText
	waitbutton
	writetext .DeliveredText
	playsound SFX_ITEM
	waitsfx
	takeitem PARCEL
	writetext .WhatIsThisText
	waitbutton
	writetext .ReceivedAppText
	waitsfx
	playsound SFX_ITEM
	waitbutton
	writetext .ButNoPoketchText
	waitsfx
	playsound SFX_WRONG
	waitbutton
	writetext .RivalCampaignText
	buttonsound
	writetext .NextDestinationText
	waitbutton
	closetext
	callstd tableindexfromfacing
	applymovementtable TRAINERSSCHOOL_RIVAL, .LeaveMovement
	disappear TRAINERSSCHOOL_RIVAL
	setmapscene JUBILIFE_CITY, SCENE_JUBILIFECITY_START_POKETCH
	clearevent EVENT_JUBILIFE_CITY_CLOWNS
	variablesprite SPRITE_DAWN_LUCAS2, SPRITE_POKEFAN_M
	clearevent EVENT_JUBILIFE_CITY_DAWNLUCAS
	setevent EVENT_GAVE_PARCEL_TO_RIVAL
	end

.ComeToStudyText:
	text "<RIVAL>: Hey,"
	line "<PLAYER>! Did you"
	cont "come to study,"
	cont "too?"

	para "I went ahead and"
	line "memorized all the"
	cont "stuff that was up"
	cont "on the blackboard."

	para "After all, it's the"
	line "TRAINER's job to"
	cont "avoid having their"
	cont "precious #MON"
	cont "hurt in battle,"
	cont "right?"

	para "So, <PLAYER>, what"
	line "brings you?"

	para "Huh? You've got"
	line "something for me?"
	done

.DeliveredText:
	text "<PLAYER> delivered"
	line "the PARCEL."
	done

.WhatIsThisText:
	text "<RIVAL>: What is"
	line "this…?"

	para "Score! It's a TOWN"
	line "MAP #TCH APP!"

	para "Huh? Why are there"
	line "two in here?"

	para "I like it a lot,"
	line "but I don't need"
	cont "two."

	para "Here, <PLAYER>, you"
	line "take one!"
	done

.ReceivedAppText:
	text "<PLAYER> got the"
	line "TOWN MAP APP!"
	done

.ButNoPoketchText:
	text "But <PLAYER> doesn't"
	line "have a #TCH…"
	done

.RivalCampaignText:
	text "<RIVAL>: Oh,"
	line "<PLAYER>, you don't"
	cont "have a #TCH?"

	para "I think there's a"
	line "special campaign"
	cont "going on with a"
	cont "#TCH for the"
	cont "prize."

	para "Go give that a go!"
	done

.NextDestinationText:
	text "Hmm…"

	para "Well, according to"
	line "the TOWN MAP, I"
	cont "guess OREBURGH"
	cont "CITY is where I"
	cont "should be going"
	cont "next."

	para "There's a GYM, so"
	line "it'd be perfect"
	cont "for raising the"
	cont "#MON I just"
	cont "caught."

	para "Well, I'm on the"
	line "road to becoming"
	cont "the greatest"
	cont "TRAINER of all"
	cont "time!"

	para "See you around!"
	done

.LeaveMovement:
	dw .LeaveMovement1
	dw .LeaveMovement2
	dw .LeaveMovement1
	dw .LeaveMovement1

.LeaveMovement2:
	step RIGHT
	step DOWN
.LeaveMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

TrainersSchool_TeacherScript:
	jumptextfaceplayer .Text
.Text:
	text "It's perfectly fine"
	line "for TRAINERS and"
	cont "#MON to develop"
	cont "at their own pace."

	para "If there is"
	line "anything you're not"
	cont "familiar with, you"
	cont "can look it up"
	cont "here."
	done

TrainersSchool_TypeKidScript:
	jumptextfaceplayer .Text
.Text:
	text "We learned about"
	line "types today. Umm…"

	para "GRASS is weak to"
	line "FIRE, FIRE is weak"
	cont "to WATER, and"
	cont "WATER is weak to"
	cont "GRASS."
	done

TrainersSchool_EssayKidScript:
	jumptextfaceplayer .Text
.Text:
	text "I wrote an essay"
	line "in my notebook on"
	cont "what makes a true"
	cont "#MON TRAINER."
	done

TrainersSchool_ItemGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "#MON are smart"
	line "enough to use"
	cont "items that they"
	cont "hold."

	para "But they won't know"
	line "what to do with"
	cont "man-made items"
	cont "like POTIONS and"
	cont "ANTIDOTES."
	done

TrainersSchool_NotebookScript:
	jumptextfaceplayer .Text
.Text:
	text "It's a notebook"
	line "filled up with"
	cont "writing. Let's see…"

	para "#MON are to be"
	line "caught using"
	cont "# BALLS."

	para "Up to six #MON"
	line "can accompany a"
	cont "TRAINER."

	para "A TRAINER is some-"
	line "one who catches"
	cont "#MON, raises"
	cont "them, and battles"
	cont "with them."

	para "A TRAINER's mission"
	line "is to defeat the"
	cont "strong TRAINERS"
	cont "who await"
	cont "challengers in"
	cont "#MON GYMS."
	done

TrainersSchool_BattleBoyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SCHOOLBOY_HARRISON
	iftrue .After
	writetext .IntroText
	yesorno
	iftrue .SaidYes
	writetext .SaidNoText
	waitbutton
	closetext
	end

.SaidYes:
	writetext .SaidYesText
	waitbutton
	closetext
	winlosstext .WinText, 0
	loadtrainer SCHOOLBOY, HARRISON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCHOOLBOY_HARRISON
	opentext
.After:
	checkevent EVENT_TRAINERS_SCHOOL_GOT_POTION
	iftrue .AfterPotion
	checkevent EVENT_BEAT_SCHOOLGIRL_KRISTIN
	iffalse .AllDone
	writetext .PotionText
	waitbutton
	verbosegiveitem POTION
	iffalse .BagFull
	setevent EVENT_TRAINERS_SCHOOL_GOT_POTION
.AfterPotion:
	writetext .AfterPotionText
	waitbutton
.BagFull:
	closetext
	end

.AllDone:
	writetext .AfterText
	waitbutton
	closetext
	end

.IntroText:
	text "Doing it is the"
	line "best way to learn!"

	para "Can we get a"
	line "battle with you?"
	done

.SaidNoText:
	text "Aww! But battling"
	line "is the best way to"
	cont "learn about"
	cont "#MON!"
	done
	
.SaidYesText:
	text "Go!"
	line "My #MON, go!"
	done

.WinText:
	text "Ugh…"

	para "I didn't use items"
	line "effectively."
	done

.PotionText:
	text "Whew! You're really"
	line "good!"

	para "We've been studying"
	line "every day, but we"
	cont "were no match for"
	cont "you at all!"

	para "You'd be able to"
	line "use this POTION"
	cont "properly."
	cont "Here you go!"
	done

.AfterPotionText:
	text "When a POTION is"
	line "used, it restores"
	cont "the HP of a"
	cont "#MON."

	para "Being a good"
	line "TRAINER isn't only"
	cont "about ordering"
	cont "your #MON"
	cont "around."

	para "A superior TRAINER"
	line "knows how to use"
	cont "items to the full"
	cont "advantage!"
	done

.AfterText:
	text "It's hard to win if"
	line "you don't have some"
	cont "#MON to choose"
	cont "from."
	done

TrainersSchool_BattleGirlScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SCHOOLGIRL_KRISTIN
	iftrue .After
	writetext .IntroText
	yesorno
	iftrue .SaidYes
	writetext .SaidNoText
	waitbutton
	closetext
	end

.SaidYes:
	writetext .SaidYesText
	waitbutton
	closetext
	winlosstext .WinText, 0
	loadtrainer SCHOOLGIRL, KRISTIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCHOOLGIRL_KRISTIN
	opentext
.After:
	checkevent EVENT_TRAINERS_SCHOOL_GOT_POTION
	iftrue .AllDone
	checkevent EVENT_BEAT_SCHOOLBOY_HARRISON
	iftrue .GetPotion
.AllDone:
	writetext .AfterText
	waitbutton
	closetext
	end

.GetPotion:
	writetext .GetPotionText
	waitbutton
	closetext
	end

.IntroText:
	text "I just became"
	line "friends with my"
	cont "#MON."

	para "I'm not sure if we"
	line "can do this"
	cont "properly, but may"
	cont "we battle?"
	done

.SaidNoText:
	text "Boo!"

	para "Where's your sense"
	line "of adventure?"

	para "Don't be shy about"
	line "talking to people"
	cont "and getting into"
	cont "battles!"
	done

.SaidYesText:
	text "I need to try the"
	line "things I learned"
	cont "before I forget"
	cont "them!"
	done

.WinText:
	text "I like to study…"

	para "I thought I could"
	line "win…"
	done

.AfterText:
	text "I wonder if we"
	line "could have done"
	cont "better against"
	cont "you?"

	para "Like if I used"
	line "POTIONS right when"
	cont "we needed to."
	done

.GetPotionText:
	text "We were actually"
	line "confident that we"
	cont "would do pretty"
	cont "good."

	para "But I'm completely"
	line "impressed by how"
	cont "tought you are."

	para "If you'd like, talk"
	line "th my friend and"
	cont "get a nice item"
	cont "from him."
	done

TrainersSchool_XAttackScript:
	itemball X_ATTACK

TrainersSchool_BlackboardScript:
	opentext
	writetext .BlackboardText
	buttonsound
.Loop:
	writetext .ReadWhichText
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext .PoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext .ParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext .SleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext .BurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext .FreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .StatusText
	dbw BANK(TrainersSchool_BlackboardScript), 0

.StatusText:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

.BlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done

.ReadWhichText:
	text "Which would you"
	line "like to read?"
	done

.PoisonText:
	text "It a #MON is"
	line "poisoned, it will"
	cont "steadily lose HP."

	para "The effects of"
	line "poison linger"
	cont "after a battle."

	para "A poisoned #MON"
	line "will lose HP while"
	cont "it is traveling."

	para "Heal a poisoning"
	line "with an ANTIDOTE."
	done

.ParalysisText:
	text "It a #MON is"
	line "paralyzed, its"
	cont "SPEED stat drops."

	para "In addition, it"
	line "may not be able to"
	cont "move while it is"
	cont "in battle."

	para "Paralysis remains"
	line "after battle."

	para "Cure it using a"
	line "PARLYZ HEAL."
	done

.SleepText:
	text "It a #MON falls"
	line "asleep, it will be"
	cont "unable to attack."

	para "The #MON may"
	line "wake up on its,"
	cont "own, but if a"
	cont "battle ends while"
	cont "it is sleeping, it"
	cont "will stay asleep."

	para "Wake it up using"
	line "an AWAKENING."
	done

.BurnText:
	text "A burn reduces the"
	line "ATTACK stat and"
	cont "steadily reduces"
	cont "the victim's HP."

	para "A burn lingers"
	line "after battle."

	para "Cure a burn using"
	line "a BURN HEAL."
	done

.FreezeText:
	text "If a #MON is"
	line "frozen, it becomes"
	cont "totally helpless."

	para "The #MON may"
	line "thaw out on its"
	cont "own, but if a"
	cont "battle ends while"
	cont "it is frozen, it"
	cont "will stay frozen."

	para "Thaw it out using"
	line "an ICE HEAL."
	done

TrainersSchool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, JUBILIFE_CITY, 10
	warp_event  5,  7, JUBILIFE_CITY, 10

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  0, BGEVENT_READ, TrainersSchool_BlackboardScript
	bg_event  4,  0, BGEVENT_READ, TrainersSchool_BlackboardScript

	db 9 ; object events
	object_event  4,  1, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_RivalScript, EVENT_TRAINERS_SCHOOL_RIVAL
	object_event  3,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_TeacherScript, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_TypeKidScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_EssayKidScript, -1
	object_event  0,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_ItemGirlScript, -1
	object_event 10,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_BattleBoyScript, -1
	object_event 12,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_BattleGirlScript, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainersSchool_NotebookScript, -1
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TrainersSchool_XAttackScript, EVENT_TRAINERS_SCHOOL_X_ATTACK
