	db 0 ; species ID placeholder

	db  45,  30,  50,  45,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 120 ; catch rate
	db 57 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/chingling/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SHOCK_WAVE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, SKILL_SWAP, SNATCH, CHARGE_BEAM, ENDURE, RECYCLE, FLASH, THUNDER_WAVE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, GRASS_KNOT, SWAGGER, SUBSTITUTE, TRICK_ROOM, HELPING_HAND, ICY_WIND, KNOCK_OFF, LAST_RESORT, ROLLOUT, SIGNAL_BEAM, SNORE, SWIFT, TRICK, UPROAR, ZEN_HEADBUTT 
	; end
