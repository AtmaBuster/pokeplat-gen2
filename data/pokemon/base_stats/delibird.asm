	db 0 ; species ID placeholder

	db  45,  55,  45,  75,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 45 ; catch rate
	db 183 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FLING, ENDURE, RECYCLE, AVALANCHE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, PLUCK, SUBSTITUTE, FLY, DEFOG, BOUNCE, GUNK_SHOT, ICY_WIND, MUD_SLAP, ROLLOUT, SEED_BOMB, SIGNAL_BEAM, SWIFT 
	; end
