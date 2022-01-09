	object_const_def ; object_event constants
	const JUBILIFECITY_DAWNLUCAS_PRES
	const JUBILIFECITY_LOOKER
	const JUBILIFECITY_OBJECT2
	const JUBILIFECITY_OBJECT3
	const JUBILIFECITY_OBJECT4
	const JUBILIFECITY_OBJECT5
	const JUBILIFECITY_OBJECT6
	const JUBILIFECITY_OBJECT7
	const JUBILIFECITY_OBJECT8
	const JUBILIFECITY_OBJECT9
	const JUBILIFECITY_OBJECT10
	const JUBILIFECITY_OBJECT11
	const JUBILIFECITY_OBJECT12
	const JUBILIFECITY_OBJECT13
	const JUBILIFECITY_OBJECT14

JubilifeCity_MapScripts:
	db 5 ; scene scripts
	scene_script .Dummy ; SCENE_JUBILIFECITY_FIRST_TIME
	scene_script .Dummy ; SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL
	scene_script .Dummy ; SCENE_JUBILIFECITY_START_POKETCH
	scene_script .Dummy ; SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH
	scene_script .Dummy ; SCENE_JUBILIFECITY_NOTHING

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Objects

.FlyPoint:
	setflag ENGINE_FLYPOINT_JUBILIFE
	return

.Objects:
	checkevent EVENT_GAVE_PARCEL_TO_RIVAL
	iffalse .Done
	moveobject JUBILIFECITY_DAWNLUCAS_PRES, 27, 19 ; reuse for Poketch President
.Done:
	return

.Dummy:
	end

JubilifeCity_DawnLucasScript1:
	settableindex 0
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript2:
	settableindex 1
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript3:
	settableindex 2
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript4:
	settableindex 3
JubilifeCity_DawnLucasScript:
	applymovement JUBILIFECITY_DAWNLUCAS_PRES, .EnterMovement
	showemote EMOTE_SHOCK, JUBILIFECITY_DAWNLUCAS_PRES, 15
	applymovementtable JUBILIFECITY_DAWNLUCAS_PRES, .ApproachPlayerMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetextgender .DawnCatchingText, .LucasCatchingText
	buttonsound
	readvar VAR_PARTYCOUNT
	ifless 4, .FewMon
	writetextgender .DawnManyMonText, .LucasManyMonText
	sjump .Join

.FewMon:
	writetextgender .DawnFewMonText, .LucasFewMonText
.Join:
	buttonsound
	writetextgender .DawnLearnMoreText, .LucasLearnMoreText
	waitbutton
	closetext
	moveobject JUBILIFECITY_LOOKER, 30, 21
	follow JUBILIFECITY_DAWNLUCAS_PRES, PLAYER
	applymovementtable JUBILIFECITY_DAWNLUCAS_PRES, .FollowMovement
	turnobject JUBILIFECITY_LOOKER, DOWN
	applymovement JUBILIFECITY_DAWNLUCAS_PRES, .FinishFollowMovement
	opentext
	writetextgender .DawnThatGuyText, .LucasThatGuyText
	waitbutton
	closetext
	applymovement JUBILIFECITY_LOOKER, .LookerMovement
	pause 10
	applymovement JUBILIFECITY_DAWNLUCAS_PRES, .ToLookerMovement
	stopfollow
	applymovement PLAYER, .PlayerToLookerMovement
	opentext
	writetextgender .DawnExcuseMeText, .LucasExcuseMeText
	waitbutton
	closetext
	turnobject JUBILIFECITY_LOOKER, DOWN
	showemote EMOTE_SHOCK, JUBILIFECITY_LOOKER, 15
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext .LookerWhatText
	buttonsound
	writetext .HowDidYouKnowText
	buttonsound
	writetextgender .DawnSmallTalkText, .LucasSmallTalkText
	buttonsound
	writetext .KnowBetterText
	buttonsound
	writetext .CoverBlownText
	yesorno
	iftrue .SaidYes
	writetext .DontKnowText
	sjump .YesNoJoin

.SaidYes:
	writetext .StealingIsWrongText
.YesNoJoin:
	buttonsound
	writetext .ThievesAmongUsText
	waitbutton
