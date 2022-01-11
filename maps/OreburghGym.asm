	object_const_def ; object_event constants
	const OREBURGHGYM_ROARK
	const OREBURGHGYM_YOUNGSTER1
	const OREBURGHGYM_YOUNGSTER2
	const OREBURGHGYM_GYM_GUY

OreburghGym_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_DEFAULT
	scene_script .Dummy ; SCENE_FINISHED

	db 0 ; callbacks

.Dummy:
	end

OreburghGym_BridgeOn:
	callasm .Bridge
	setscene SCENE_FINISHED
	end

.Bridge:
	changebridgeblock 2, 12, $2c, OREBURGH_GYM
	changebridgeblock 4, 12, $2d, OREBURGH_GYM
	changebridgeblock 6, 12, $2e, OREBURGH_GYM
	bridgeon

OreburghGym_BridgeOff:
	callasm .Bridge
	setscene SCENE_DEFAULT
	end

.Bridge:
	changebridgeblock 2, 12, $0c, OREBURGH_GYM
	changebridgeblock 4, 12, $0d, OREBURGH_GYM
	changebridgeblock 6, 12, $0e, OREBURGH_GYM
	bridgeoff

OreburghGym_RoarkScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LEADER_ROARK1
	iftrue .FightDone
	writetext .IntroText
	waitbutton
	closetext
	winlosstext .WinText, 0
	loadtrainer ROARK, ROARK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LEADER_ROARK1
	opentext
	writetext .AfterText
	buttonsound
	writetext .GotBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_COALBADGE
	; after gym events
	setevent EVENT_BEAT_YOUNGSTER_JONATHON
	setevent EVENT_BEAT_YOUNGSTER_DARIUS
	setmapscene OREBURGH_CITY, SCENE_OREBURGHCITY_AFTER_GYM
	blackoutmod OREBURGH_CITY
	setevent EVENT_GALACTIC_IN_JUBILIFE
	clearevent EVENT_JUBILIFE_CITY_DAWNLUCAS
	setmapscene JUBILIFE_CITY, SCENE_JUBILIFECITY_CANT_LEAVE_GALACTIC
	variablesprite SPRITE_CLOWN_GALACTIC, SPRITE_ROCKET
	variablesprite SPRITE_CLOWN_ROWAN, SPRITE_ROWAN
	variablesprite SPRITE_DAWN_LUCAS2, SPRITE_DAWN
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .FightDone
	variablesprite SPRITE_DAWN_LUCAS2, SPRITE_LUCAS
.FightDone:
	checkevent EVENT_GOT_TM_STEALTH_ROCK
	iftrue .AfterTM
	writetext .BadgeText
	buttonsound
	verbosegivetmhm TM_STEALTH_ROCK
	iffalse .BagFull
	setevent EVENT_GOT_TM_STEALTH_ROCK
	writetext .TMText
	waitbutton
.BagFull:
	closetext
	end

.AfterTM:
	writetext .AllDoneText
	waitbutton
	closetext
	end

.IntroText:
	text "Welcome! This is"
	line "the OREBURGH"
	cont "#MON GYM!"

	para "I'm ROARK, the"
	line "GYM LEADER!"

	para "I'm but one TRAINER"
	line "who decided to"
	cont "walk proudly with"
	cont "ROCK type #MON!"

	para "As the GYM LEADER,"
	line "I need to see your"
	cont "potential as a"
	cont "TRAINER."

	para "And, I'll need to"
	line "see the toughness"
	cont "of the #MON"
	cont "that battle with"
	cont "you!"
	done

.WinText:
	text "W-what? That can't"
	line "be!"

	para "My buffed-up"
	line "#MON!"
	done

.AfterText:
	text "This is"
	line "embarrassing…"

	para "I went and lost to"
	line "a TRAINER who"
	cont "didn't have a"
	cont "single GYM BADGE…"

	para "But that's tough."

	para "You were strong,"
	line "and I was weak."

	para "That's all there is"
	line "to it."

	para "According to the"
	line "#MON LEAGUE"
	cont "rules, I have to"
	cont "give you our GYM"
	cont "BADGE since you've"
	cont "beaten me, the"
	cont "LEADER."

	para "Here's your"
	line "official #MON"
	cont "LEAGUE COAL BADGE."
	done

.GotBadgeText:
	text "<PLAYER> receieved"
	line "the COAL BADGE!"
	done

