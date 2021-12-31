	db 0 ; species ID placeholder

	db  45,  45,  35,  20,  20,  30
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/wurmple/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm SNORE 
	; end