;	verbosegiveitem VS_SEEKER ; remove?
; ignore fail case
	writetext .VsRecorderText
	waitbutton
	closetext
	turnobject JUBILIFECITY_LOOKER, LEFT
	pause 10
	turnobject JUBILIFECITY_LOOKER, RIGHT
	pause 10
	turnobject JUBILIFECITY_LOOKER, DOWN
	opentext
	writetext .HaveARequestText
	waitbutton
	closetext
	applymovement JUBILIFECITY_LOOKER, .LookerExitMovement
	disappear JUBILIFECITY_LOOKER
	moveobject JUBILIFECITY_LOOKER, 35, 16
	appear JUBILIFECITY_LOOKER
	special RestartMapMusic
	opentext
	writetextgender .DawnSoundsHardText, .LucasSoundsHardText
	waitbutton
	closetext
	applymovement JUBILIFECITY_DAWNLUCAS_PRES, .MoveToSchoolMovement
	turnobject PLAYER, LEFT
	opentext
	writetextgender .DawnSchoolText, .LucasSchoolText
	waitbutton
	closetext
	applymovement PLAYER, .MoveToSchoolMovement
	turnobject JUBILIFECITY_DAWNLUCAS_PRES, RIGHT
	opentext
	writetextgender .DawnYourPalText, .LucasYourPalText
	waitbutton
	closetext
	applymovement JUBILIFECITY_DAWNLUCAS_PRES, .DawnLucasLeaveMovement
	disappear JUBILIFECITY_DAWNLUCAS_PRES
	setscene SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL
	end

.DawnCatchingText:
	text "DAWN: Hi, <PLAYER>!"

	para "Are you catching"
	line "#MON?"
	done

.LucasCatchingText:
	text "LUCAS: Hey,"
	line "<PLAYER>!"

	para "How many #MON"
	line "have you caught?"
	done

.DawnManyMonText:
	text "Wow! You've already"
	line "got @"
	text_decimal wScriptVar, 1, 1
	text " #MON with"
	cont "you!"

	para "At that pace, your"
	line "#DEX should be"
	cont "full in no time!"
	done

.LucasManyMonText:
	text "Whoa! You already"
	line "have @"
	text_decimal wScriptVar, 1, 1
	text " #MON"
	cont "with you!"
	done

.DawnFewMonText:
	text "…Um…"

	para "I think you'd feel"
	line "a lot safer if you"
	cont "were to catch some"
	cont "more."

	para "You know, like"
	line "when you need to"
	cont "travel to"
	cont "faraway places."
	done

.LucasFewMonText:
	text "Huh? I think you"
	line "should catch some"
	cont "more."

	para "It might be more"
	line "of a challenge"
	cont "raising a lot of"
	cont "#MON…"

	para "But it's worth it."
	line "The more #MON"
	cont "you have, the"
	cont "happier you'll be."
	done

.DawnLearnMoreText:
	text "Oh, I know! Don't"
	line "you think it's good"
	cont "to know more about"
	cont "#MON?"

	para "Sure it is! I know"
	line "just the place."

	para "Come on! Don't be"
	line "shy. Follow me!"
	done

.LucasLearnMoreText:
	text "Hey, that's right!"
	line "Don't you think it's"
	cont "better to know a"
	cont "lot about #MON?"

	para "Sure it is! There's"
	line "this great place"
	cont "for that."

	para "Come on! It's all"
	line "right. Follow me."
	done

.DawnThatGuyText:
	text "DAWN: That man…"
	line "What is he doing?"
	done

.LucasThatGuyText:
	text "LUCAS: That guy…"
	line "What's he doing?"
	done

.DawnExcuseMeText:
	text "DAWN: Um…"
	done

.LucasExcuseMeText:
	text "LUCAS: Uh, excuse…"
	done

.LookerWhatText:
	text "WHAAAT?!"
	done

.HowDidYouKnowText:
	text "MYSTERIOUS MAN:"
	line "…How did you know?"

	para "How did you unmask"
	line "me as a member of"
	cont "the INTERNATIONAL"
	cont "POLICE?!"
	done

.DawnSmallTalkText:
	text "DAWN: Huh? What? I"
	line "beg your pardon?"

	para "I was just making"
	line "conversation…"
	done

.LucasSmallTalkText:
	text "LUCAS: Huh? What?"
	line "Are you kidding?"

	para "I was just making"
	line "small talk…"
	done

.KnowBetterText:
	text "SHADY MAN: …Heh."
	line "You claim you were"
	cont "only making conv-"
	cont "ersation, do you?"

	para "But, I know better"
	line "not to believe"
	cont "that."
	cont "No, no, no."

	para "You recognized me"
	line "right away that I"
	cont "was someone"
	cont "extraordinary."

	para "That is why you"
	line "spoke to me, no?"

	para "Your power of"
	line "observation is"
	cont "fearsome!"

	para "Quite admirable,"
	line "you are!"
	done

.CoverBlownText:
	text "Now that my cover"
	line "has been blown,"
	cont "let me introduce"
	cont "myself."

	para "I am an elite"
	line "globe-trotting"
	cont "member of the"
	cont "INTERNATIONAL"
	cont "POLICE."

	para "My name… Ah, no, I"
	line "shall inform you"
	cont "only of my code"
	cont "name."

	para "My code name, it"
	line "is LOOKER. It is"
	cont "what they all call"
	cont "me."

	para "Incidentally, is"
	line "the saying, “Don't"
	cont "be a thief!”"
	cont "familiar to you?"
	done

