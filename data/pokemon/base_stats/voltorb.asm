	db 0 ; species ID placeholder

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/voltorb/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, TAUNT, LIGHT_SCREEN, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SHOCK_WAVE, TORMENT, FACADE, SECRET_POWER, REST, THIEF, CHARGE_BEAM, ENDURE, EXPLOSION, FLASH, THUNDER_WAVE, GYRO_BALL, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, MAGNET_RISE, ROLLOUT, SIGNAL_BEAM, SNORE, SUCKER_PUNCH, SWIFT 
	; end
