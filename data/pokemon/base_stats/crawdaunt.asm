	db 0 ; species ID placeholder

	db  63, 120,  85,  55,  90,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 155 ; catch rate
	db 161 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/crawdaunt/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FLUCTUATING ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, REST, ATTRACT, FURY_CUTTER, CUT, SURF, STRENGTH, WHIRLPOOL, WATERFALL
	; end