.DontKnowText:
	text "LOOKER: No? You"
	line "claim to not know?"

	para "How could that be?"

	para "Perhaps your mama"
	line "has said it, but"
	cont "you have forgotten"
	cont "it, like usual?"

	para "Now listen, my"
	line "friends. It is"
	cont "wrong to take what"
	cont "belongs to others."
	done

.StealingIsWrongText:
	text "LOOKER: Yes, that"
	line "is correct."

	para "Taking that which"
	line "belongs to others"
	cont "is wrong."
	done

.ThievesAmongUsText:
	text "Unfortunately,"
	line "there are some who"
	cont "do not heed those"
	cont "words."

	para "In fact, here in"
	line "SINNOH, there are"
	cont "criminals stealing"
	cont "the #MON of"
	cont "others."

	para "I have, therefore,"
	line "been on the look-"
	cont "out for characters"
	cont "arousing my sus-"
	cont "picion."

	para "Incidentally, you"
	line "are TRAINERS, yes?"

	para "Perhaps you can"
	line "make use of this?"
	done

.VsRecorderText:
	text "That VS.RECORDER,"
	line "is is a nifty dev-"
	cont "ice for recording"
	cont "a match."

	para "I obtained it"
	line "because it is"
	cont "quite popular"
	cont "these days."

	para "But myself, I do"
	line "not do #MON"
	cont "battling often."

	para "It will be in"
	line "better hands with"
	cont "you."
	done

.HaveARequestText:
	text "LOOKER: Also, I"
	line "have a request."

	para "If you were to see"
	line "me again, I ask"
	cont "that you not talk"
	cont "to me, for I am on"
	cont "duty."

	para "…Actually, yes,"
	line "yes, you may speak"
	cont "to me. You must."

	para "Not because I am"
	line "lonely, no, no!"

	para "You must inform me"
	line "of bad guys!"
	cont "You must inform me"
	cont "of any happenings!"
	done

.DawnSoundsHardText:
	text "DAWN: …Working for"
	line "the INTERNATIONAL"
	cont "POLICE must be"
	cont "hard."
	done

.LucasSoundsHardText:
	text "LUCAS: Working for"
	line "the INTERNATIONAL"
	cont "POLICE sounds"
	cont "hard."
	done

.DawnSchoolText:
	text "<PLAYER>, here it"
	line "is. It's the"
	cont "TRAINER'S SCHOOL."

	para "The name says"
	line "it all!"
	done

.LucasSchoolText:
	text "<PLAYER>, here we"
	line "are. This is the"
	cont "TRAINER'S SCHOOL."

	para "The name says it"
	line "all!"
	done

.DawnYourPalText:
	text "I saw your friend"
	line "<RIVAL> go in"
	cont "earlier."

	para "He could still be"
	line "in there studying."

	para "OK, bye now!"
	done

.LucasYourPalText:
	text "Your pal <RIVAL>"
	line "went in earlier."

	para "He might still be"
	line "studying in there."

	para "OK, see you"
	line "around!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovement1
	dw .ApproachPlayerMovement2
	dw .ApproachPlayerMovement3
	dw .ApproachPlayerMovement4

.FollowMovement:
	dw .FollowMovement1
	dw .FollowMovement2
	dw .FollowMovement3
	dw .FollowMovement4

.EnterMovement:
	step DOWN
	step DOWN
	step_end

.ApproachPlayerMovement1:
	step DOWN
	step LEFT
	step DOWN
	step_end

.ApproachPlayerMovement2:
	step DOWN
	step DOWN
	step_end

.ApproachPlayerMovement3:
	step DOWN
	step RIGHT
	step DOWN
	step_end

.ApproachPlayerMovement4:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

.FollowMovement1:
	step UP
	step RIGHT
REPT 10
	step UP
ENDR
	step_end

.FollowMovement2:
REPT 11
	step UP
ENDR
	step_end

.FollowMovement3:
	step UP
	step LEFT
REPT 10
	step UP
ENDR
	step_end

.FollowMovement4:
	step UP
	step LEFT
	step LEFT
REPT 10
	step UP
ENDR
	step_end

.LookerMovement:
	slow_step LEFT
	slow_step LEFT
	step LEFT
	step DOWN
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	remove_fixed_facing
	step_end

.PlayerToLookerMovement:
	step RIGHT
.ToLookerMovement:
.FinishFollowMovement:
	step UP
	step_end

.LookerExitMovement:
	slow_step RIGHT
	slow_step UP
	step RIGHT
	step RIGHT
	step_sleep 8
	big_step UP
	big_step LEFT
	big_step UP
	big_step UP
	step_end

.MoveToSchoolMovement:
	step DOWN
	step LEFT
	step LEFT
	step_end

.DawnLucasLeaveMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

JubilifeCity_MapNameSignScript:
	jumptext .Text
.Text:
	text "JUBILIFE CITY"
	line "City of Joy"
	done

JubilifeCity_LookerScript:
	faceplayer
	checkevent EVENT_GAVE_PARCEL_TO_RIVAL
	iftrue .Poketch
	jumptext .SchoolText

.Poketch:
	jumptext .PoketchText

.SchoolText:
	text "Ah, it is you!"

	para "Have no fear."
	line "There are no shady"
	cont "characters about."

	para "Incidentally, have"
	line "you visited the"
	cont "TRAINER'S SCHOOL?"

	para "Did your friend"
	line "not guide you"
	cont "there earlier?"
	done

.PoketchText:
	text "Ah, it is you!"

	para "Have no fear."
	line "There are no shady"
	cont "characters about."

	para "Incidentally, have"
	line "you not obtained"
	cont "a #TCH?"

	para "I believe a"
	line "#TCH is now"
	cont "free in exchange"
	cont "for some COUPONS?"
	done

JubilifeCity_GlobalTerminalGuardScript:
	faceplayer
	readvar VAR_BADGES
	ifequal 0, .NoBadges
	jumptext .GlobalTerminalText

.NoBadges:
	jumptext .NoBadgesText

.GlobalTerminalText: ; change this text
	text "Past here is the"
	line "GLOBAL TERMINAL."

	para "It lets you trade"
	line "with the whole"
	cont "world!"

	para "Trading #MON"
	line "means connecting"
	cont "with friends, both"
	cont "old and new."

	para "That's awesome!"
	done

.NoBadgesText: ; change this text
	text "Past here is the"
	line "GLOBAL TERMINAL,"
	cont "your gateway to"
	cont "the world!"

	para "Oh, you don't have"
	line "any GYM BADGES."

	para "Sorry, but the"
	line "GLOBAL TERMINAL is"
	cont "off-limits if you"
	cont "don't have a"
	cont "GYM BADGE."
	done

JubilifeCity_SchoolGuyScript:
	faceplayer
	opentext
	writetext .KnowMuchText
	yesorno
	iffalse .SaidNo
	writetext .KnowledgeableText
	waitbutton
	closetext
	end

.SaidNo:
	writetext .NotKnowledgeableText
	waitbutton
	closetext
	end

.KnowMuchText:
	text "Hello, TRAINER!"

	para "Do you know much"
	line "about #MON?"
	done

.KnowledgeableText:
	text "Ah, I see! You are"
	line "knowledgeable!"

	para "I imagine that you"
	line "wouldn't need to"
	cont "visit the"
	cont "TRAINER'S SCHOOL,"
	cont "then."

	para "But do visit it if"
	line "you have the time."

	para "You may discover"
	line "something new!"
	done

.NotKnowledgeableText:
	text "Oh, you're not"
	line "knowledgeable…"

	para "But not to worry!"
	line "There's the"
	cont "TRAINER'S SCHOOL."

	para "The SCHOOL will"
	line "teach you the"
	cont "basics of #MON."
	done

JubilifeCity_TradeKidLScript:
	jumptextfaceplayer .Text
.Text:
	text "I'm trading #MON"
	line "with my buddy!"
	done

JubilifeCity_TradeKidRScript:
	jumptextfaceplayer .Text
.Text:
	text "I made my #MON"
	line "hold an item"
	cont "before trading it."

	para "That will make the"
	line "other TRAINER"
	cont "happy!"
	done

JubilifeCity_SixBallsKidScript:
	jumptextfaceplayer .Text
.Text:
	text "OK, set six"
	line "# BALLS in my"
	cont "belt…"

	para "Yeah, that'll do"
	line "it. At most, you"
	cont "can have six"
	cont "#MON with you."
	done

JubilifeCity_CarvedOutManScript:
	faceplayer
	jumptext .CarvedOutText

.CarvedOutText:
	text "JUBILIFE CITY's"
	line "built on land they"
	cont "carved out of a"
	cont "mountain."

	para "The people and"
	line "#MON of"
	cont "OREBURGH CITY"
	cont "helped out with"
	cont "that undertaking."
	done

JubilifeCity_CultureShockGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Hiya, where'd you"
	line "come from?"

	para "…"

	para "TWINLEAF TOWN,"
	line "huh…"

	para "It's a nice place."
	line "Quiet and all."

	para "JUBILIFE CITY is a"
	line "big place, so it"
	cont "might be a bit of"
	cont "a shock to you."
	done

JubilifeCity_HappinessLadyScript:
	jumptextfaceplayer .Text
.Text:
	text "When you walk with"
	line "your #MON, they"
	cont "grow friendlier."
	done

