	db 0 ; species ID placeholder

	db  35,  35,  35,  35,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 91 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/tyrogue/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness
	
	; tm/hm learnset
	tmhm TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, BRICK_BREAK, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ENDURE, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, HELPING_HAND, MUD_SLAP, SNORE, SWIFT, UPROAR, VACUUM_WAVE 
	; end
