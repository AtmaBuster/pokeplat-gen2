	db 0 ; species ID placeholder

	db  45,  40,  60,  50,  40,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING	; type
	db 255 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swablu/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, ENDURE, DRAGON_PULSE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, PLUCK, SUBSTITUTE, FLY, AIR_CUTTER, HEAT_WAVE, MUD_SLAP, OMINOUS_WIND, OUTRAGE, SNORE, SWIFT, TWISTER, UPROAR 
	; end
