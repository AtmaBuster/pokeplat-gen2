	db 0 ; species ID placeholder

	db  50,  75,  75,  50,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db DARK, GHOST ; type
	db 45 ; catch rate
	db 98 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/sableye/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, SHOCK_WAVE, ROCK_TOMB, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, FLING, ENDURE, WILL_O_WISP, EMBARGO, SHADOW_CLAW, PAYBACK, FLASH, PSYCH_UP, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, DREAM_EATER, SWAGGER, SUBSTITUTE, CUT, ROCK_SMASH, FIRE_PUNCH, FURY_CUTTER, ICE_PUNCH, ICY_WIND, KNOCK_OFF, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SPITE, SUCKER_PUNCH, THUNDERPUNCH, TRICK, ZEN_HEADBUTT 
	; end
