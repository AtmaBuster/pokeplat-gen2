	db 0 ; species ID placeholder

	db  95,  65, 110,  65,  60, 130
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/umbreon/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, SNATCH, ENDURE, PAYBACK, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, SUBSTITUTE, CUT, HELPING_HAND, LAST_RESORT, MUD_SLAP, SNORE, SPITE, SUCKER_PUNCH, SWIFT 
	; end