.BadgeText:
	text "Having that COAL"
	line "BADGE means your"
	cont "#MON can now"
	cont "use the hidden"
	cont "move ROCK SMASH"
	cont "outside of battle."

	para "You should also"
	line "take this, too."
	done

.TMText:
	text "That TM76 contains"
	line "STEALTH ROCK."

	para "It's a move that"
	line "inflicts damage on"
	cont "foes that switch"
	cont "into battle."

	para "Incidentally, a TM"
	line "will teach its"
	cont "move to a #MON"
	cont "instantly."

	para "But a TM will"
	line "break when you use"
	cont "it, so make sure"
	cont "you want a #MON"
	cont "to learn that"
	cont "move."
	done

.AllDoneText:
	text "In this region of"
	line "SINNOH, there are"
	cont "seven other"
	cont "GYM LEADERS."

	para "I should warn you:"
	line "they're a lot"
	cont "tougher than I am!"
	done

OreburghGym_GymGuyScript:
	faceplayer
	checkflag ENGINE_COALBADGE
	iftrue .After
	jumptext .BeforeText

.After:
	jumptext .AfterText

.BeforeText:
	text "Howdy! How's it"
	line "going, Champ in"
	cont "the making?"

	para "That's what I said"
	line "to a really"
	cont "impatient boy"
	cont "earlier, too."

	para "The GYM LEADER is"
	line "a user of ROCK"
	cont "type #MON."

	para "Well, listne. ROCK"
	line "type #MON haye"
	cont "water, all right?"

	para "They're also weak"
	line "to GRASS type"
	cont "moves."

	para "Gee, they sure"
	line "have weaknesses!"

	para "But don't think it"
	line "will be easy."

	para "You don't get to be"
	line "a GYM LEADER"
	cont "without covering"
	cont "for weaknesses."

	para "Going after a ROCK"
	line "type #MON with"
	cont "a FIRE type"
	cont "#MON won't be"
	cont "easy, either."

	para "That's all the"
	line "advice I can give."

	para "Thanks for"
	line "listening!"
	done

.AfterText:
	text "Oh! <PLAYER>! You've"
	line "taken care of the"
	cont "GYM LEADER!"

	para "So, did my advice"
	line "come in handy, or"
	cont "what?"

	para "If my advice was"
	line "useful, it'd be"
	cont "great if you'd"
	cont "become my fan!"
	done

OreburghGym_StatueScript:
	gettrainername STRING_BUFFER_4, ROARK, ROARK1
	checkflag ENGINE_COALBADGE
	iftrue .After
	jumpstd gymstatue1
.After:
	jumpstd gymstatue2

TrainerYoungsterJonathon:
	trainer YOUNGSTER, JONATHON, EVENT_BEAT_YOUNGSTER_JONATHON, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "You avoided the"
	line "long way around?"

	para "Let's see why you'd"
	line "do that!"
	done

.BeatenText:
	text "Now I understand"
	line "why you decided to"
	cont "battle with me."
	done

.AfterText:
	text "You should go"
	line "whichever way you"
	cont "want, shortcut or"
	cont "the long way!"
	done

TrainerYoungsterDarius:
	trainer YOUNGSTER, DARIUS, EVENT_BEAT_YOUNGSTER_DARIUS, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Only those who"
	line "want to win can"
	cont "challenge a"
	cont "#MON GYM!"
	done

.BeatenText:
	text "Gggh… This is"
	line "humiliating!"
	done

.AfterText:
	text "One day, I'm going"
	line "to become a tough"
	cont "TRAINER like you."
	done

OreburghGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 19, OREBURGH_CITY, 14
	warp_event  5, 19, OREBURGH_CITY, 14

	db 8 ; coord events
	coord_event  1, 14, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  7, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  8, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  9, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  1, 15, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  7,  9, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  8,  9, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  9,  9, SCENE_FINISHED, OreburghGym_BridgeOff

	db 2 ; bg events
	bg_event  3, 18, BGEVENT_READ, OreburghGym_StatueScript
	bg_event  6, 18, BGEVENT_READ, OreburghGym_StatueScript

	db 4 ; object events
	object_event  4,  1, SPRITE_ROARK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGym_RoarkScript, -1
	object_event  3, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJonathon, -1
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerYoungsterDarius, -1
	object_event  7, 18, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghGym_GymGuyScript, -1
