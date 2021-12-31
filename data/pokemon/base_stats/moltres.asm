	db 0 ; species ID placeholder

	db  90, 100,  90,  90, 125,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/moltres/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, AERIAL_ACE, FACADE, SECRET_POWER, REST, STEEL_WING, OVERHEAT, ROOST, ENDURE, WILL_O_WISP, GIGA_IMPACT, SLEEP_TALK, NATURAL_GIFT, SWAGGER, PLUCK, U_TURN, SUBSTITUTE, FLY, DEFOG, ROCK_SMASH, AIR_CUTTER, ANCIENTPOWER, HEAT_WAVE, MUD_SLAP, OMINOUS_WIND, SNORE, SWIFT, TWISTER 
	; end
