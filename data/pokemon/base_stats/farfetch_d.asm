	db 0 ; species ID placeholder

	db  52,  65,  55,  60,  58,  62
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM, STICK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/farfetch_d/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, IRON_TAIL, RETURN, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, FALSE_SWIPE, ENDURE, SWORDS_DANCE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, PLUCK, U_TURN, SUBSTITUTE, CUT, FLY, DEFOG, AIR_CUTTER, FURY_CUTTER, HEAT_WAVE, KNOCK_OFF, LAST_RESORT, MUD_SLAP, OMINOUS_WIND, SNORE, SWIFT, TWISTER, UPROAR 
	; end
