	db 0 ; species ID placeholder

	db  97, 165,  60,  58,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 45 ; catch rate
	db 173 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/rampardos/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SHOCK_WAVE, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FOCUS_BLAST, FLING, ENDURE, DRAGON_PULSE, PAYBACK, GIGA_IMPACT, ROCK_POLISH, STONE_EDGE, AVALANCHE, SWORDS_DANCE, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, ROCK_CLIMB, ANCIENTPOWER, EARTH_POWER, ENDEAVOR, FIRE_PUNCH, IRON_HEAD, MUD_SLAP, OUTRAGE, SNORE, SPITE, SUPERPOWER, THUNDERPUNCH, UPROAR, ZEN_HEADBUTT 
	; end
