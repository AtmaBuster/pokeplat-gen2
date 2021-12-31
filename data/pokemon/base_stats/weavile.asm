	db 0 ; species ID placeholder

	db  70, 120,  65, 125,  45,  85
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE ; type
	db 45 ; catch rate
	db 179 ; base exp
	db QUICK_CLAW, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/weavile/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, TAUNT, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, FOCUS_BLAST, FALSE_SWIPE, FLING, ENDURE, EMBARGO, SHADOW_CLAW, PAYBACK, GIGA_IMPACT, AVALANCHE, SWORDS_DANCE, PSYCH_UP, CAPTIVATE, DARK_PULSE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, DREAM_EATER, SWAGGER, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, FURY_CUTTER, ICE_PUNCH, ICY_WIND, KNOCK_OFF, MUD_SLAP, SNORE, SPITE, SWIFT 
	; end
