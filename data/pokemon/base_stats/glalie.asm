	db 0 ; species ID placeholder

	db  80,  80,  80,  80,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 75 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/glalie/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FAIRY, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, TAUNT, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, EARTHQUAKE, RETURN, SHADOW_BALL, DOUBLE_TEAM, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, ENDURE, EXPLOSION, PAYBACK, GIGA_IMPACT, FLASH, AVALANCHE, GYRO_BALL, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, ICY_WIND, IRON_HEAD, ROLLOUT, SIGNAL_BEAM, SNORE, SPITE 
	; end