JubilifeCity_GroupGuyScript:
JubilifeCity_InterviewGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "Did you see me on"
	line "TV? I was in an"
	cont "interview!"
	done

JubilifeCity_Clown1Script:
	faceplayer
	checkevent EVENT_GAVE_PARCEL_TO_RIVAL
	iftrue .DoQuiz
	jumptext .StickAroundText

.DoQuiz:
	opentext
	checkevent EVENT_GOT_POKETCH_COUPON_3
	iftrue .DoAnswer
	writetext .QuestionText
	yesorno
	iftrue .Correct
	playsound SFX_WRONG
	writetext .WrongText
	waitsfx
.Done:
	waitbutton
	closetext
	end

.Correct:
	playsound SFX_ELEVATOR_END
	writetext .RightText
	waitsfx
	buttonsound
.DoAnswer:
	writetext .AnswerText
	checkevent EVENT_GOT_POKETCH_COUPON_3
	iftrue .Done
	buttonsound
	writetext .CouponText
	waitbutton
	verbosegiveitem COUPON
	setevent EVENT_GOT_POKETCH_COUPON_3
	closetext
	end

.StickAroundText:
	text "Hi there. You"
	line "should stick"
	cont "around."

	para "We're doing a"
	line "#TCH campaign"
	cont "soon."

	para "Before it starts,"
	line "I think you should"
	cont "brush up at the"
	cont "TRAINER'S SCHOOL."
	done

.QuestionText:
	text "Hi! I'm a #TCH"
	line "campaign clown!"

	para "Let's roll out my"
	line "question!"

	para "Can a #MON hold"
	line "an item?"
	done

.WrongText:
	text "Bzzzzt! That's the"
	line "wrong answer…"
	done

.RightText:
	text "Ding-ding! You're"
	line "absolutely right!"
	done

.AnswerText:
	text "A #MON may hold"
	line "a single item."

	para "Some items become"
	line "effective as soon"
	cont "as they are held"
	cont "by a #MON."

	para "BERRIES are eaten"
	line "by #MON as"
	cont "necessary during"
	cont "battle."
	done

.CouponText:
	text "Here you go! Your"
	line "#TCH COUPON!"
	done

JubilifeCity_Clown2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_POKETCH_COUPON_1
	iftrue .DoAnswer
	writetext .QuestionText
	yesorno
	iftrue .Correct
	playsound SFX_WRONG
	writetext .WrongText
	waitsfx
.Done:
	waitbutton
	closetext
	end

.Correct:
	playsound SFX_ELEVATOR_END
	writetext .RightText
	waitsfx
	buttonsound
.DoAnswer:
	writetext .AnswerText
	checkevent EVENT_GOT_POKETCH_COUPON_1
	iftrue .Done
	buttonsound
	writetext .CouponText
	waitbutton
	verbosegiveitem COUPON
	setevent EVENT_GOT_POKETCH_COUPON_1
	closetext
	end

.QuestionText:
	text "Hi! I'm a #TCH"
	line "campaign clown!"

	para "Let's roll out my"
	line "question!"

	para "Does a #MON"
	line "grow by defeating"
	cont "others and gaining"
	cont "EXP. POINTS?"
	done

.WrongText:
	text "Bzzzzt! That's the"
	line "wrong answer…"
	done

.RightText:
	text "Ding-ding! You're"
	line "absolutely right!"
	done

.AnswerText:
	text "#MON grow"
	line "stronger by"
	cont "defeating other"
	cont "#MON in battle."

	para "Some #MON even"
	line "grow into an"
	cont "entirely different"
	cont "form in a process"
	cont "called evolution."
	done

.CouponText:
	text "Here you go! Your"
	line "#TCH COUPON!"
	done

JubilifeCity_Clown3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_POKETCH_COUPON_2
	iftrue .DoAnswer
	writetext .QuestionText
	yesorno
	iftrue .Correct
	playsound SFX_WRONG
	writetext .WrongText
	waitsfx
.Done:
	waitbutton
	closetext
	end

.Correct:
	playsound SFX_ELEVATOR_END
	writetext .RightText
	waitsfx
	buttonsound
.DoAnswer:
	writetext .AnswerText
	checkevent EVENT_GOT_POKETCH_COUPON_2
	iftrue .Done
	buttonsound
	writetext .CouponText
	waitbutton
	verbosegiveitem COUPON
	setevent EVENT_GOT_POKETCH_COUPON_2
	closetext
	end

.QuestionText:
	text "Hi! I'm a #TCH"
	line "campaign clown!"

	para "Let's roll out my"
	line "question!"

	para "Just like #MON"
	line "types, the moves"
	cont "of #MON also"
	cont "have types?"
	done

.WrongText:
	text "Bzzzzt! That's the"
	line "wrong answer…"
	done

.RightText:
	text "Ding-ding! You're"
	line "absolutely right!"
	done

