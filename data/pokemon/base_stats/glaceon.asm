	db 0 ; species ID placeholder

	db  65,  60, 110,  65, 130,  95
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/glaceon/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, ENDURE, GIGA_IMPACT, AVALANCHE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, AQUA_TAIL, HELPING_HAND, ICY_WIND, LAST_RESORT, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT 
	; end
