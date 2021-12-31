	db 0 ; species ID placeholder

	db  95,  23,  48,  23,  23,  48
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 125 ; catch rate
	db 44 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wynaut/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness
	
	; tm/hm learnset
	tmhm 
	; end
