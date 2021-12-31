	db 0 ; species ID placeholder

	db  55,  65,  95,  85,  95,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seadra/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, DRAGON_PULSE, GIGA_IMPACT, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, FLASH_CANNON, SURF, WATERFALL, BOUNCE, DIVE, ICY_WIND, OUTRAGE, SIGNAL_BEAM, SNORE, SWIFT, TWISTER 
	; end
