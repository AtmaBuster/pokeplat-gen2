	db 0 ; species ID placeholder

	db  40,  40,  35,  70,  50, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacool/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, BRINE, ENDURE, PAYBACK, SWORDS_DANCE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, SUBSTITUTE, CUT, SURF, WATERFALL, DIVE, ICY_WIND, KNOCK_OFF, SNORE 
	; end