.AnswerText:
	text "If the #MON's"
	line "type matches its"
	cont "move's type, that"
	cont "move is made much"
	cont "more powerful!"
	done

.CouponText:
	text "Here you go! Your"
	line "#TCH COUPON!"
	done

JubilifeCity_SchoolSignScript:
	jumptext .Text
.Text:
	text "TRAINER'S SCHOOL"

	para "The First Step for"
	line "TRAINERS!"
	done

JubilifeCity_CondoSignScript:
	jumptext .Text
.Text:
	text "JUBILIFE"
	line "CONDOMINIUMS"

	para "Tenants wanted"
	done

JubilifeCity_TVBuildingSignScript:
	jumptext .Text
.Text:
	text "JUBILIFE TV"

	para "The Fun-and-Games"
	line "TV Station!"
	done

JubilifeCity_PoketchBuildingSignScript:
	jumptext .Text
.Text:
	text "#TCH COMPANY"

	para "#MON Watches"
	line "for the World"
	done

JubilifeCity_GlobalTerminalSignScript:
	jumptext .Text
.Text:
	text "GLOBAL TERMINAL"

	para "Your Gateway to"
	line "the Whole World!"
	done

JubilifeCity_PMCSignScript:
	jumptext .Text
.Text:
	text "Heal your #MON!"
	line "#MON CENTER"
	done

JubilifeCity_MartSignScript:
	jumptext .Text
.Text:
	text "All Your Item"
	line "Needs Fulfilled!"
	cont "#MON MART"
	done

JubilifeCity_HiddenPotion:
	hiddenitem POTION, EVENT_JUBILIFE_CITY_HIDDEN_POTION

JubilifeCity_GlobalTerminalStopScript:
	turnobject JUBILIFECITY_OBJECT2, DOWN
	opentext
	writetext .CantEnterText
	waitbutton
	closetext
	applymovement PLAYER, .LeaveMovement
	end

.CantEnterText: ; change this text
	text "Past here is the"
	line "GLOBAL TERMINAL,"
	cont "your gateway to"
	cont "the world!"

	para "Oh, you don't have"
	line "any GYM BADGES."

	para "Sorry, but the"
	line "GLOBAL TERMINAL is"
	cont "off-limits if you"
	cont "don't have a"
	cont "GYM BADGE."
	done

.LeaveMovement:
	step RIGHT
	step_end

JubilifeCity_CantLeaveRivalScriptU:
	settableindex 0
	sjump JubilifeCity_CantLeaveRivalScript

JubilifeCity_CantLeaveRivalScriptD:
	settableindex 1
JubilifeCity_CantLeaveRivalScript:
	showemote EMOTE_SHOCK, JUBILIFECITY_LOOKER, 15
	turnobject PLAYER, LEFT
	applymovementtable JUBILIFECITY_LOOKER, .ApproachPlayerMovement
	opentext
	writetext .VisitSchoolText
	waitbutton
	closetext
	follow JUBILIFECITY_LOOKER, PLAYER
	applymovement JUBILIFECITY_LOOKER, .PullBackMovement
	stopfollow
	pause 5
	applymovementtable JUBILIFECITY_LOOKER, .ReturnMovement
	end

.VisitSchoolText:
	text "LOOKER: Hello, my"
	line "friend. Have you"
	cont "visited the"
	cont "TRAINER'S SCHOOL?"

	para "Did your friend"
	line "not guide you"
	cont "there earlier?"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementU
	dw .ApproachPlayerMovementD

.ReturnMovement:
	dw .ReturnMovementU
	dw .ReturnMovementD

.ApproachPlayerMovementU:
	step UP
.ApproachPlayerMovementD:
	step UP
	step RIGHT
	step_end

.PullBackMovement:
	step LEFT
	turn_head RIGHT
	step_end

.ReturnMovementU:
	step DOWN
.ReturnMovementD:
	step DOWN
	turn_head UP
	step_end

JubilifeCity_CantLeavePoketchScriptU:
	settableindex 0
	sjump JubilifeCity_CantLeavePoketchScript

JubilifeCity_CantLeavePoketchScriptD:
	settableindex 1
JubilifeCity_CantLeavePoketchScript:
	showemote EMOTE_SHOCK, JUBILIFECITY_LOOKER, 15
	turnobject PLAYER, LEFT
	applymovementtable JUBILIFECITY_LOOKER, .ApproachPlayerMovement
	opentext
	writetext .GetPoketchText
	waitbutton
	closetext
	follow JUBILIFECITY_LOOKER, PLAYER
	applymovement JUBILIFECITY_LOOKER, .PullBackMovement
	stopfollow
	pause 5
	applymovementtable JUBILIFECITY_LOOKER, .ReturnMovement
	end

