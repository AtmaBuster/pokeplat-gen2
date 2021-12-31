	db 0 ; species ID placeholder

	db  50,  95, 180,  70,  85,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cloyster/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, EXPLOSION, PAYBACK, GIGA_IMPACT, AVALANCHE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, SUBSTITUTE, SURF, DIVE, ICY_WIND, IRON_DEFENSE, SIGNAL_BEAM, SNORE, SWIFT 
	; end
