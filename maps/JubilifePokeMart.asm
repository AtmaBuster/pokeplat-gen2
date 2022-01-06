	object_const_def ; object_event constants

JubilifePokeMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifePokeMart_Clerk1Script:
	jumpstd pokemartclerk

JubilifePokeMart_Clerk2Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_JUBILIFE
	closetext
	end

JubilifePokeMart_PotionRepelGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "POTIONS are"
	line "important, but at"
	cont "times, it's better"
	cont "to simply avoid"
	cont "battles."

	para "If you want to"
	line "avoid wild #MON"
	cont "for a while, just"
	cont "use a REPEL."

	para "After all, if you"
	line "don't battle, your"
	cont "#MON can't lose"
	cont "HP."
	done

JubilifePokeMart_WastedMoneyGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Aww, man. I wasted"
	line "money on some"
	cont "# BALLS."

	para "I should've lowered"
	line "the HP of wild"
	cont "#MON more"
	cont "before throwing"
	cont "them."
	done

JubilifePokeMart_PotionWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "The one thing you"
	line "must remember is"
	cont "to pack some"
	cont "POTIONS."

	para "If all of your"
	line "#MON faint, it's"
	cont "lights out for"
	cont "you, too!"
	done

JubilifePokeMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, JUBILIFE_CITY, 5
	warp_event  3,  7, JUBILIFE_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokeMart_Clerk1Script, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokeMart_Clerk2Script, -1
	object_event  4,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokeMart_PotionRepelGirlScript, -1
	object_event  7,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokeMart_WastedMoneyGuyScript, -1
	object_event  6,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifePokeMart_PotionWomanScript, -1
