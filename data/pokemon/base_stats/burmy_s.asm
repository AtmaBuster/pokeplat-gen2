	db 0 ; species ID placeholder

	db  40,  29,  45,  36,  29,  45
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 120 ; catch rate
	db 45 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/burmy_s/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm SNORE 
	; end
