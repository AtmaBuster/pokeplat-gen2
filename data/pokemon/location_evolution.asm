LocationEvolutionTable:
	dw .moss_rock
	dw .ice_rock
	dw .magnet_field

.moss_rock
	db ILEX_FOREST
	db ROUTE_2
	db -1

.ice_rock
	db ICE_PATH
	db -1

.magnet_field
	db POWER_PLANT
	db -1
