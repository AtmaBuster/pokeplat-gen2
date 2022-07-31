# Pokemon Platinum Generation 2

Pokemon Platinum Generation 2 (referred to as "PPG2") is a project uses a modified version of pokecrystal16 
(specificallypokecrystal16-493-plus) as a base to recreate Pokemon Platinum for the Nintendo DS on exclusively Game Boy Color 
hardware in the style of Gold, Silver, and Crystal versions. Since the difference between the hardware is so massive, there 
are considerations and changes to graphical, map, music, and gameplay design. 

## FAQs

**Q1:** This game won't compile/run!
**A1:** PPG2 requires RGBDS version 0.4.2 to be compiled. Due to the expansion of the ROM/RAM sizes, we switched from the MBC3 mapper
to the MBC30 mapper. Most Game Boy emulators don't support this, because only Japanese Crystal ever used it, and it never addressed 
more than 2MB of ROM. We recommend the emulators BGB, SameBoy, and mGBA to play this on.

**Q2:** Why isn't [X] feature from the DS game here?
**A2:** Some features are cut or changed, either due to not being in line with the design of Generation 2, or because
the features are not possible to implement. Running wasn't a feature of Generation 2, and the maps were made smaller to
compensate for it. Contests, while possible, would take a massive amount of development time, and therefore, were replaced by
the Radio Tower to be more in line with Generation 2. This also provides a workaround for the lack of a dual-slot feature.

**Q3:** Why isn't [X] Pokemon in the game?
**A3:** PPG2 only contains Pokemon from Generations 1-4, with all forms present. There are also some unused beta Pokemon in 
the code for trade compatability, but are inaccessible in-game without debug features or trading. These are subject to 
removal. The same applies to moves, as all moves from Generations 1-4 are present and functional (with the exception of 
double-battle only moves, which are either removed or changed in functionality).

**Q4:** I like what you're doing! Can I help?
**A4:** It would be appreciated! We're looking for people who can work on new cries, move animations, music, and scripters. Because of 
cartridge space limitations, the sampled cry, or "DED" system from Pokemon Prism won't be feasible, so homemade cries within the 
original engine's limitations will have to be made. All music is made within the style of Generation 2, so things like volume envelopes 
and wavetable choices are considered. If you're looking to help, direct message TastySnax12 or Atma. 
