	object_const_def ; object_event constants
	const ROUTE201_RIVAL
	const ROUTE201_ROWAN
	const ROUTE201_OBJECT2
	const ROUTE201_OBJECT3
	const ROUTE201_OBJECT4
	const ROUTE201_OBJECT5
	const ROUTE201_OBJECT6
	const ROUTE201_OBJECT7

Route201_MapScripts:
	db 5 ; scene scripts
	scene_script .Dummy ; SCENE_ROUTE201_FIND_RIVAL
	scene_script .Dummy ; SCENE_ROUTE201_CANT_LEAVE
	scene_script .Dummy ; SCENE_ROUTE201_NOTHING
	scene_script .Dummy ; SCENE_ROUTE201_FIND_RIVAL_2
	scene_script .Dummy ; SCENE_ROUTE201_RIVAL_FOLLOW

	db 0 ; callbacks

.Dummy:
	end

Route201_GetStarterScriptL:
	settableindex 0
	sjump Route201_GetStarterScript

Route201_GetStarterScriptR:
	settableindex 1
Route201_GetStarterScript:
	opentext
	writetext .TooSlowText
	waitbutton
	closetext
	applymovementtable ROUTE201_RIVAL, .ApproachPlayerMovement
	opentext
	writetext .LetsGetMovingText
	waitbutton
	closetext
	follow ROUTE201_RIVAL, PLAYER
	applymovementtable ROUTE201_RIVAL, .FollowToGrassMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext .DontGoIntroGrassText
	buttonsound
	writetext .GoFastText
	waitbutton
	closetext
	applymovement ROUTE201_RIVAL, .RivalBackUpMovement
	opentext
	writetext .HereGoesText
	waitbutton
	closetext
	applymovement ROUTE201_RIVAL, .RivalRunToGrassMovement
	opentext
	writetext .HoldItText
	closetext
	turnobject ROUTE201_RIVAL, LEFT
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	appear ROUTE201_ROWAN
	playmusic MUSIC_PROF_ELM
	applymovement ROUTE201_ROWAN, .RowanApproachMovement
	opentext
	writetext .NoPokemonText
	buttonsound
	writetext .RivalPauseText
	buttonsound
	writetext .ProfPauseText
	waitbutton
	turnobject ROUTE201_RIVAL, DOWN
	writetext .ThisIsRowanText
	waitbutton
	closetext
	turnobject ROUTE201_RIVAL, LEFT
	applymovement ROUTE201_ROWAN, .RowanWalkAwayMovement
	opentext
	writetext .WantedMonText
	waitbutton
	closetext
	applymovement ROUTE201_ROWAN, .RowanComeBackMovement
	opentext
.YesNoLoop1:
	writetext .LoveMonText
	yesorno
	iftrue .SaidYes1
	turnobject ROUTE201_RIVAL, DOWN
	writetext .NotMakingSenseText
	waitbutton
	turnobject ROUTE201_RIVAL, LEFT
	writetext .AskAgainText
	waitbutton
	sjump .YesNoLoop1

.SaidYes1:
	writetext .RivalLoveMonTooText
	buttonsound
	writetext .AskOnceAgainText
	buttonsound
.YesNoLoop2:
	writetext .AskAHundredTimesText
	buttonsound
	turnobject ROUTE201_RIVAL, DOWN
	writetext .RightPlayerText
	yesorno
	iftrue .SaidYes2
	writetext .GettingOldText
	buttonsound
	turnobject ROUTE201_RIVAL, LEFT
	sjump .YesNoLoop2

