	db 0 ; species ID placeholder

	db  65,  95,  75,  85,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 45 ; catch rate
	db 100 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/qwilfish/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, TAUNT, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, SHADOW_BALL, DOUBLE_TEAM, SHOCK_WAVE, SLUDGE_BOMB, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, EXPLOSION, PAYBACK, THUNDER_WAVE, GYRO_BALL, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, SUBSTITUTE, SURF, WATERFALL, AQUA_TAIL, BOUNCE, DIVE, ICY_WIND, ROLLOUT, SIGNAL_BEAM, SNORE, SWIFT 
	; end
