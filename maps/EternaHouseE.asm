	object_const_def ; object_event constants

EternaHouseE_MapScripts:
	def_scene_scripts

	def_callbacks

EternaHouseE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ETERNA_CITY, 5
	warp_event  3,  7, ETERNA_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
