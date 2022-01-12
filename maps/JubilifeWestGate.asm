	object_const_def ; object_event constants

JubilifeWestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeWestGate_OldRodScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .After
	writetext .OldRodText
	yesorno
	iffalse .SaidNo
	writetext .SaidYesText
	waitbutton
	verbosegiveitem OLD_ROD
	iffalse .BagFull
	setevent EVENT_GOT_OLD_ROD
.After:
	writetext .AfterText
	yesorno
	iftrue .YesTip
	writetext .NoTipText
	waitbutton
	closetext
	end

.YesTip:
	writetext .TipText
	waitbutton
.BagFull:
	closetext
	end

.SaidNo:
	writetext .SaidNoText
	waitbutton
	closetext
	end

.OldRodText:
	text "Yes, sir!"

	para "An OLD ROD is a"
	line "good thing!"

	para "You think so too,"
	line "am I right?"
	done

.SaidYesText:
	text "Yes! Good answer!"
	line "We can be friends!"

	para "Here you go. That's"
	line "my OLD ROD!"
	done

.AfterText:
	text "You should fish"
	line "wherever there is"
	cont "a body of water."

	para "Oh, and by the"
	line "way, did you need"
	cont "any tips on using"
	cont "that fishing rod?"
	done

.NoTipText:
	text "When you're fishing"
	line "for #MON, the"
	cont "first hurdle is"
	cont "getting a bite."

	para "When you reel the"
	line "#MON in, you've"
	cont "got to battle it."

	para "So, fishing gives"
	line "you twice the fun!"
	done

.TipText:
	text "First, you face"
	line "any body of water,"
	cont "then you use your"
	cont "fishing rod."

	para "Next, you focus!"
	line "If a #MON bites"
	cont "“!” appears."

	para "That's your cue to"
	line "reel it in!"
	done

.SaidNoText:
	text "Oh, really? You"
	line "don't like to fish?"
	done

JubilifeWestGate_GuardScript:
	jumptextfaceplayer .Text
.Text:
	text "ROUTE 218 up ahead"
	line "is a great fishing"
	cont "hole that's almost"
	cont "unknown to people."
	done

JubilifeWestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  4, JUBILIFE_CITY, 11
	warp_event  9,  5, JUBILIFE_CITY, 12
	warp_event  0,  4, ROUTE_218, 1
	warp_event  0,  5, ROUTE_218, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeWestGate_OldRodScript, -1
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeWestGate_GuardScript, -1
