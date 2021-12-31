	db 0 ; species ID placeholder

	db  55,  70,  55,  85,  40,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/aipom/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, SHOCK_WAVE, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, FLING, ENDURE, SHADOW_CLAW, PAYBACK, THUNDER_WAVE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, GRASS_KNOT, SWAGGER, U_TURN, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH, BOUNCE, FIRE_PUNCH, FURY_CUTTER, GUNK_SHOT, ICE_PUNCH, KNOCK_OFF, LAST_RESORT, MUD_SLAP, SEED_BOMB, SNORE, SPITE, SWIFT, THUNDERPUNCH, UPROAR 
	; end
