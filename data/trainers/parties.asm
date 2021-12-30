; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

SECTION "Enemy Trainer Parties 1", ROMX

FalknerGroup:
	end_list_items

WhitneyGroup:
	end_list_items

BugsyGroup:
	end_list_items

MortyGroup:
	end_list_items

PryceGroup:
	end_list_items

JasmineGroup:
	end_list_items

ChuckGroup:
	end_list_items

ClairGroup:
	end_list_items

Rival1Group:
	next_list_item ; RIVAL1 (1)
	db "BARRY@", TRAINERTYPE_NORMAL
	db  5
	dw TURTWIG
	db -1 ; end

	next_list_item ; RIVAL1 (2)
	db "BARRY@", TRAINERTYPE_NORMAL
	db  5
	dw CHIMCHAR
	db -1 ; end

	next_list_item ; RIVAL1 (3)
	db "BARRY@", TRAINERTYPE_NORMAL
	db  5
	dw PIPLUP
	db -1 ; end
	end_list_items

PokemonProfGroup:
	end_list_items

WillGroup:
	end_list_items

PKMNTrainerGroup:
	end_list_items

BrunoGroup:
	end_list_items

KarenGroup:
	end_list_items

KogaGroup:
	end_list_items

ChampionGroup:
	end_list_items

BrockGroup:
	end_list_items

MistyGroup:
	end_list_items

LtSurgeGroup:
	end_list_items

ScientistGroup:
	end_list_items

ErikaGroup:
	end_list_items

YoungsterGroup:
	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:
	end_list_items

BirdKeeperGroup:
	end_list_items

LassGroup:
	end_list_items

JanineGroup:
	end_list_items

CooltrainerMGroup:
	end_list_items

CooltrainerFGroup:
	end_list_items

BeautyGroup:
	end_list_items

PokemaniacGroup:
	end_list_items

GruntMGroup:
	end_list_items

GentlemanGroup:
	end_list_items

SkierGroup:
	end_list_items

TeacherGroup:
	end_list_items

SabrinaGroup:
	end_list_items

BugCatcherGroup:
	end_list_items

FisherGroup:
	end_list_items

SwimmerMGroup:
	end_list_items

SwimmerFGroup:
	end_list_items

SailorGroup:
	end_list_items

SuperNerdGroup:
	end_list_items

Rival2Group:
	end_list_items

GuitaristGroup:
	end_list_items

HikerGroup:
	end_list_items

BikerGroup:
	end_list_items

BlaineGroup:
	end_list_items

BurglarGroup:
	end_list_items

FirebreatherGroup:
	end_list_items

JugglerGroup:
	end_list_items

BlackbeltGroup:
	end_list_items

ExecutiveMGroup:
	end_list_items

PsychicGroup:
	end_list_items

PicnickerGroup:
	end_list_items

CamperGroup:
	end_list_items

ExecutiveFGroup:
	end_list_items

SageGroup:
	end_list_items

MediumGroup:
	end_list_items

BoarderGroup:
	end_list_items

PokefanMGroup:
	end_list_items

KimonoGirlGroup:
	end_list_items

TwinsGroup:
	end_list_items

PokefanFGroup:
	end_list_items

RedGroup:
	end_list_items

BlueGroup:
	end_list_items

OfficerGroup:
	end_list_items

GruntFGroup:
	end_list_items

MysticalmanGroup:
	end_list_items
