	db 0 ; species ID placeholder

	db  86,  76,  86,  95, 116,  56
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 30 ; catch rate
	db 180 ; base exp
	db NO_ITEM, SCOPE_LENS ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/yanmega/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, U_TURN, SUBSTITUTE, DEFOG, AIR_CUTTER, ANCIENTPOWER, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT, UPROAR 
	; end
