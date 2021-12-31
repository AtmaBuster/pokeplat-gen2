	db 0 ; species ID placeholder

	db  85, 105,  55, 115,  85,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 173 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/floatzel/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_WATER_1 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, ROAR, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, TAUNT, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, FOCUS_BLAST, BRINE, ENDURE, PAYBACK, GIGA_IMPACT, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, STRENGTH, ROCK_SMASH, WATERFALL, AQUA_TAIL, DIVE, ICE_PUNCH, ICY_WIND, MUD_SLAP, SNORE, SWIFT 
	; end
