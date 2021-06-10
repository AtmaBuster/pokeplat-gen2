orbboost: MACRO
	db \1
	dw \2
	db \3, \4
ENDM

OrbBoosts:
	orbboost GRISEOUS_ORB, GIRATINA, DRAGON, GHOST
	orbboost ADAMANT_ORB,  DIALGA,   DRAGON, STEEL
	orbboost LUSTROUS_ORB, PALKIA,   DRAGON, WATER
	db -1