.SaidYes2:
	writetext .RecklessKidsText
	waitbutton
	turnobject ROUTE201_RIVAL, LEFT
	turnobject PLAYER, LEFT
	writetext .RivalStammerText
	buttonsound
	writetext .RowanGiveMonText
	waitbutton
	closetext
	turnobject ROUTE201_ROWAN, LEFT
	pause 30
	turnobject ROUTE201_ROWAN, RIGHT
	pause 30
	appear ROUTE201_OBJECT2
	playmusic MUSIC_RIVAL_ENCOUNTER ; dawnlucas encounter
	applymovement ROUTE201_OBJECT2, .DawnLucasApproachMovement
	opentext
	writetextgender .DawnText1, .LucasText1
	waitbutton
	turnobject ROUTE201_OBJECT2, DOWN
	pause 15
	appear ROUTE201_OBJECT3
	pause 15
	turnobject ROUTE201_OBJECT2, RIGHT
	turnobject ROUTE201_ROWAN, LEFT
	writetextgender .RowanTalkToDawnText, .RowanTalkToLucasText
	buttonsound
	writetextgender .DawnText2, .LucasText2
	buttonsound
	writetext .SideBySideText
	waitbutton
	turnobject ROUTE201_ROWAN, RIGHT
	writetext .OpenBriefcaseText
	waitbutton
	writetext .RivalReallyText
	waitbutton
	turnobject ROUTE201_RIVAL, DOWN
	writetext .YouChooseFirstText
	waitbutton
	special RestartMapMusic
	setscene SCENE_ROUTE201_CANT_LEAVE
	closetext
	end

.TooSlowText:
	text "Too slow!"
	done

.LetsGetMovingText:
	text "<RIVAL>: OK! Let's"
	line "get moving to"
	cont "PROF.ROWAN's lab!"
	done

.DontGoIntroGrassText:
	text "<RIVAL>:…"
	line "…"

	para "What? Don't go into"
	line "the grass, right?"

	para "No worries! No"
	line "problem! It doesn't"
	cont "matter that we"
	cont "don't have any"
	cont "#MON. I've got"
	cont "an idea."

	para "You know how wild"
	line "#MON jump out"
	cont "when you go into"
	cont "tall grass?"
	done

.GoFastText:
	text "So, what you do is"
	line "you scoot over to"
	cont "the next patch of"
	cont "grass before any"
	cont "wild #MON can"
	cont "appear!"

	para "If we just keep on"
	line "dashing we can get"
	cont "to SANDGEM TOWN"
	cont "without running"
	cont "into wild #MON!"

	para "OK, stick with me!"
	done

.HereGoesText:
	text "OK, here goes!"

	para "On your marks…"
	done

.HoldItText:
	text_big "Hold it!@"

.NoPokemonText:
	text "PROFESSOR: You two"
	line "don't seem to have"
	cont "any #MON?"

	para "Then, what is the"
	line "meaning of going"
	cont "into the tall"
	cont "grass?"
	done

.RivalPauseText:
	text "<RIVAL>: …"
	line "…"
	done

.ProfPauseText:
	text "PROFESSOR:…"
	line "…"

	para "…"
	line "…"
	done

.ThisIsRowanText:
	text "<RIVAL>: Hey,"
	line "<PLAYER>. This old"
	cont "guy…"

	para "It's PROF.ROWAN,"
	line "isn't it? What's he"
	cont "doing here?"
	done

.WantedMonText:
	text "PROFESSOR:…"
	line "…"

	para "They tried to go"
	line "into the tall"
	cont "grass because they"
	cont "wanted #MON…"

	para "Hmm…"
	line "What to do…?"

	para "Their world would"
	line "surely change if"
	cont "they were to meet"
	cont "#MON…"

	para "Is it right for me"
	line "to put them on"
	cont "that path?"
	done

.LoveMonText:
	text "You two."
	line "You truly love"
	cont "#MON, do you?"
	done

.NotMakingSenseText:
	text "<RIVAL>: Whoa,"
	line "hold up!"

	para "You're not making"
	line "any sense here!"
	done

.AskAgainText:
	text "PROFESSOR: Er-hem!"

	para "I didn't catch that"
	line "so I will ask you"
	cont "again."
	done

.RivalLoveMonTooText:
	text "<RIVAL>: Me, too!"
	line "I love #MON,"
	cont "too!"
	done

.AskOnceAgainText:
	text "PROFESSOR: I will"
	line "ask once again."

	para "You two."
	line "You truly love"
	cont "#MON, do you?"
	done

.AskAHundredTimesText:
	text "<RIVAL>: What?!"
	line "You can ask us a"
	cont "hundred times!"

	para "The answer will"
	line "never change!"

	para "We'll both answer a"
	line "hundred times, we"
	cont "love #MON!"
	done

.RightPlayerText:
	text "Right, <PLAYER>?"
	done

.GettingOldText:
	text "<RIVAL>:…"
	line "That joke's getting"
	cont "old!"
	done