.GetPoketchText:
	text "LOOKER: Tell me,"
	line "have you not yet"
	cont "obtained a"
	cont "#TCH?"

	para "I believe a"
	line "#TCH is now"
	cont "free in exchange"
	cont "for some COUPONS?"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementU
	dw .ApproachPlayerMovementD

.ReturnMovement:
	dw .ReturnMovementU
	dw .ReturnMovementD

.ApproachPlayerMovementU:
	step UP
.ApproachPlayerMovementD:
	step UP
	step RIGHT
	step_end

.PullBackMovement:
	step LEFT
	turn_head RIGHT
	step_end

.ReturnMovementU:
	step DOWN
.ReturnMovementD:
	step DOWN
	turn_head UP
	step_end

JubilifeCity_StartPoketchScript1:
	settableindex 0
	sjump JubilifeCity_StartPoketchScript

JubilifeCity_StartPoketchScript2:
	settableindex 1
	sjump JubilifeCity_StartPoketchScript

JubilifeCity_StartPoketchScript3:
	settableindex 2
	sjump JubilifeCity_StartPoketchScript

JubilifeCity_StartPoketchScript4:
	settableindex 3
JubilifeCity_StartPoketchScript:
	showemote EMOTE_SHOCK, JUBILIFECITY_DAWNLUCAS_PRES, 15
	applymovementtable JUBILIFECITY_DAWNLUCAS_PRES, .ApproachPlayerMovement
	opentext
	writetext .HaveNoPoketchText
	buttonsound
	writetext .IInventedText
	waitbutton
	closetext
	setscene SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH
	end

.HaveNoPoketchText:
	text "Oh, oh, oh?"

	para "You call yourself"
	line "a #MON TRAINER?"

	para "And yet you have"
	line "no #TCH?"

	para "That is,"
	line "#MON WATCH, or"
	cont "#TCH for short!"

	para "Oh my, you are a"
	line "rare case indeed!"
	done

.IInventedText:
	text "You see, I"
	line "invented, and now"
	cont "manufacture,"
	cont "#TCHES."

	para "Not only that, I'm"
	line "now conducting the"
	cont "#TCH promo"
	cont "campaign!"

	para "All you have to do"
	line "is find three"
	cont "clowins in"
	cont "JUBILIFE CITY."

	para "If you can find"
	line "them…"

	para "I will gift you a"
	line "#TCH!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovement1
	dw .ApproachPlayerMovement2
	dw .ApproachPlayerMovement3
	dw .ApproachPlayerMovement4

.ApproachPlayerMovement1:
	step LEFT
.ApproachPlayerMovement2:
	step DOWN
	step_end

.ApproachPlayerMovement4:
	step RIGHT
.ApproachPlayerMovement3:
	step RIGHT
	step DOWN
	step_end

JubilifeCity_PresScript:
	faceplayer
	checkevent EVENT_GOT_POKETCH_COUPON_1
	iffalse .Intro
	checkevent EVENT_GOT_POKETCH_COUPON_2
	iffalse .Intro
	checkevent EVENT_GOT_POKETCH_COUPON_3
	iffalse .Intro
	opentext
	writetext .CountText
	buttonsound
	takeitem COUPON, 3
	writetext .GotPoketchText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
	writetext .AddAppsText
	waitbutton
	closetext
	callstd tableindexfromfacing
	applymovementtable JUBILIFECITY_DAWNLUCAS_PRES, .LeaveMovement
	disappear JUBILIFECITY_DAWNLUCAS_PRES
	setevent EVENT_GOT_POKETCH
	disappear JUBILIFECITY_LOOKER
	setscene SCENE_JUBILIFECITY_NOTHING
	end

.Intro:
	jumptext .IntroText

.CountText:
	text "OK, let me count"
	line "your COUPONS!"

	para "I'll use the"
	line "#TCH here…"

	para "One, two, three!"
	line "Bravo! I say,"
	cont "bravo!"

	para "In return for"
	line "these COUPONS, I"
	cont "present you this"
	cont "#MON WATCH, or"
	cont "#TCH for short!"
	done

.GotPoketchText:
	text "<PLAYER> received"
	line "a #TCH!"
	done

.AddAppsText: ; change this?
	text "You can add apps"
	line "to your #TCH to"
	cont "make it even more"
	cont "versatile!"

	para "Touch the #TCH"
	line "screen and find"
	cont "the apps that are"
	cont "right for you!"
	done

.LeaveMovement:
	dw .LeaveMovement2
	dw .LeaveMovement1
	dw .LeaveMovement1
	dw .LeaveMovement1

.LeaveMovement2:
	step LEFT
	step UP
.LeaveMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

.IntroText:
	text "The three clowns"
	line "will each ask you"
	cont "a skill-testing"
	cont "question."

	para "The questions all"
	line "have to do with"
	cont "#MON."

	para "After all, a"
	line "#TCH is a tool"
	cont "for #MON"
	cont "TRAINERS."

	para "Collect a COUPON"
	line "from each clown,"
	cont "then come see me,"
	cont "OK?"
	done

