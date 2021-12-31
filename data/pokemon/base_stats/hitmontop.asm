	db 0 ; species ID placeholder

	db  50,  95,  95,  70,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 138 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmontop/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ENDURE, STONE_EDGE, GYRO_BALL, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, ENDEAVOR, HELPING_HAND, MUD_SLAP, ROLLOUT, SNORE, SUCKER_PUNCH, SWIFT, TWISTER, VACUUM_WAVE 
	; end