.RecklessKidsText:
	text "PROFESSOR: A pair"
	line "of reckelss kids"
	cont "who foolishly try"
	cont "to enter tall"
	cont "grass without"
	cont "#MON of their"
	cont "own…"

	para "It worries me what"
	line "people like that"
	cont "would do with"
	cont "#MON."
	done

.RivalStammerText:
	text "<RIVAL>:…Uh…"
	line "Well, I, uh…"

	para "…"
	line "…"

	para "Well, then forget"
	line "about me, but give"
	cont "a #MON to my"
	cont "friend here!"

	para "I mean, it was me"
	line "who tried to go"
	cont "into the tall"
	cont "grass and all…"
	done

.RowanGiveMonText:
	text "PROFESSOR: !"

	para "How big of you…"

	para "Very well, then! I"
	line "will entrust you"
	cont "two with #MON!"

	para "I apologize for"
	line "putting the two of"
	cont "you through that"
	cont "excercise."

	para "However!"

	para "You must promise"
	line "me that you will"
	cont "never recklessly"
	cont "endanger yours-"
	cont "elves again."

	para "Now, then…"

	para "Hm?"
	line "Now, where…?"
	done

.DawnText1:
	text "DAWN: PROF.ROWAN."

	para "You left your"
	line "briefcase at the"
	cont "lake!"

	para "Oh? Is something"
	line "wrong here?"
	done

.LucasText1:
	text "LUCAS: PROF.ROWAN!"
	line "You left your"
	cont "briefcase behind"
	cont "at the lake."

	para "Is something wrong"
	line "here?"
	done

.RowanTalkToDawnText:
	text "ROWAN: Ah! There"
	line "it is! DAWN, nice"
	cont "work."

	para "I was just about"
	line "to entrust these"
	cont "two with their own"
	cont "#MON."
	done

.RowanTalkToLucasText:
	text "ROWAN: Ah! There"
	line "it is! LUCAS, nice"
	cont "work."

	para "I was just about"
	line "to entrust these"
	cont "two with their own"
	cont "#MON."
	done

.DawnText2:
	text "DAWN: Pardon?!"

	para "Those #MON are"
	line "hard to replace."
	cont "Are you sure about"
	cont "giving them away?"
	done

.LucasText2:
	text "LUCAS: Wha…?!"

	para "Those #MON are"
	line "crucial. You're"
	cont "giving them away?"
	done

.SideBySideText:
	text "ROWAN: Hm!"

	para "We exist side by"
	line "side with #MON."

	para "There comes a time"
	line "when people should"
	cont "meet #MON."

	para "There is a world"
	line "that should be"
	cont "explored together."

	para "For them, today is"
	line "that time. The"
	cont "place, right here."
	done

.OpenBriefcaseText:
	text "ROWAN: Go on! Open"
	line "the briefcase and"
	cont "choose a #MON!"
	done

.RivalReallyText:
	text "<RIVAL>: Really?!"
	line "PROF.ROWAN!"

	para "I can't believe it!"
	line "I'm so happy now"
	cont "that I can't keep a"
	cont "straight face!"
	done

.YouChooseFirstText:
	text "Hey, <PLAYER>. You"
	line "can choose first."

	para "Hey, I'm pretty"
	line "much a grown-up."
	cont "I have to show"
	cont "some class here."
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementLeft
	dw .ApproachPlayerMovementRight

.FollowToGrassMovement:
	dw .FollowToGrassMovementLeft
	dw .FollowToGrassMovementRight

.ApproachPlayerMovementRight:
	step RIGHT
.ApproachPlayerMovementLeft:
	step DOWN
	step DOWN
	step_end

.FollowToGrassMovementLeft:
	step UP
	step RIGHT
	step RIGHT
	step UP
	turn_head RIGHT
	step_end

.FollowToGrassMovementRight:
	step UP
	step RIGHT
	step UP
	turn_head RIGHT
	step_end

.RivalBackUpMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

.RivalRunToGrassMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

.RowanApproachMovement:
	step RIGHT
.DawnLucasApproachMovement:
	step RIGHT
.RowanComeBackMovement:
	step RIGHT
	step RIGHT
	step_end

.RowanWalkAwayMovement:
	step LEFT
	step LEFT
	step_end

Route201_CantLeaveScript1:
	opentext
	writetext Route201_CantLeaveText
	waitbutton
	closetext
	applymovement PLAYER, .LeftMovement
	end

