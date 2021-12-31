	db 0 ; species ID placeholder

	db  75, 140, 100,  55,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/praxe/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
