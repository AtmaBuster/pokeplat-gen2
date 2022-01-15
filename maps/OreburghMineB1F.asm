	object_const_def ; object_event constants
	const OREBURGHMINEB1F_OBJECT0
	const OREBURGHMINEB1F_OBJECT1
	const OREBURGHMINEB1F_OBJECT2
	const OREBURGHMINEB1F_OBJECT3

OreburghMineB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Objects

.Objects:
	checkpoke ARCEUS
	iffalse .HideHiker
	appear OREBURGHMINEB1F_OBJECT2
	return

.HideHiker:
	disappear OREBURGHMINEB1F_OBJECT2
	return

OreburghMineB1F_GirlScript:
	jumptextfaceplayer .Text
.Text:
	text "I found what I"
	line "thought were some"
	cont "rocks, then they"
	cont "started moving!"

	para "They were #MON"
	line "that looked just"
	cont "like rocks!"
	done

OreburghMineB1F_WorkerScript:
	jumptextfaceplayer .Text
.Text:
	text "Everyone that"
	line "works in the coal"
	cont "mine keeps their"
	cont "own #MON with"
	cont "them."

	para "You may be"
	line "challenged to"
	cont "battles! Hahaha!"
	done

OreburghMineB1F_PokeBallScript:
	itemball POKE_BALL

OreburghMineB1F_ArceusGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FLAME_PLATE_IN_MINE
	iftrue .After
	checkevent EVENT_TALKED_TO_ARCEUS_GUY_IN_MINE
	iftrue .AfterBagFull
	setevent EVENT_TALKED_TO_ARCEUS_GUY_IN_MINE
	writetext .IntroText
.GiveItem:
	waitbutton
	giveitem FLAME_PLATE
	iffalse .BagFull
	getitemname STRING_BUFFER_4, FLAME_PLATE
	writetext .GotItemText
	waitsfx
	specialsound
	itemnotify
	setevent EVENT_GOT_FLAME_PLATE_IN_MINE
.After:
	writetext .AfterText
	waitbutton
	closetext
	end

.AfterBagFull:
	writetext .TryGiveAgainText
	sjump .GiveItem

.BagFull:
	writetext .BagFullText
	waitbutton
	closetext

.IntroText:
	text "Hello! How do you"
	line "do! I'm a student"
	cont "of philosophy."

	para "If I had to"
	line "explain everything"
	cont "very simply, I"
	cont "study how people"
	cont "came to be."

	para "That could explain"
	line "why I happen to be"
	cont "in SINNOH."

	para "In SINNOH, there"
	line "is a myth on how"
	cont "the world came"
	cont "into existence."

	para "Investigating that"
	line "myth may give me"
	cont "insight on the"
	cont "emergence of"
	cont "people."

	para "I found something"
	line "very interesting"
	cont "soon after"
	cont "arrival."

	para "You may have it,"
	line "if you'd like."
	done

.GotItemText:
	text_far UnknownText_0x1c4719
	text_end

.AfterText:
	text "I'm told that PLATE"
	line "was created at the"
	cont "same time as"
	cont "SINNOH."

	para "That PLATE I found"
	line "bears this"
	cont "inscription."

	para "“The rightful"
	line "bearer of a PLATE"
	cont "draws from the"
	cont "PLATE it holds.”"

	para "The rightful"
	line "bearer, I think,"
	cont "may point to the"
	cont "shaper of this"
	cont "world."

	para "Oh, by the way,"
	line "I'm only interested"
	cont "in the words and"
	cont "thoughts left"
	cont "behind."

	para "Physical artifacts"
	line "like that PLATE"
	cont "don't interest me"
	cont "once I've read"
	cont "them."

	para "I hope we meet"
	line "again somewhere."
	done

.TryGiveAgainText:
	text "Well, hello!"

	para "About that very"
	line "interesting thing"
	cont "I found…"

	para "You may have it,"
	line "if you'd like."
	done

.BagFullText:
	text "Oh? You have an"
	line "overabundance of"
	cont "things!"

	para "I'll wait for you"
	line "with this."
	done

OreburghMineB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  1, OREBURGH_CITY, 3
	warp_event  7, 21, OREBURGH_MINE_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  3, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB1F_WorkerScript, -1
	object_event  4,  2, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB1F_GirlScript, -1
	object_event  0,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMineB1F_ArceusGuyScript, EVENT_OREBURGH_MINE_B1F_HIKER
	object_event 12,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OreburghMineB1F_PokeBallScript, EVENT_OREBURGH_MINE_B1F_POKE_BALL
