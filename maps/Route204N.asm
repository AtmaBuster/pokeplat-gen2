	object_const_def ; object_event constants

Route204N_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route204_AwakeningScript:
	itemball AWAKENING

Route204_TMBulletSeedScript:
	tmhmball TM_BULLET_SEED

Route204_YoungsterScript:
	jumptextfaceplayer .Text
.Text:
	text "Are you raising"
	line "different kinds of"
	cont "#MON?"

	para "If you only have"
	line "the same type of"
	cont "#MON, you'll"
	cont "have a hard time"
	cont "against types that"
	cont "it's weak to."
	done

Route204_TMLadyScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_204_GOT_TM_CAPTIVATE
	iftrue .After
	writetext .Text1
	waitbutton
	verbosegivetmhm TM_CAPTIVATE
	iffalse .BagFull
	setevent EVENT_ROUTE_204_GOT_TM_CAPTIVATE
.After:
	writetext .Text2
.BagFull:
	waitbutton
	closetext
	end

.Text1:
	text "Hi, are you the"
	line "flirty type?"

	para "…I'm asking you to"
	line "make a point."

	para "I teach at the"
	line "TRAINER'S SCHOOL,"
	cont "and I'd like to"
	cont "give you a lesson."

	para "But before I do,"
	line "I'd like you to"
	cont "have this TM."
	done

.Text2:
	text "You know how"
	line "#MON have"
	cont "genders?"

	para "Like, there are"
	line "males and females?"

	para "Well, the move"
	line "CAPTIVATE can only"
	cont "work against the"
	cont "opposite gender."

	para "For example, it"
	line "only works when"
	cont "used by a male"
	cont "#MON on a"
	cont "female."

	para "The move sharply"
	line "lowers the target's"
	cont "SPECIAL ATTACK, or"
	cont "SP.ATK for short."

	para "You also probably"
	line "know this, but a"
	cont "TM is good for"
	cont "only one use."

	para "Choose the #MON"
	line "wisely if you do"
	cont "decide to use it."
	done

TrainerAromaLadyTaylor:
	trainer AROMA_LADY, TAYLOR, EVENT_BEAT_AROMA_LADY_TAYLOR, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "What kind of"
	line "person are you to"
	cont "be drawn here by"
	cont "the flowery scent?"
	done

.BeatenText:
	text "It was a strong"
	line "TRAINER who was"
	cont "drawn here!"
	done

.AfterText: ; TOCHANGE
	text "By the way, have"
	line "you collected new"
	cont "apps from the"
	cont "#TCH COMPANY?"
	done

TrainerBugCatcherBran:
	trainer BUG_CATCHER, BRAN1, EVENT_BEAT_BUG_CATCHER_BRAN1, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Hey, hey, let me"
	line "show off my bugs!"
	done

.BeatenText:
	text "I'm can't explain"
	line "the charms of bug"
	cont "#MON this way!"
	done

.AfterText:
	text "Bug #MON grow"
	line "quickly, and they"
	cont "can do stuff like"
	cont "poison and para-"
	cont "lyze, and they're"
	cont "cute yet cool."
	done

TrainerTwinsLivAndLiz1:
	trainer TWINS, LIVANDLIZ, EVENT_BEAT_TWINS_LIVANDLIZ, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "LIV: We can beat"
	line "this TRAINER in"
	cont "one-shot, can't we,"
	cont "LIZ?"

	para "LIZ: We're the"
	line "strongest in our"
	cont "class!"
	done

.BeatenText:
	text "LIV: Oh, oh, oh?"

	para "LIZ: Oh, but,"
	line "wait!"
	done

.AfterText:
	text "LIV: This TRAINER…"

	para "Will brag about"
	line "beating us, LIZ."
	done

TrainerTwinsLivAndLiz2:
	trainer TWINS, LIVANDLIZ, EVENT_BEAT_TWINS_LIVANDLIZ, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "LIV: We can beat"
	line "this TRAINER in"
	cont "one-shot, can't we,"
	cont "LIZ?"

	para "LIZ: We're the"
	line "strongest in our"
	cont "class!"
	done

.BeatenText:
	text "LIV: Oh, oh, oh?"

	para "LIZ: Oh, but,"
	line "wait!"
	done

.AfterText:
	text "LIZ: This TRAINER…"

	para "Is happy about"
	line "beating us, LIV."
	done

Route204_FloaromaSign:
	jumptextsign .Text
.Text:
	text "<SIGNU> ROUTE 204"
	line "<SIGN|> FLOAROMA TOWN"
	done

Route204N_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14, 17, RAVAGED_PATH, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13,  7, BGEVENT_READ, Route204_FloaromaSign

	db 10 ; object events
	object_event  9, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route204_YoungsterScript, -1
	object_event 14, 14, SPRITE_TEACHER, SPRITEMOVEDATA_TURN_DOWN_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerAromaLadyTaylor, -1
	object_event 15,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_TURN_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherBran, -1
	object_event 10,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinsLivAndLiz1, -1
	object_event 11,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinsLivAndLiz2, -1
	object_event 22,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route204_TMLadyScript, -1
	object_event 16, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route204_AwakeningScript, EVENT_ROUTE_204_AWAKENING
	object_event  1,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_TMHMBALL, 0, Route204_TMBulletSeedScript, EVENT_ROUTE_204_TM_BULLET_SEED
	object_event  8, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 27, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
