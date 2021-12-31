	db 0 ; species ID placeholder

	db  35,  46,  34,  20,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/sentret/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, SHOCK_WAVE, FLAMETHROWER, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FLING, CHARGE_BEAM, ENDURE, SHADOW_CLAW, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, U_TURN, SUBSTITUTE, CUT, SURF, AQUA_TAIL, FIRE_PUNCH, FURY_CUTTER, HELPING_HAND, ICE_PUNCH, KNOCK_OFF, LAST_RESORT, MUD_SLAP, ROLLOUT, SNORE, SUCKER_PUNCH, SWIFT, THUNDERPUNCH, UPROAR 
	; end
