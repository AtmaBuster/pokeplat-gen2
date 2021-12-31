	db 0 ; species ID placeholder

	db  60,  60,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GROUND ; type
	db 255 ; catch rate
	db 88 ; base exp
	db ICE_BERRY, ICE_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/numel/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, OVERHEAT, ENDURE, WILL_O_WISP, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, EARTH_POWER, HEAT_WAVE, MUD_SLAP, ROLLOUT, SNORE 
	; end
