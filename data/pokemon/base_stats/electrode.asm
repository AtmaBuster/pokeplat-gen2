	db 0 ; species ID placeholder

	db  60,  50,  70, 140,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/electrode/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, TAUNT, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SHOCK_WAVE, TORMENT, FACADE, SECRET_POWER, REST, THIEF, CHARGE_BEAM, ENDURE, EXPLOSION, GIGA_IMPACT, FLASH, THUNDER_WAVE, GYRO_BALL, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, MAGNET_RISE, ROLLOUT, SIGNAL_BEAM, SNORE, SUCKER_PUNCH, SWIFT 
	; end