.LeftMovement:
	step LEFT
	step_end

Route201_CantLeaveScript2:
	opentext
	writetext Route201_CantLeaveText
	waitbutton
	closetext
	applymovement PLAYER, .UpMovement
	end

.UpMovement:
	step UP
	step_end

Route201_CantLeaveText:
	text "<RIVAL>: What's up"
	line "with you? Open up"
	cont "the briefcase and"
	cont "pick a #MON!"
	done

Route201_RivalScript:
	faceplayer
	checkevent EVENT_RIVAL_FOLLOWING_PLAYER
	iftrue .Following
	jumptext .AdultText

.Following:
	jumptext .ThatBattleText

.AdultText:
	text "Hey, <PLAYER>. You"
	line "can choose first."
	cont "Go ahead."

	para "You know, like, I'm"
	line "gonna be a man"
	cont "about it. Yeah, I'm"
	cont "slick."
	done

.ThatBattleText:
	text "<RIVAL>: That"
	line "#MON battle…"

	para "Wasn't that wicked"
	line "fun or what?"

	para "I mean, I'd pick"
	line "the moves, and my"
	cont "#MON would use"
	cont "them!"

	para "Yeah, I'm going to"
	line "battle tons and"
	cont "get real close"
	cont "with #MON."
	done

Route201_RowanScript:
	jumptextfaceplayer .ChooseMonText

.ChooseMonText:
	text "ROWAN: Go on! Open"
	line "the briefcase and"
	cont "choose a #MON!"
	done

Route201_BriefcaseScript:
	scall Route201_StarterMenu
	setevent EVENT_GOT_STARTER
	disappear ROUTE201_OBJECT3
	opentext
	writetext .IllChooseThisText
	buttonsound
	writetext .ChosenGoodMonsText
	buttonsound
	writetext .InMyLabText
	waitbutton
	closetext
	applymovement ROUTE201_RIVAL, .RivalOutOfTheWayMovement
	applymovement ROUTE201_ROWAN, .RowanLeaveMovement
	disappear ROUTE201_ROWAN
	opentext
	writetextgender .WaitForMeDawnText, .WaitForMeLucasText
	waitbutton
	closetext
	applymovement ROUTE201_OBJECT2, .WalkStepMovement
	opentext
	writetextgender .ExcuseMeDawnText, .ExcuseMeLucasText
	waitbutton
	closetext
	applymovement ROUTE201_OBJECT2, .DawnLucasLeaveMovement
	disappear ROUTE201_OBJECT2
	opentext
	writetext .ReallyNiceText
	waitbutton
	closetext
	pause 30
	turnobject ROUTE201_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
.YesNoLoop:
	writetext .LetsBattleText
	yesorno
	iftrue .SaidYes
	writetext .DontBeThatWayText
	buttonsound
	sjump .YesNoLoop

.SaidYes:
	writetext .ChallengeYouText
	waitbutton
	closetext
	callstd tableindexfromstarter
	winlosstext .WinText, .LossText
	loadtrainertable .RivalTrainerTable
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .WonBattle
	opentext
	writetext .WonBattleText
	sjump .Join

.WonBattle:
	opentext
	writetext .LostBattleText
.Join:
	special HealParty
	waitbutton
	setscene SCENE_ROUTE201_NOTHING
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	setmapscene PLAYERS_HOUSE_1F, SCENE_PLAYERSHOUSE1F_AFTER_RIVAL1
	warpfacing RIGHT, PLAYERS_HOUSE_1F, 4, 4
	end

.RivalTrainerTable:
	db RIVAL1, RIVAL1_1_CHIMCHAR
	db RIVAL1, RIVAL1_1_PIPLUP
	db RIVAL1, RIVAL1_1_TURTWIG

.IllChooseThisText:
	text "<RIVAL>: Then, I"
	line "choose you!"

	para "I'm picking this"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

.ChosenGoodMonsText:
	text "ROWAN: Very well!"
	line "Both of you have"
	cont "chosen a good"
	cont "#MON, it seems."

	para "Now, listen well!"

	para "The #MON you've"
	line "been entrusted"
	cont "with are quite"
	cont "unfamiliar with"
	cont "the world."

	para "In that regard,"
	line "they're like you."

	para "As fellow newcom-"
	line "ers to the world,"
	cont "I hope you'll do"
	cont "well together."
	done

