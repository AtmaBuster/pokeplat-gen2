	object_const_def ; object_event constants

TVStation1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TVStation1F_ReceptionistScript:
	faceplayer
	opentext
	writetext .AskToPlayText
	yesorno
	iffalse .NoPlay
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext .LookUpText
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	writetext .YourNumberText
	buttonsound
	special CheckForLuckyNumberWinners
	ifequal 1, .GrandPrize
	ifequal 2, .FirstPrize
	ifequal 3, .SecondPrize
	ifequal 4, .ThirdPrize
	ifequal 5, .FourthPrize
; NoPrize
	writetext .NoMatchText
	waitbutton
.BagFull:
	closetext
	end

.GrandPrize:
	writetext .Match5Text
	waitsfx
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .BagFull
	setflag ENGINE_LUCKY_NUMBER_SHOW
	closetext
	end

.FirstPrize:
	writetext .Match4Text
	waitsfx
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	verbosegiveitem MAX_REVIVE
	iffalse .BagFull
	setflag ENGINE_LUCKY_NUMBER_SHOW
	closetext
	end

.SecondPrize:
	writetext .Match3Text
	waitsfx
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setflag ENGINE_LUCKY_NUMBER_SHOW
	closetext
	end

.ThirdPrize:
	writetext .Match2Text
	waitsfx
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	verbosegiveitem PP_UP
	iffalse .BagFull
	setflag ENGINE_LUCKY_NUMBER_SHOW
	closetext
	end

.FourthPrize:
	writetext .Match1Text
	waitsfx
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	verbosegiveitem ULTRA_BALL
	iffalse .BagFull
	setflag ENGINE_LUCKY_NUMBER_SHOW
	closetext
	end

.NoPlay:
	writetext .VisitAgainText
	waitbutton
	closetext
	end

.GameOver:
	writetext .GameOverText
	waitbutton
	closetext
	end

.AskToPlayText:
	text "This is the"
	line "#MON LOTTERY"
	cont "CORNER."

	para "I'm FELICITY, your"
	line "attendant today."

	para "If your drawn"
	line "number matches the"
	cont "ID No. of any of"
	cont "your #MON, you"
	cont "could win fabulous"
	cont "gifts."

	para "Would you like to"
	line "check today's"
	cont "lucky number?"
	done

.LookUpText:
	text "First, I'll look up"
	line "today's #MON"
	cont "LOTTERY CORNER"
	cont "lucky number."

	para "…"
	done

.YourNumberText:
	text "Your LOTO TICKET"
	line "number is @"
	text_ram wStringBuffer3
	text "."

	para "Now, let's see if"
	line "it matches the"
	cont "ID No. of any of"
	cont "your #MON."
	done

.NoMatchText:
	text "I'm sorry. You"
	line "didn't get a match…"
	done

.Match5Text:
	text "Oh, my goodness,"
	line "all five digits"
	cont "matched!"

	para "You've won the"
	line "jackpot prize!"

	para "This is just so"
	line "incredible!"

	para "…Oh, I'm sorry!"
	line "Your prize!"

	para "I got carried away"
	line "there."
	cont "Here you go!"
	done

.Match4Text:
	text "The last four"
	line "digits matched, so"
	cont "you win the first"
	cont "prize!"
	done

.Match3Text:
	text "The last three"
	line "digits matched, so"
	cont "you win the second"
	cont "prize!"
	done
	
.Match2Text:
	text "The last two"
	line "digits matched, so"
	cont "you win the third"
	cont "prize!"
	done

.Match1Text:
	text "The last digit"
	line "matched, so you"
	cont "win the fourth"
	cont "prize!"
	done

.VisitAgainText:
	text "Oh. I see. Please"
	line "do visit us again."
	done

.GameOverText:
	text "You've already"
	line "drawn a ticket"
	cont "today."

	para "Please come back"
	line "tomorrow."
	done

TVStation1F_CommercialsGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "I'm going to get"
	line "commercials shown"
	cont "on TV."

	para "They'll attract"
	line "more customers to"
	cont "the department"
	cont "store."
	done

TVStation1F_GymLeaderGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "The TV station"
	line "interviews all"
	cont "sorts of TRAINERS"
	cont "for its shows."

	para "After all, people"
	line "want to know about"
	cont "good TRAINERS and"
	cont "what they say."

	para "Personally, I'd"
	line "like to learn more"
	cont "about GYM LEADERS."

	para "I'd also like to"
	line "hear about the"
	cont "tough ELITE FOUR"
	cont "of the #MON"
	cont "LEAGUE."
	done


TVStation1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	
	warp_event  6,  9, JUBILIFE_CITY, 8
	warp_event  7,  9, JUBILIFE_CITY, 8
	warp_event 10,  0, TV_STATION_2F, 2
	warp_event 13,  0, TV_STATION_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  6,  3, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation1F_ReceptionistScript, -1
	object_event  2,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation1F_CommercialsGuyScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation1F_GymLeaderGuyScript, -1
;	object_event  0,  0, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation1F_RecordsWomanScript, -1
;	object_event  0,  0, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TVStation1F_DressUpGuyScript, -1
