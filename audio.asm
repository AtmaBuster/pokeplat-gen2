INCLUDE "constants.asm"


SECTION "Audio", ROMX

INCLUDE "audio/engine.asm"
INCLUDE "data/trainers/encounter_music.asm"
INCLUDE "audio/music_pointers.asm"
INCLUDE "audio/music/nothing.asm"
INCLUDE "audio/cry_pointers.asm"
INCLUDE "audio/sfx_pointers.asm"


SECTION "Songs 1", ROMX

INCLUDE "audio/music/route36.asm"
INCLUDE "audio/music/rivalbattle.asm" ; Rival Battle (Barry's theme)
INCLUDE "audio/music/rocketbattle.asm"
INCLUDE "audio/music/rowanslab.asm" ; Professor Rowan's Theme
INCLUDE "audio/music/darkcave.asm"
INCLUDE "audio/music/sinnohgymbattle.asm" ; Sinnoh Gym Battle
INCLUDE "audio/music/championbattle.asm"
INCLUDE "audio/music/ssaqua.asm"
INCLUDE "audio/music/twinleaftown.asm" ; Twinleaf Town
INCLUDE "audio/music/goldenrodcity.asm"
INCLUDE "audio/music/vermilioncity.asm"
INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/music/ruinsofalphinterior.asm"
INCLUDE "audio/music/lookpokemaniac.asm"
INCLUDE "audio/music/trainervictory.asm"


SECTION "Songs 2", ROMX

INCLUDE "audio/music/route1.asm"
INCLUDE "audio/music/route3.asm"
INCLUDE "audio/music/route12.asm"
INCLUDE "audio/music/kantogymbattle.asm"
INCLUDE "audio/music/kantotrainerbattle.asm"
INCLUDE "audio/music/kantowildbattle.asm"
INCLUDE "audio/music/pokemoncenter.asm"
INCLUDE "audio/music/looklass.asm"
INCLUDE "audio/music/lookofficer.asm"
INCLUDE "audio/music/route2.asm"
INCLUDE "audio/music/mtmoon.asm"
INCLUDE "audio/music/showmearound.asm"
INCLUDE "audio/music/gamecorner.asm"
INCLUDE "audio/music/bicycle.asm"
INCLUDE "audio/music/looksage.asm"
INCLUDE "audio/music/specialprogram.asm" ; Special Program - Listening to Professor Rowan (Intro TV)
INCLUDE "audio/music/lighthouse.asm"
INCLUDE "audio/music/lakeofrage.asm"
INCLUDE "audio/music/indigoplateau.asm"
INCLUDE "audio/music/route37.asm"
INCLUDE "audio/music/rockethideout.asm"
INCLUDE "audio/music/dragonsden.asm"
INCLUDE "audio/music/ruinsofalphradio.asm"
INCLUDE "audio/music/lookbeauty.asm"
INCLUDE "audio/music/route26.asm"
INCLUDE "audio/music/ecruteakcity.asm"
INCLUDE "audio/music/lakeofragerocketradio.asm"
INCLUDE "audio/music/magnettrain.asm"
INCLUDE "audio/music/lavendertown.asm"
INCLUDE "audio/music/dancinghall.asm"
INCLUDE "audio/music/contestresults.asm"


SECTION "Songs 3", ROMX

INCLUDE "audio/music/route203.asm"
INCLUDE "audio/music/violetcity.asm"
INCLUDE "audio/music/route201.asm" ; Route 201
INCLUDE "audio/music/halloffame.asm"
INCLUDE "audio/music/healpokemon.asm"
INCLUDE "audio/music/evolution.asm"
INCLUDE "audio/music/printer.asm"


SECTION "Songs 4", ROMX

INCLUDE "audio/music/viridiancity.asm"
INCLUDE "audio/music/pokemart.asm"
INCLUDE "audio/music/wildpokemonvictory.asm"
INCLUDE "audio/music/successfulcapture.asm"
INCLUDE "audio/music/gymleadervictory.asm"
INCLUDE "audio/music/mtmoonsquare.asm"
INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/pallettown.asm"
INCLUDE "audio/music/profoakspokemontalk.asm"
INCLUDE "audio/music/profoak.asm"
INCLUDE "audio/music/lookrival.asm" ; Rival's theme (Barry)
INCLUDE "audio/music/aftertherivalfight.asm" ; Blank
INCLUDE "audio/music/surf.asm"
INCLUDE "audio/music/nationalpark.asm"
INCLUDE "audio/music/oreburghcity.asm"
INCLUDE "audio/music/cherrygrovecity.asm"
INCLUDE "audio/music/unioncave.asm"
INCLUDE "audio/music/sinnohtrainerbattle.asm" ; Sinnoh Trainer Battle
INCLUDE "audio/music/lookyoungster.asm"
INCLUDE "audio/music/tintower.asm"
INCLUDE "audio/music/sprouttower.asm"
INCLUDE "audio/music/burnedtower.asm"
INCLUDE "audio/music/mom.asm"
INCLUDE "audio/music/victoryroad.asm"
INCLUDE "audio/music/pokemonlullaby.asm"
INCLUDE "audio/music/pokemonmarch.asm"
INCLUDE "audio/music/goldsilveropening.asm"
INCLUDE "audio/music/goldsilveropening2.asm"
INCLUDE "audio/music/lookhiker.asm"
INCLUDE "audio/music/lookrocket.asm"
INCLUDE "audio/music/rockettheme.asm"
INCLUDE "audio/music/mainmenu.asm"
INCLUDE "audio/music/lookkimonogirl.asm"
INCLUDE "audio/music/pokeflutechannel.asm"
INCLUDE "audio/music/bugcatchingcontest.asm"


SECTION "Songs 5", ROMX

INCLUDE "audio/music/mobileadaptermenu.asm"
INCLUDE "audio/music/buenaspassword.asm"
INCLUDE "audio/music/lookmysticalman.asm"
INCLUDE "audio/music/crystalopening.asm"
INCLUDE "audio/music/battletowertheme.asm"
INCLUDE "audio/music/suicunebattle.asm"
INCLUDE "audio/music/battletowerlobby.asm"
INCLUDE "audio/music/mobilecenter.asm"
INCLUDE "audio/music/sinnohwildbattle.asm"       ; Sinnoh Wild Battle (Day)
INCLUDE "audio/music/sinnohwildbattlenight.asm"  ; Sinnoh Wild Battle (Night)


SECTION "Extra Songs 1", ROMX

INCLUDE "audio/music/credits.asm"
INCLUDE "audio/music/clair.asm"
INCLUDE "audio/music/mobileadapter.asm"


SECTION "Extra Songs 2", ROMX

INCLUDE "audio/music/postcredits.asm"


SECTION "Sound Effects", ROMX

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "audio/sfx_crystal.asm"


SECTION "Cries", ROMX

INCLUDE "data/pokemon/cries.asm"

INCLUDE "audio/cries.asm"