.InMyLabText:
	text "If you have any"
	line "trouble, come see"
	cont "me at my lab in"
	cont "SANDGEM TOWN."

	para "And now, we'll be"
	line "on our way."
	done

.WaitForMeDawnText:
	text "DAWN: PROFESSOR!"
	line "Please wait up!"
	done

.WaitForMeLucasText:
	text "LUCAS: PROFESSOR!"
	line "Wait for me!"
	done

.ExcuseMeDawnText:
	text "I'm sorry… Please"
	line "let me pass."
	done

.ExcuseMeLucasText:
	text "Uh, sorry, folks."
	done

.ReallyNiceText:
	text "<RIVAL>: How do"
	line "you like that?"

	para "PROF.ROWAN's really"
	line "nice. On TV, he"
	cont "seems so stern and"
	cont "scary."
	done

.LetsBattleText:
	text "Heheh, <PLAYER>!"
	line "We've both got"
	cont "#MON now."

	para "There's only one"
	line "thing to do now,"
	cont "right? Are you up"
	cont "for this?"
	done

.DontBeThatWayText:
	text "<RIVAL>: What's"
	line "with the attitude?"
	cont "Don't be that way!"
	done

.ChallengeYouText:
	text "<RIVAL>: I've"
	line "always wanted to"
	cont "say this…"

	para "Finally, the time"
	line "has come!"

	para "<PLAYER>!"
	line "I challenge you to"
	cont "a battle!"
	done

.LostBattleText:
	text "<RIVAL>: Aha…"
	line "Ahaha… I won?"
	cont "I won!"

	para "But that battle,"
	line "it could've gone"
	cont "either way. It was"
	cont "that close!"

	para "I can tell you one"
	line "thing: battling is"
	cont "awesomely fun!"

	para "OK, let's go home."

	para "I'm beat after that"
	line "battle. My #MON"
	cont "needs rest, too."

	para "See ya, <PLAYER>!"
	done

.WonBattleText:
	text "<RIVAL>: Whew!"
	line "Let's go home."

	para "I'm beat after that"
	line "battle. My #MON"
	cont "needs rest, too."

	para "See ya, <PLAYER>!"
	done

.WinText:
	text "What are you"
	line "saying?! We ended"
	cont "up losing?!"
	done

.LossText:
	text "Wow, what a fight!"
	done

.RivalOutOfTheWayMovement:
	step DOWN
	turn_head UP
	step_end

.RowanLeaveMovement:
.DawnLucasLeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.WalkStepMovement:
	step RIGHT
	step_end

Route201_StarterMenu:
	opentext
	special ChooseStarter
	ifequal 0, .Turtwig
	ifequal 1, .Chimchar
	ifequal 2, .Piplup
	end

.Turtwig:
	givepoke TURTWIG, 5
	setevent EVENT_GOT_TURTWIG
	getmonname STRING_BUFFER_3, CHIMCHAR
	end

.Chimchar:
	givepoke CHIMCHAR, 5
	setevent EVENT_GOT_CHIMCHAR
	getmonname STRING_BUFFER_3, PIPLUP
	end

.Piplup:
	givepoke PIPLUP, 5
	setevent EVENT_GOT_PIPLUP
	getmonname STRING_BUFFER_3, TURTWIG
	end

Route201_RivalFollowScriptL:
	settableindex 0
	sjump Route201_RivalFollowScript

Route201_RivalFollowScriptR:
	settableindex 1
Route201_RivalFollowScript:
	opentext
	writetext .TooSlowText
	waitbutton
	closetext
	applymovementtable ROUTE201_RIVAL, .ApproachPlayerMovement
	opentext
	writetext .NothingToFearText
	waitbutton
	closetext
	follow PLAYER, ROUTE201_RIVAL
	setscene SCENE_ROUTE201_RIVAL_FOLLOW
	setevent EVENT_RIVAL_FOLLOWING_PLAYER
	end

.TooSlowText:
	text "<RIVAL>: Too slow!"
	line "<PLAYER>, I'm sick"
	cont "of waiting!"

	para "I'm going to go see"
	line "PROF.ROWAN, so I"
	cont "can thank him"
	cont "properly."

	para "So, I had this"
	line "great idea. Listen"
	cont "up, OK?"

	para "You know that lake"
	line "where we always"
	cont "play at?"

	para "You know how they"
	line "say a legendary"
	cont "#MON lives"
	cont "there?"

	para "You guessed it!"
	line "Let's catch that"
	cont "#MON."

	para "That'll make PROF."
	line "ROWAN happy. I'm"
	cont "sure of that!"
	done

