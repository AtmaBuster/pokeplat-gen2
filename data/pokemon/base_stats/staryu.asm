	db 0 ; species ID placeholder

	db  30,  45,  55,  85,  70,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/staryu/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, DOUBLE_TEAM, REFLECT, FACADE, SECRET_POWER, REST, BRINE, ENDURE, RECYCLE, FLASH, THUNDER_WAVE, GYRO_BALL, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, FLASH_CANNON, SURF, WATERFALL, DIVE, ICY_WIND, ROLLOUT, SIGNAL_BEAM, SNORE, SWIFT, TWISTER 
	; end
