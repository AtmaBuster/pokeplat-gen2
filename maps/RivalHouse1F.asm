	object_const_def ; object_event constants
	const RIVALHOUSE1F_OBJECT1

RivalHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalHouse1F_RivalsMomScript:
	faceplayer
	checkevent EVENT_TALKED_TO_RIVAL_IN_ROOM
	iftrue .AfterRival
	jumptext .CallingOnRivalText

.AfterRival:
	checkevent EVENT_TALKED_TO_RIVALS_MOM_AFTER_RIVAL
	iftrue .SecondTalk
	setevent EVENT_TALKED_TO_RIVALS_MOM_AFTER_RIVAL
	jumptext .RocketedOffText

.SecondTalk:
	checkevent EVENT_GOT_STARTER
	iftrue .AfterMon
	jumptext .WaitingText

.AfterMon:
	checkevent EVENT_GOT_POKEDEX
	iftrue .AfterDex
	jumptext .AfterMon

.AfterDex:
	jumptext .AfterDex

.CallingOnRivalText:
	text "<RIVAL>'s MOM: Oh,"
	line "hi, <PLAYER>."

	para "Are you looking"
	line "for <RIVAL>?"

	para "He was gone for a"
	line "second, but then"
	cont "he came running"
	cont "right back home."

	para "He just can't sit"
	line "still. Who does he"
	cont "take after?"
	done

.RocketedOffText:
	text "<RIVAL>'s MOM: That"
	line "kid rocketed off"
	cont "again like usual."

	para "I'd guess he would"
	line "be at ROUTE 201 by"
	cont "now."

	para "He just can't sit"
	line "still. Who does he"
	cont "take after?"
	done

.WaitingText:
	text "<RIVAL>'s MOM: My"
	line "<RIVAL> should be"
	cont "out on ROUTE 201"
	cont "by now."

	para "He just can't sit"
	line "still. Who does he"
	cont "take after?"
	done

.AfterMonText:
	text "<RIVAL>'s MOM: Oh,"
	line "you've become"
	cont "friends with a"
	cont "#MON, too."
	done

.AfterDexText:
	text "<RIVAL>'s MOM: My"
	line "<RIVAL> took off"
	cont "like a rocket as"
	cont "usual."

	para "He was shouting"
	line "something about"
	cont "becoming the"
	cont "greatest TRAINER"
	cont "ever…"

	para "He just can't sit"
	line "still. Who does he"
	cont "take after?"
	done

RivalHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, TWINLEAF_TOWN, 2
	warp_event  7,  7, TWINLEAF_TOWN, 2
	warp_event  9,  0, RIVAL_HOUSE_2F, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RivalHouse1F_RivalsMomScript, -1