JubilifeCity_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 33, 13, JUBILIFE_APARTMENT_NE_1F, 1
	warp_event 23, 31, JUBILIFE_APARTMENT_SE_1F, 1
	warp_event  9, 29, JUBILIFE_APARTMENT_SW_1F, 1
	warp_event 31, 25, JUBILIFE_POKEMON_CENTER_1F, 1
	warp_event 31, 19, JUBILIFE_POKEMART, 2
	warp_event 11, 11, POKETCH_COMPANY_1F, 1
	warp_event 14, 11, POKETCH_COMPANY_1F, 3
	warp_event 22, 11, TV_STATION_1F, 1
	warp_event 14, 25, POKEMON_COMMUNICATION_CENTER, 1
	warp_event 20, 23, TRAINERS_SCHOOL, 1
	warp_event  2, 14, JUBILIFE_WEST_GATE, 1
	warp_event  2, 15, JUBILIFE_WEST_GATE, 2

	db 15 ; coord events
	coord_event 26, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript1
	coord_event 27, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript2
	coord_event 28, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript3
	coord_event 29, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript4
	coord_event 37, 14, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, JubilifeCity_CantLeaveRivalScriptU
	coord_event 37, 15, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, JubilifeCity_CantLeaveRivalScriptD
	coord_event 17, 27, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, JubilifeCity_GlobalTerminalStopScript
	coord_event 26, 21, SCENE_JUBILIFECITY_START_POKETCH, JubilifeCity_StartPoketchScript1
	coord_event 27, 21, SCENE_JUBILIFECITY_START_POKETCH, JubilifeCity_StartPoketchScript2
	coord_event 28, 21, SCENE_JUBILIFECITY_START_POKETCH, JubilifeCity_StartPoketchScript3
	coord_event 29, 21, SCENE_JUBILIFECITY_START_POKETCH, JubilifeCity_StartPoketchScript4
	coord_event 17, 27, SCENE_JUBILIFECITY_START_POKETCH, JubilifeCity_GlobalTerminalStopScript
	coord_event 37, 14, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, JubilifeCity_CantLeavePoketchScriptU
	coord_event 37, 15, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, JubilifeCity_CantLeavePoketchScriptD
	coord_event 17, 27, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, JubilifeCity_GlobalTerminalStopScript

	db 12 ; bg events
	bg_event 31, 31, BGEVENT_READ, JubilifeCity_MapNameSignScript
	bg_event 36, 13, BGEVENT_READ, JubilifeCity_MapNameSignScript
	bg_event 30,  8, BGEVENT_READ, JubilifeCity_MapNameSignScript
	bg_event  5, 13, BGEVENT_READ, JubilifeCity_MapNameSignScript
	bg_event 24, 22, BGEVENT_READ, JubilifeCity_SchoolSignScript
	bg_event 30, 12, BGEVENT_READ, JubilifeCity_CondoSignScript
	bg_event 24, 12, BGEVENT_READ, JubilifeCity_TVBuildingSignScript
	bg_event 10, 12, BGEVENT_READ, JubilifeCity_PoketchBuildingSignScript
	bg_event 13, 27, BGEVENT_READ, JubilifeCity_GlobalTerminalSignScript
	bg_event 32, 25, BGEVENT_READ, JubilifeCity_PMCSignScript
	bg_event 32, 19, BGEVENT_READ, JubilifeCity_MartSignScript
	bg_event 11, 16, BGEVENT_ITEM, JubilifeCity_HiddenPotion

	db 15 ; object events
	object_event 27, 32, SPRITE_DAWN_LUCAS2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_PresScript, EVENT_JUBILIFE_CITY_DAWNLUCAS
	object_event 35, 16, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, JubilifeCity_LookerScript, EVENT_JUBILIFE_CITY_LOOKER
	object_event 17, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_GlobalTerminalGuardScript, -1
	object_event 21, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_SchoolGuyScript, -1
	object_event 31, 28, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_TradeKidLScript, -1
	object_event 32, 28, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_TradeKidRScript, -1
	object_event 29, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_SixBallsKidScript, -1
	object_event 24, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_CarvedOutManScript, -1
	object_event 28, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_CultureShockGuyScript, -1
	object_event 13, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_HappinessLadyScript, -1
	object_event 22, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_GroupGuyScript, -1
	object_event 19, 13, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_InterviewGirlScript, -1
	object_event 22, 12, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_Clown1Script, -1
	object_event 33, 20, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_Clown2Script, EVENT_JUBILIFE_CITY_CLOWNS
	object_event  9, 13, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeCity_Clown3Script, EVENT_JUBILIFE_CITY_CLOWNS
