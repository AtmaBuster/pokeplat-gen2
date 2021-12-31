	db 0 ; species ID placeholder

	db  60,  50,  40,  95,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 200 ; catch rate
	db 120 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/plusle/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups
	db 70 ; happiness

	; tm/hm learneset
	tmhm TOXIC, HIDDEN_POWER, LIGHT_SCREEN, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SHOCK_WAVE, FACADE, SECRET_POWER, REST, ATTRACT, FLING, CHARGE_BEAM, ENDURE, FLASH, THUNDER_WAVE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, HELPING_HAND, LAST_RESORT, MAGNET_RISE, MUD_SLAP, ROLLOUT, SIGNAL_BEAM, SNORE, SWIFT, THUNDERPUNCH, UPROAR 
	; end