.NothingToFearText:
	text "<RIVAL>: Me and"
	line "you together, we've"
	cont "got nothing to"
	cont "fear!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovementLeft
	dw .ApproachPlayerMovementRight

.ApproachPlayerMovementRight:
	step RIGHT
.ApproachPlayerMovementLeft:
	step DOWN
	step DOWN
	step_end

Route201_PlayerCantLeaveScript1:
	opentext
	writetext .Text
	waitbutton
	closetext
	applymovement PLAYER, .Movement
	end

.Text:
	text "<RIVAL>: Hehehe,"
	line "<PLAYER>. The lake's"
	cont "not that way!"
	done

.Movement:
	step UP
	step_end

Route201_PlayerCantLeaveScript2:
	opentext
	writetext .Text
	waitbutton
	closetext
	applymovement PLAYER, .Movement
	end

.Text:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"
	cont "I said the lake's"
	cont "not that way!"
	done

.Movement:
	step LEFT
	step_end

Route201_TwinleafSignScript:
	jumptextsign .Text
.Text:
	text "<SIGN|> ROUTE 201"
	line "<SIGND> TWINLEAF TOWN"
	done

Route201_LakeVeritySignScript:
	jumptext .Text
.Text:
	text "LAKE VERITY"

	para "According to the"
	line "legend, this lake"
	cont "is home to the"
	cont "#MON said to be"
	cont "“The Being of"
	cont "Emotion.”"

	para "It is because of"
	line "this #MON that"
	cont "people can experi-"
	cont "ence sorrow and"
	cont "joy."
	done

Route201_EnterLakeScriptL:
	settableindex 0
	sjump Route201_EnterLakeScript

Route201_EnterLakeScriptR:
	settableindex 1
Route201_EnterLakeScript:
	turnobject ROUTE201_RIVAL, UP
	opentext
	writetext .WereHereText
	waitbutton
	closetext
	stopfollow
	applymovementtable ROUTE201_RIVAL, .RivalEnterLakeMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE201_RIVAL
	waitsfx
	pause 15
	applymovement PLAYER, .PlayerEnterLakeMovement
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	clearevent EVENT_RIVAL_FOLLOWING_PLAYER
	setscene SCENE_ROUTE201_NOTHING
	warpfacing UP, LAKE_VERITY_LOW, 28, 21
	end

.WereHereText:
	text "<RIVAL>: OK! We're"
	line "at the lake!"

	para "Get ready, because"
	line "we're capturing"
	cont "that legendary"
	cont "#MON."

	para "Trust me on this"
	line "one. It's here."
	cont "It even says so"
	cont "on the sign!"
	done

.RivalEnterLakeMovement:
	dw .RivalEnterLakeMovementLeft
	dw .RivalEnterLakeMovementRight

.RivalEnterLakeMovementLeft:
	step RIGHT
	step UP
	step UP
	step_end

.RivalEnterLakeMovementRight:
	step LEFT
	step UP
.PlayerEnterLakeMovement:
	step UP
	step_end

Route201_TrainerTipsSignScript:
	jumptext .Text

.Text:
	text "Trainer Tips!"

	para "Don't be shy! Talk"
	line "to anyone and"
	cont "everyone you see."

	para "By talking to"
	line "people, you will"
	cont "get invaluable"
	cont "information and"
	cont "advice."
	done

Route201_SandgemSignScript:
	jumptextsign .Text
.Text:
	text "    ROUTE 201"
	line "<SIGNR> SANDGEM TOWN"
	done

Route201_GirlScript:
	faceplayer
	jumptext .HealAtHomeText

.HealAtHomeText:
	text "If your #MON's"
	line "health, or its HP,"
	cont "is getting low,"
	cont "you should go"
	cont "home and get some"
	cont "rest."
	done

.HealAtPMCText:
	text "If your #MON's"
	line "health, or its HP,"
	cont "is getting low,"
	cont "you should go"
	cont "to a #MON"
	cont "CENTER!"
	done

