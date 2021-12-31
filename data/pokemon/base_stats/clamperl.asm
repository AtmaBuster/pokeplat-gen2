	db 0 ; species ID placeholder

	db  35,  64,  85,  32,  74,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 142 ; base exp
	db NO_ITEM, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/clamperl/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, WATERFALL, DIVE, ICY_WIND, IRON_DEFENSE, SNORE 
	; end
