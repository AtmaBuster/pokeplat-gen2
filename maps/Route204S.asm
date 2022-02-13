	object_const_def ; object_event constants

Route204S_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassSarah:
	trainer LASS, SARAH, EVENT_BEAT_LASS_SARAH, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Oh, a weak-looking"
	line "TRAINER…"

	para "Do you want to"
	line "have a go?"
	done

.BeatenText:
	text "Aww… I should have"
	line "said no."
	done

.AfterText:
	text "Oh, you're so mean!"

	para "I just started"
	line "training #MON!"
	done

TrainerYoungsterTyler:
	trainer YOUNGSTER, TYLER, EVENT_BEAT_YOUNGSTER_TYLER, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'll beat you with"
	line "the MAGIKARP my"
	cont "dad gave me!"
	done

.BeatenText:
	text "But they're the"
	line "#MON I got from"
	cont "my dad…"
	done

.AfterText:
	text "Who gave you your"
	line "first #MON?"

	para "Your first #MON"
	line "is the one with"
	cont "the most fond"
	cont "memories, I think."
	done

TrainerLassSamantha:
	trainer LASS, SAMANTHA1, EVENT_BEAT_LASS_SAMANTHA1, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "May I please"
	line "trouble you for a"
	cont "battle?"
	done

.BeatenText:
	text "Oh…"
	line "You're so strong…"
	done

.AfterText:
	text "Maybe I could have"
	line "won if my #MON"
	cont "held a BERRY…"
	done

Route204_JubilifeSignScript:
	jumptextsign .Text
.Text:
	text "<SIGN|> ROUTE 204"
	line "<SIGND> JUBILIFE CITY"
	done

Route204_RavagedPathSignScript:
	jumptext .Text
.Text:
	text "RAVAGED PATH"
	done

Route204_BoulderKidScript:
	jumptextfaceplayer .Text
.Text:
	text "There are boulders"
	line "blocking the way"
	cont "inside the cavern…"

	para "I think a #MON's"
	line "hidden move will"
	cont "be able to smash"
	cont "those boulders,"
	cont "though."
	done

Route204_ParlyzHealScript:
	itemball PARLYZ_HEAL

Route204_HPUpScript:
	itemball HP_UP

Route204_SeaIncenseScript:
	itemball SEA_INCENSE

Route204S_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 23, RAVAGED_PATH, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 30, BGEVENT_READ, Route204_JubilifeSignScript
	bg_event  7, 24, BGEVENT_READ, Route204_RavagedPathSignScript

	db 8 ; object events
	object_event  8, 34, SPRITE_LASS, SPRITEMOVEDATA_TURN_UP_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerLassSarah, -1
	object_event  4, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_TURN_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterTyler, -1
	object_event  7, 27, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerLassSamantha, -1
	object_event  8, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route204_BoulderKidScript, -1
	object_event  9, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route204_ParlyzHealScript, EVENT_ROUTE_204_PARLYZ_HEAL
	object_event 22, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route204_HPUpScript, EVENT_ROUTE_204_HP_UP
	object_event  0, 40, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route204_SeaIncenseScript, EVENT_ROUTE_204_SEA_INCENSE
