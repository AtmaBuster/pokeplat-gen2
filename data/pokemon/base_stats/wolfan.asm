	db 0 ; species ID placeholder

	db 70,  60,  50,  55,  70,  60
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 170 ; catch rate
	db 75 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wolfan/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
