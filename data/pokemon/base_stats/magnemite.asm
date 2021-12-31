	db 0 ; species ID placeholder

	db  25,  35,  70,  45,  95,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 190 ; catch rate
	db 89 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magnemite/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, REFLECT, SHOCK_WAVE, FACADE, SECRET_POWER, REST, CHARGE_BEAM, ENDURE, EXPLOSION, RECYCLE, FLASH, THUNDER_WAVE, GYRO_BALL, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, FLASH_CANNON, IRON_DEFENSE, MAGNET_RISE, ROLLOUT, SIGNAL_BEAM, SNORE, SWIFT 
	; end
