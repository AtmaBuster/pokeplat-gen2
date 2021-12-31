	db 0 ; species ID placeholder

	db  49,  49,  56,  66,  49,  61
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 66 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/finneon/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, SILVER_WIND, PAYBACK, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, SURF, DEFOG, WATERFALL, AIR_CUTTER, AQUA_TAIL, BOUNCE, DIVE, ICY_WIND, OMINOUS_WIND, SNORE, SWIFT, TWISTER 
	; end
