	db 0 ; species ID placeholder

	db  63, 120,  85,  55,  90,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 155 ; catch rate
	db 161 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/crawdaunt/front.dimensions"
	db GROWTH_FLUCTUATING ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, TAUNT, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SLUDGE_BOMB, ROCK_TOMB, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, FALSE_SWIPE, FLING, ENDURE, PAYBACK, GIGA_IMPACT, AVALANCHE, SWORDS_DANCE, CAPTIVATE, DARK_PULSE, ROCK_SLIDE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, WATERFALL, ANCIENTPOWER, DIVE, ENDEAVOR, FURY_CUTTER, ICY_WIND, IRON_DEFENSE, KNOCK_OFF, MUD_SLAP, SNORE, SPITE, SUPERPOWER, SWIFT 
	; end
