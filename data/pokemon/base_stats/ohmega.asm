	db 0 ; species ID placeholder

	db 100,  95, 105,  50, 120,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 10 ; catch rate
	db 218 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/ohmega/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