Route201_MartGuyScript:
	faceplayer
	checkevent EVENT_GOT_POTION_FROM_ROUTE_201_CLERK
	iftrue .After
	opentext
	writetext .BeforeText
	waitbutton
	verbosegiveitem POTION
	iffalse .BagFull
	setevent EVENT_GOT_POTION_FROM_ROUTE_201_CLERK
.BagFull:
	closetext
	end

.After:
	jumptext .AfterText

.BeforeText:
	text "Hi! I work at a"
	line "#MON MART."

	para "Did you know that"
	line "a #MON's health"
	cont "is measured by"
	cont "Hit Points (HP)?"

	para "If a #MON runs"
	line "out of HP, it will"
	cont "faint and can't"
	cont "battle anymore."

	para "If a #MON's HP"
	line "gets low, you"
	cont "should heal it"
	cont "with a POTION."

	para "Here, let me give"
	line "you one as a free"
	cont "sample. First one's"
	cont "free!"

	para "It will go into"
	line "the MEDICINE"
	cont "pocket of your bag"
	cont "automatically."
	done

.AfterText:
	text "You can find a"
	line "#MON MART in"
	cont "cities and most"
	cont "major towns."
	done

Route201_LedgeKidScript:
	jumptextfaceplayer .Text
.Text:
	text "That ledge is one"
	line "way. Jump down for"
	cont "a shortcut to"
	cont "TWINLEAF TOWN!"
	done

Route201_GrassGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Wild #MON lurk"
	line "in tall grass."
	cont "They can burst out"
	cont "at any time."

	para "So, if you want to"
	line "battle wild"
	cont "#MON, just walk"
	cont "in the tall grass."

	para "If you want to"
	line "avoid wild #MON"
	cont "then stay out of"
	cont "the tall grass."
	done

Route201_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  2, LAKE_VERITY_LOW, 1
	warp_event  5,  2, LAKE_VERITY_LOW, 2
	warp_event  4,  0, LAKE_VERITY_HIGH, 1
	warp_event  5,  0, LAKE_VERITY_HIGH, 2

	db 12 ; coord events
	coord_event 18, 15, SCENE_ROUTE201_FIND_RIVAL, Route201_GetStarterScriptL
	coord_event 19, 15, SCENE_ROUTE201_FIND_RIVAL, Route201_GetStarterScriptR
	coord_event 21, 13, SCENE_ROUTE201_CANT_LEAVE, Route201_CantLeaveScript1
	coord_event 19, 14, SCENE_ROUTE201_CANT_LEAVE, Route201_CantLeaveScript2
	coord_event 18, 15, SCENE_ROUTE201_FIND_RIVAL_2, Route201_RivalFollowScriptL
	coord_event 19, 15, SCENE_ROUTE201_FIND_RIVAL_2, Route201_RivalFollowScriptR
	coord_event 18, 16, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_PlayerCantLeaveScript1
	coord_event 19, 16, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_PlayerCantLeaveScript1
	coord_event 21, 12, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_PlayerCantLeaveScript2
	coord_event 21, 13, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_PlayerCantLeaveScript2
	coord_event  4,  3, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_EnterLakeScriptL
	coord_event  5,  3, SCENE_ROUTE201_RIVAL_FOLLOW, Route201_EnterLakeScriptR

	db 4 ; bg events
	bg_event 17, 13, BGEVENT_READ, Route201_TwinleafSignScript
	bg_event  3,  5, BGEVENT_READ, Route201_LakeVeritySignScript
	bg_event 39, 11, BGEVENT_READ, Route201_TrainerTipsSignScript
	bg_event 50,  4, BGEVENT_READ, Route201_SandgemSignScript

	db 8 ; object events
	object_event 18, 12, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_RivalScript, EVENT_ROUTE_201_RIVAL
	object_event 15, 12, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_RowanScript, EVENT_ROUTE_201_ROWAN
	object_event 15, 12, SPRITE_DAWN_LUCAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_201_DAWNLUCAS
	object_event 18, 13, SPRITE_FAMICOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_BriefcaseScript, EVENT_ROUTE_201_BRIEFCASE
	object_event 48, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_GirlScript, -1
	object_event 42,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_MartGuyScript, -1
	object_event 53,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route201_LedgeKidScript, -1
	object_event 26, 12, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route201_GrassGuyScript, EVENT_ROUTE_201_GRASS_GUY
