	db 0 ; species ID placeholder
	
	db  70, 110, 135,  65,  65,  90
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 45 ; catch rate
	db 175 ; base exp
	db NO_ITEM, THICK_CLUB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/guardia/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
