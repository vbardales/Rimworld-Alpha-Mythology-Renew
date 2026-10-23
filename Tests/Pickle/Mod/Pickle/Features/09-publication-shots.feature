# Workshop pictures: one staged story, played on the shared fixture of every mod's gallery, Nelim's sanctuary (PickleTools docs/GALERIE.md and
# docs/SANCTUAIRE-LIEUX.md). Rewritten 2026-10-05 for the sanctuary, then again 2026-10-07 after PUBLISHING.md's gallery rules (2026-10-06).
# NOT TO BE FILED before the Sanctuary Backlot's own suite has run green and its session says the fixture is ready (the Backlot's STATUS: its steps are
# compiled, not yet played by a mod): until then `Nelims-tribe` may not be where the load looks and these scenarios fail on it.
#
# WHICH STEPS ARE WHOSE (2026-10-08: the Sanctuary has its own repository, Nelim's Sanctuary Backlot, packageId nelim.sanctuarybacklot):
#   Nelim's Sanctuary:     the named places and the fixture's own work. Used here: `I am at the sanctuary "<place>"`. Also available: empty a place, bare its
#                          floor, remove the animals or keep them out, remove the roof, give a gene. Staged by the line `nelim.sanctuarybacklot path:SanctuaryBacklot/Mod`
#                          of wsl-deps.sanctuary.map, which also carries the save `Nelims-tribe`.
#   Nelim's Pickle Tools:  the generic tools, still NPT's: the animal step (`an adult animal of kind ... is spawned at (x, z)`), `studio presentation mode is enabled`,
#                          `developer mode is turned off for the capture` / `restored`, and `I let N ticks pass` (a 240 s timeout: Pickle's own `I wait N ticks`
#                          times out at 5 s on a loaded machine, so it is kept only for the 30-tick pause).
#   Pickle's own:          the save load, `game speed is paused`, `I close all dialogs`, `I set the hour to`, `I set the weather to`, `I take a screenshot`, `no errors were logged`.
#                          Faces (NPT, ColonistRace, 2026-10-08): the temperature of the map is held at 20 degrees and 10 ticks pass BEFORE Nelim is placed (the scene is paused,
#                          nothing is recalculated otherwise), then `"Nelim" facial expression is "normal+<animation>"`: the `normal` prefix clears the heat face (sweat, pink cheeks), and the capture follows at once.
#   This mod's own:        `Alpha Mythology Renew ...` (GallerySteps.cs: the check of the creature, dismissing letters, the framing at zoom 5, the settings window).
#
#
# THE STORY. "A noon in the sanctuary": eight mythical creatures of Alpha Mythology come to Nelim's sanctuary one after the other, between noon and
# 12:35, and each settles in the corner that suits it, and Nelim (Virginie) goes to meet every one, in a different top each time. Then the window that lets the visitor choose which of them
# may appear in the wild. Rhythm: 5 game minutes between two pictures (about 208 ticks), clear weather. The save is 23:00: every scenario sets the hour
# to 12, lets the time of its own picture go by (set-up 60 ticks, plus 208 per picture already told), then poses the creature. REWRITTEN 2026-10-15 after
# the owner's question "do the pictures match the story?": the first pictures were framed too tight (zoom 3 to 3.5, seven cells high: no place left in the frame),
# the creature was left free to wander during the 30 ticks, and most of the "living around it" of the plan was never spawned. Now: zoom 5 to 7, the creature is
# pinned to its cell (`the animal ... stands at ... facing South`), and every companion named below is spawned by the scenario, not hoped for.
# The cells below were read on the places' own empty photographs (SanctuaryBacklot/evidence/places-current), not guessed.
#
# REWORK 2026-10-23, after the director's reading of the eight candidates (owner asked to rework the scenario; captures read in Art/Gallery-clean):
#   Hair: Nelim wears the high ponytail `Roo_HD_Hair_Highpony` (owner, 2026-10-23; NELIM-PROFIL.md), set in every scenario by `"Nelim" hairstyle is` right after her top; map line `rooboid.hdhair.continued` added to wsl-deps.sanctuary.map. Nothing else in the run changes her hair.
#   Reading: at zoom 5 to 7 her face is a few pixels, so the named expressions do not read (kappa at zoom 4 is the one where it nearly does). Only the griffin and the phoenix are reframed here (zoom 5, Nelim about 3 and 2 cells away); pegasus, kitsune, hound, unicorn, manticore keep zoom 5 or 6 and their expression stays set but unreadable: the pose, the offering and the top colour carry the picture.
#   1 griffin: the right wing touched a small statue one cell east; griffin moved one cell west (153, 97), Nelim at (150, 97), zoom 5, griffin shown 1 cell left. Read by NSB 2026-10-23: the green object is the fixture SculptureGrand at (149, 94), kept (theme); the smudge is terrain or a pawn shadow, no thing; the hair default of the save is Victoria, so the hairstyle step stays needed.
#   3 pegasus: Nelim stood on dry reeds in the grey water, little contrast; a patch of Soil (180-183, 173-175) is laid and she stands on (182, 174), a cell with no reed or grass (NSB: the grass is at (180, 174) and (181, 173-174); soil laid under a plant does not remove it, so the first fix was not enough).
#   5 phoenix (the weakest: small subject in a busy hall, Nelim lost, thrumbo and cat out of frame): zoom 5 instead of 7, phoenix shown 1 cell left, Nelim at (177, 116) two cells closer, a cat "Ember" at (177, 113) in the frame (176 holds a daylily pot, NSB). The thrumbo of the hall is not in frame at zoom 5, not forced.
#   Kept as read: 2 kappa, 4 hound (dark on dark wood, risk kept: the heads read), 6 kitsune, 7 unicorn, 8 manticore.
#   REWORK 2 2026-10-23 (owner: rework 3, 4, 5, 6; cells read in SanctuaryBacklot SANCTUAIRE-CASES.md and NSB's answers):
#   3 pegasus: Nelim on (181, 175), a cell with no plant (reeds x=179, grass (180-181, 173-174), bulrush (181, 176)) on the Soil patch; zoom 4 (was 5) so the winged horse and her face are larger.
#   4 kitsune: zoom 3 (was 6), shown 1 cell left: the frame is 6 cells high, so the DarklightBrazier at (144, 70), 4 cells above the fox, falls outside it without any hide step; the fox and Nelim are twice as big.
#   5 phoenix: zoom 4 (was 5); the phoenix stands on the grey hearth stones (180-182, 114-116) read on the first capture, red on grey, Nelim 3 cells away, cat at (177, 113) (free per the list).
#   6 hound: the black hound on dark wood did not stand out; a strip of `TileSandstone` (176-183, 127-128, name from vanilla terrain, to be read: the step fails with the known names if wrong) is laid under it, and Nelim's top is sky blue (90, 150, 210) instead of cream, which would vanish on pale tile.
#   REWORK 3 2026-10-23 (owner: use the Backlot's own pets, SanctuaryBacklot CATALOGUE-ANIMAUX.md, instead of spawning cats, dogs and thrumbos): the fixture animals are moved with `the animal "<name>" stands at (x, z) facing South`, never spawned. 4 kitsune: Tama (Miel's Norwegian Forest Cat, long brown tabby and white) at (143, 65) and Shogun (Nelim's sand labrador) at (135, 64). 5 phoenix: Kuru (black cat) at (177, 113) and Atticus (Nelim's snow-white thrumbo) at (183, 113), white against the red bird. 6 hound: Yuki (grey and white husky, fuchsia collar) at (172, 127) and Shogun at (187, 126); the labrador that was spawned under the name Shogun is gone (the fixture already has one). Risk: a pet standing in a place when its scenario empties it (`the animals are removed from the sanctuary`) is despawned and cannot be moved: asked of NSB where the pets live. Wild or farm animals (donkey, hare, swan, duck, sparrows, herons, chickens) stay spawned: the fixture has no pet of those kinds.
#   REWORK 3 CORRECTED after NSB's answer (positions read from the save): Tama and Kuru are NOT in the save (canon only; the save has two cats named "Cat 1", one at (153, 93) next to the statue-garden), so the cats of scenes 4 and 5 are spawned again (Miso, Ember, kind Cat). Kept from the fixture: Shogun (177, 99), Yuki (171, 145), Atticus (189, 171), none inside a place that a scenario of this feature empties (statue-garden and flower-garden would catch the cat at (153, 93)). Order rule: `the animal "<name>" stands at` comes AFTER the empty step of its scenario. Unverified: whether that step finds a pet that was in the save (NSB, PickleTools steps.md l.130); the replay of scenes 4, 5, 6 tells, and a failure names the step.
#   REWORK 4 2026-10-23 (owner: rework everything after the confidence rating; the caps of the rating, a fix never played and an anomaly not yet corrected, lift only on a replay):
#   Hair: after `hairstyle is`, `the appearance of "Nelim" is logged` writes the drawn hair to the log, so the replay READS it instead of assuming it.
#   3 pegasus moved to the brown earth bank west of the water garden (SANCTUAIRE-LIEUX.md: bank x 143-158, z 168-176, burrow to avoid at (149, 173)): pegasus (152, 172), Nelim (156, 171) facing West, daylilies (150, 170) and (154, 174), a swan on the water at (160, 171); pale horse on brown earth against the water, no soil patch needed. Cells of the bank not yet read in a plant list (asked of NSB).
#   2 kappa: zoom 3 (was 4), swan (121, 69) and duck (121, 65) pulled in so they stay inside the 6-cell-high frame.
#
#   REWORK 4 CORRECTED by NSB's read of the bank (terrain from the save's top grid, ids inferred, to confirm on a capture): earth at z 171 is x 146-156, z 172 x 145-155, z 170 x 147-156; (154, 174) is water and (156, 172) is water with a lily. Scene 3 now: pegasus (154, 171), Nelim (152, 172) facing East holding hay, daylilies (150, 170) and (156, 170), swan on the water at (158, 171), frame zoom 4 centred on the pegasus (water to its east, brown earth around). A steam geyser stands at (149, 173), kept out of the way. Four wild animals live on the bank west of x 153 (Chinchilla, Snowhare, Armadillo, Panda at about (150-151, 171-173)) and wander once ticks pass: the removal of `water-garden` reaches x >= 153 only, so they may drift into the frame (living documentary, or a risk of overlap with Nelim: read on the replay).
#   REWORK 4 CORRECTED AGAIN by NSB (terrain ids resolved by hash): the bank "earth" is MossyTerrain (moss green, not brown; SANCTUAIRE-LIEUX.md was wrong or meant the moss colour), the pools are WaterShallow, WaterDeep cells (156, 174), (155-157, 175), (154-158, 176) are not standable. Cells unchanged and land: (152, 172), (156, 171), (150, 170); (154, 174) is shallow water, (160, 171) shallow and walkable. The contrast of scene 3 is now a pale horse on moss green beside blue-grey water, not on brown: read on the capture.
#   REWORK 6 2026-10-23 (owner: again, scenes 1 to 6; the paper is nearly exhausted, what is left needs the replay): scene 3 frame "shown 3 cells left" puts the camera at x 157, the visible x range is about 149.9 to 164.1, so the steam geyser at (149, 173) leaves the frame and the water gets the right half; the daylily moves to (152, 170) so it is not cut by the left edge. The other five scenes keep their cells and zooms: the remaining doubts (small subject on 2 and 5, contrast on 3 and 6, `stands at` on save pets, `TileSandstone`, zoom 3) can only be settled by a play, the probe scenario at the end settles three of them.
#   REWORK 7 2026-10-23 (owner: work shot 1): the griffin scene goes to zoom 3 so that Nelim's face and the offering read (at zoom 5 the face was a few pixels): frame 6 cells high, griffin centred, Nelim at (150, 97) three cells to its left, hare Fennel (151, 98) beside her, donkey Pilar moved to (157, 98) (the old (159, 98) leaves the frame), statues SculptureSmall (152, 99) and (155, 97) and the daylily (156, 99) stay inside. Still open: the visible action of Nelim (NPT is writing a forced-job step, then this scene uses it); zoom 3 not yet played in this feature (the probe does not frame it, the kitsune scene does).
#   REWORK 5 2026-10-23 (rate-gallery found criterion b weak on 2, 3, 7, 8 and f weak on 1 to 5): the decor sets now differ from one scene to the next (1 sculpture + daylily; 2 tall yellow grass + stool; 3 daylily + tall yellow grass; 7 bonsai pot + daylily; 8 sculpture + tall yellow grass; 4 torch + bonsai; 5 torch + brazier; 6 stool + bonsai), only defNames played and read in GALLERY-PROPS.md; the shot plan lines of 1 to 5 carry the zooms and cells of the scenarios. Not played, so no cap lifts.
#
# SHOTLIST 2026-10-23 (write-shotlist, director's pass by an Opus sub-agent; it SUPERSEDES the story and the shot plan below, whose scenarios are rewritten after the tickets df08 and 6ea8 return, so the steps of the eight scenarios below are still the previous version):
# STORY. One clear day, 4 September 5500, noon to dusk: every creature of Alpha Mythology finds its place in Nelim's sanctuary. Nelim (Virginie) keeps ONE outfit all day, a deep-blue top (36, 72, 140), grey trousers, high ponytail Roo_HD_Hair_Highpony, brown eyes: the day is six hours, nothing in the story makes her change. Hours by `I set the hour to N`: 12:00, 12:40, 13:30, 14:30, 15:30, 16:30, 17:15, 18:00 (the light moves on, the last image is dusk). Weather Clear.
# SERIES. Opening, wide: 1 griffin (zoom 6). Medium: 2 kappa, 3 pegasus, 5 phoenix, 6 hound (zoom 4 to 5), 7 unicorn. Close: 4 kitsune (head of Nelim and fox, root size 3). Closing, wide: 8 manticore (zoom 6, dusk). Jobs vary (haul, Tame, Refuel, Harvest), subject side varies. Thumbnail rule (268 px wide): the creature fills about a third of the frame height.
# EACH SHOT: gesture of Nelim; what the creature does; the instant (what just happened, what comes next); how it is obtained (job through "is forced into the job", pause on the tick where the carried item, work effect or bubble is drawn, that tick is read on probe 2).
#  1 griffin, statue-garden 12:00, z6 wide: Nelim walks toward the griffin carrying meat (HaulToCell Meat_Muffalo to a cell beside it, paused 2 cells away); it turns its head to her; she has just come in, she is about to hold out the meat. Decor SculptureSmall (152, 99), Plant_Daylily (156, 99); donkey, hare; griffin seen from the front.
#  2 kappa, fishing-zone 12:40, z2.5 (frame 5 cells high, the kappa about 30 px high on a 268 px thumbnail, its green shell against the bank; Nelim 3 cells away stays in frame), expression moodCheerful, says: "The water spirit has come out of the pond and Nelim greets it.": Nelim faces the kappa on the bank, Tame bubble over her head; the kappa turned toward her; the interaction has just begun, it will accept or flee. Job Tame, pause on the bubble tick. Decor Plant_YellowTallGrass (124, 66), Stool (123, 69); swan, duck.
#  3 pegasus, water-garden moss bank 13:30, z4, subject right of centre: Nelim carries hay along the bank toward the pegasus, which faces her; she is about to reach it. HaulToCell Hay, paused mid-walk. Decor Plant_Daylily (152, 170), Plant_YellowTallGrass (156, 170); swan.
#  4 kitsune, tea-room door 14:30, close (root size 3, `the camera frames the head of "Nelim" and "Inari"`): Nelim and the fox face to face at the door, fox seen from the front, her face readable with her set expression; the fox has just come to the door, she is about to speak to it. Job Tame (guess; Train as fallback). Decor TorchLamp (143, 67) lit, PlantPot_Bonsai (139, 64); cat Miso, Shogun by the wall.
#  5 phoenix, fire-pit hall 15:30, z4: Nelim carries a log to the campfire, the phoenix on the grey hearth stones beside the flames; she is about to put it on the fire. Job Refuel on the campfire, paused with the wood in her hands. Decor TorchLamp (178, 117), Brazier (183, 117) lit; cat Ember (177, 113). Atticus dropped (asleep needs a second job).
#  6 hound, cloister 16:30, z5, subject left of centre: Nelim drags a sack of kibble toward the hound, Yuki and Shogun follow her; she is about to set it down. HaulToCell Kibble, paused mid-walk. Decor Stool (175, 127), PlantPot_Bonsai (186, 127); no sandstone strip (it looked like a set).
#  7 unicorn, plant-garden 17:15, z3 (frame 6 cells high, the unicorn about 1.5 cells, a quarter of the height, white against the dark soil), expression moodCheerful2, says: "While Nelim picks berries, the unicorn comes to the fence to see her.": Nelim picks berries behind the fence, work effect drawn; the unicorn wanders on the far side, sparrows in the plants; she has just picked the first, the unicorn is coming to the fence. Job Harvest on a grown berry bush placed for the shot. Decor PlantPot_Bonsai (186, 88), Plant_Daylily (191, 86).
#  8 manticore, rice-paddies 18:00 dusk, z5 wide (frame 10 cells high, the manticore about 1.5 cells, a seventh of the height but the only dark winged silhouette on pale soil, about 40 px on the thumbnail; the paddies fill the rest), expression NLR-Smile, says: "At dusk the last visitor watches the paddies while Nelim finishes the harvest.": Nelim harvests rice with her back to the manticore, which watches from the bank, herons and chickens in the rice; the day is ending, nothing will happen. Job Harvest on the rice. Decor SculptureSmall (220, 115), Plant_YellowTallGrass (224, 121).
# RISKS (unplayed, written for the probe 2): Tame, Refuel and Harvest are guesses; HaulToCell with an item; a berry bush and the rice as Harvest targets; the head-framing step needs SimpleCameraSetting staged; a pose frozen mid-gesture needs ticks while the game runs, then pause. Herons: present in the save (5).
# THE STORY IN ONE PARAGRAPH (criterion k, 2026-10-18). WHO: Nelim, the sanctuary's keeper, and eight creatures of Alpha Mythology who come to her one after the other, each with an offering from her hands.
# WHERE: Nelim's sanctuary. WHEN: one clear day, the 4th of September 5500 (the date of the save), from noon to 12:35, five game minutes between two episodes. EPISODES, each one moving on from the last:
# she meets the griffin among the statues (12:00), carries a meal to the kappa at its pond (12:05), holds hay out to the pegasus at the water garden (12:10), walks to the tea room where the kitsune waits (12:15),
# feeds the hearth for the phoenix (12:20), calms the three-headed hound on the gallery (12:25), follows the unicorn through the plant garden (12:30), and ends on the bank where the manticore watches the paddies (12:35).
# Then the settings window (9 and 10), where the visitor chooses which of them may appear in the wild.
# SHOT PLAN (place, time, subject, composition, the living around it, what the picture says; zoom = half-height in cells):
# 1. statue-garden, 12:00, MM_Griffin "Aurelia" at (153, 97), zoom 3 (frame 6 cells high, about x 148 to 158.5), Nelim 3 cells to its left with her face about 180 px high: the griffin on the bare earth between the large head-statue (149, 95) on its left and the deer statue (160, 94) on its right, statue pieces and the pawn statues around; living: a donkey and a hare placed on purpose (the wandering animals are removed first: a cat overlapped the wing in series 3); says: the griffin settles among the statues, a statue that moved.
# 2. fishing-zone, 12:05, MM_Kappa "Ondine" at (122, 67), zoom 3, on the east bank of the round pond; living: Nelim standing on the bank looking at it (smile "normal+moodCheerful"), a swan and a duck on the shallow rim of the pond; says: the water spirit sits on the bank of the round pond and Nelim has come to see it.
# 3. water-garden, 12:10, MM_Pegasus "Zephyra" at (154, 171), zoom 4, on the moss bank west of the pools, the water to the east; living: a swan on the water and the bank's own wild animals; says: the winged horse stands at the bank and Nelim brings it hay.
# 4. tea-room (the hut, door on the south side at (140, 68)), 12:15, MM_Kitsune "Inari" at (138, 66) left of the door, outside, zoom 3, the cabin wall at the top of the frame; living: Nelim on the step at (141, 66) facing the fox (smile "normal+moodCheerful2", set last), a cat Miso and Shogun, Nelim's labrador, moved by the wall; says: the fox spirit waits at the door of the tea room and Nelim comes out to it.
# 5. fire-pit, 12:20, MM_Phoenix "Cinder" at (180, 115), zoom 4 (the cell of the campfire, 181, is not standable), on the grey hearth stones; living: Atticus, Nelim's white thrumbo, moved to (183, 113), and a cat Ember at (177, 113); says: the firebird lights the hall as a second hearth.
# 6. cloister, 12:25, MM_Cerberus "Balthazar" at (179, 127), zoom 6, on the wooden gallery in front of the house, three heads turned to the garden; living: Yuki, the husky, and Shogun, the labrador, moved to wary distance on the same boards; says: the three-headed hound keeps the gallery. (The first hound, alone in a meadow at the gravel yard, was dropped on 2026-10-12 as too weak and small; this one is a new place.)
# 7. plant-garden, 12:30, MM_Unicorn "Morwen" at (190, 87), zoom 5, between two rows of plants, the fence behind; living: three sparrows in the plants; says: the unicorn walks the fenced plant garden.
# 8. rice-paddies, 12:35, MM_Manticore "Thessaly" at (226, 117), zoom 6; the rice of the clearing is grown to harvest first (the fixture has seedlings), the macaw and the other wanderers are removed, two herons and three chickens are placed; says: the manticore watches the paddies from the bank.
# NELIM (the only colonist, Virginie) is in all eight creature pictures (owner rule 2026-10-14: protagonist of the series; reworked 2026-10-16). She keeps what the owner chose
# for her: hair in a high ponytail (`Roo_HD_Hair_Highpony`, owner, 2026-10-23, as in NELIM-PROFIL.md; the save's own hair is Victoria, `"Nelim" hairstyle is` sets it in every scenario and `the appearance of "Nelim" is logged` writes it to the log), dark brown eyes, grey trousers. What changes per scene is the top (`Apparel_BasicShirt` dyed in a colour that stands out from the place and the creature),
# where she stands (about four cells from the creature, turned towards it or towards the visitor) and her expression, set last, right before the capture, after the map is held at
# 20 degrees (no heat face) and her own face is set (two brows, smirk smile, blink). No other pawn: the visitors are the creatures.
#   1 griffin: teal top, NLR-Open (wonder), (150, 97) facing East   2 kappa: coral top, moodCheerful, (125, 69) facing West   3 pegasus: saffron top, NLR-Smile, (152, 172) facing East
#   4 kitsune: indigo top, moodCheerful2, (141, 66) facing West      5 phoenix: green top, NLR-Open, (177, 116) facing East     6 hound: sky-blue top, SocialRelax (calm among wary dogs), (183, 128) facing West
#   7 unicorn: plum top, moodCheerful2, (188, 87) facing East        8 manticore: crimson top, NLR-Smile, (222, 117) facing East
# Cells beside the creature are read from the place lists, not from a photograph: a step that says "not standable" names the cell to move.
# 9. window-backdrop-for-height, the settings window, a plain screen capture of what it is, the interface on and developer mode off so that its toolbar is not in the picture.
# 10. podium (197, 152), 12:45, Griffin beside the window: the creature list scrolled to its end (the window shows about 16 of the 25 creatures: the rows below Phoenix are here, the rows above are in 9).
#
# SHOTLIST AGAINST GALLERY.md a to j (2026-10-18). Common to the eight creature scenes: a = noon sanctuary, clear weather, game time passes (60 ticks of set-up plus 208 per picture
# already told); c = a companion animal or plant in each; d = Nelim in a top of her own colour (above), her high ponytail (owner, 2026-10-23), the expression named in the plan, set last; i = one subject, never a row;
# j = the creature of the mod is the subject. Per scene, what Nelim does (e), the decor placed by this scenario and removed after the shot (b), the line the image says (g), the risk and the plan against it (h).
# Decor cells are read on the places' photographs; a decor step that names a blocked cell fails and names it: the plan is then to move the prop one cell, never to drop it.
#   1 griffin: Nelim brings it meat (carries Meat_Muffalo); SculptureSmall (152, 99) and a grown daylily (156, 99); griffin centred, Nelim 3 cells to its left (zoom 3: her face reads); "A griffin settles among the statues and Nelim brings it meat." Risk: a donkey or hare overlaps the wing; plan: the donkey stands at 4 cells (157, 98), the hare beside Nelim (151, 98), animals of the place removed first.
#   2 kappa: Nelim brings a meal to the bank (carries MealSimple); tall yellow grass (124, 66) and a stool (123, 69), swan and duck on the rim; "The water spirit sits on the bank and Nelim has come to see it." Risk: small subject; plan: zoom 3, off-centre 2 left, swan and duck pulled in so the 6-cell frame holds them.
#   3 pegasus: Nelim holds out hay (carries Hay); daylily (152, 170), tall yellow grass (156, 170), a swan on the water; "The winged horse stands at the bank and Nelim brings it hay." Risk: wild animals of the bank drift into the frame; plan: the east part is emptied first, the replay reads the rest.
#   4 kitsune: Nelim comes out of the hut with a fine meal (carries MealFine); TorchLamp lit (143, 67), bonsai pot (139, 64), a cat and a labrador by the wall; "The fox spirit waits at the door of the tea room and Nelim comes out to it." Risk: painted zone visible on the ground; plan: `the painted zones are hidden` (NPT 124c3e2).
#   5 phoenix: Nelim feeds the hearth (carries WoodLog); TorchLamp (178, 117) and Brazier (183, 117), both lit; "The firebird lights the hall as a second hearth." Risk: heat face, lit lamps washed out at noon; plan: map held at 20 degrees, 10 ticks before Nelim, the lamps seen against the hall interior.
#   6 hound: Nelim calms the dogs with kibble (carries Kibble); stool (175, 127) and bonsai pot (186, 127), two labradors kept at a distance; "The three-headed hound keeps the gallery and Nelim brings kibble to the wary dogs." Risk: three heads read as one blob; plan: zoom 6, heads turned to the garden, the subject alone on the boards.
#   7 unicorn: Nelim holds out berries (carries RawBerries); bonsai pot (186, 88), daylily (191, 86), three sparrows; "The unicorn walks the fenced plant garden and Nelim follows with berries." Risk: cell not standable (red three times); plan: `stands on the nearest free cell around` for Nelim and the animal (NPT 124c3e2), painted zones hidden.
#   8 manticore: Nelim brings pemmican to the bank (carries Pemmican); SculptureSmall (220, 115), tall yellow grass (224, 121), herons and chickens; "The manticore watches the paddies from the bank." Risk: rice not grown, painted zone; plan: the plants step on the whole clearing and `the painted zones are hidden`.
#   9 and 10 settings window: interface scenes at the centre of the screen, set aside from the rating (AUDIT); 10 now shares the window backdrop of 9, with presentation mode.
# Kept from the earlier versions: spawned adult on the player's side by PickleTools' own animal step, framed by this mod's own step (it lowers the camera
# floor), facing south, the creature names do not exist in the fixture. After the run, every picture is opened and read against this plan; an anomaly that
# comes from the scene or from the shared tool is described to Pickle Tools with the capture, never worked around here.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
Feature: Workshop pictures

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I close all dialogs
    And I set the hour to 12
    And I set the weather to "Clear"

  Scenario: the griffin among the statues
    When Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "statue-garden"
    And Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (153, 97)
    And Nelim's Pickle Tools: an adult animal of kind "Donkey" named "Pilar" is spawned at (157, 98)
    And Nelim's Pickle Tools: an adult animal of kind "Hare" named "Fennel" is spawned at (151, 98)
    And Nelim's Pickle Tools: I place the decor "SculptureSmall" at (152, 99)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (156, 99)
    And Nelim's Pickle Tools: the plants from (156, 99) to (156, 99) are fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (40, 120, 125)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (150, 97) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Meat_Muffalo"
    Then Alpha Mythology Renew the creature "Aurelia" is standing on the map as "MM_Griffin"
    When Nelim's Pickle Tools: the animal "Aurelia" stands at (153, 97) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 3, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Open"
    Then I take a screenshot "workshop-1-the-griffin-among-the-statues"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the kappa by the pond
    When Nelim's Pickle Tools: I let 268 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fishing-zone"
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kappa" named "Ondine" is spawned at (122, 67)
    And Nelim's Pickle Tools: an adult animal of kind "Swan" named "Perle" is spawned at (121, 69)
    And Nelim's Pickle Tools: an adult animal of kind "Duck" named "Plume" is spawned at (121, 65)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (124, 66)
    And Nelim's Pickle Tools: I place the decor "Stool" at (123, 69)
    And Nelim's Pickle Tools: the plants from (124, 66) to (124, 66) are fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (224, 112, 96)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (125, 69) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "MealSimple"
    Then Alpha Mythology Renew the creature "Ondine" is standing on the map as "MM_Kappa"
    When Nelim's Pickle Tools: the animal "Ondine" stands at (122, 67) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "fishing-zone"
    And Alpha Mythology Renew frames the animal "Ondine" at zoom 3, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful"
    Then I take a screenshot "workshop-2-the-kappa-by-the-pond"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the pegasus at the water garden
    When Nelim's Pickle Tools: I let 476 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "water-garden"
    And Nelim's Pickle Tools: an adult animal of kind "MM_Pegasus" named "Zephyra" is spawned at (154, 171)
    And Nelim's Pickle Tools: an adult animal of kind "Swan" named "Perle" is spawned at (158, 171)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (152, 170)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (156, 170)
    And Nelim's Pickle Tools: the plants from (152, 170) to (152, 170) are fully grown
    And Nelim's Pickle Tools: the plants from (156, 170) to (156, 170) are fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (232, 170, 60)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (152, 172) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Hay"
    Then Alpha Mythology Renew the creature "Zephyra" is standing on the map as "MM_Pegasus"
    When Nelim's Pickle Tools: the animal "Zephyra" stands at (154, 171) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    And Alpha Mythology Renew frames the animal "Zephyra" at zoom 4, shown 3 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Smile"
    Then I take a screenshot "workshop-3-the-pegasus-at-the-water-garden"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the kitsune at the tea room
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 184 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "tea-room"
    And Nelim's Pickle Tools: I lay the floor "Soil" from (130, 56) to (150, 65)
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kitsune" named "Inari" is spawned at (138, 66)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (143, 65)
    And Nelim's Pickle Tools: the animal "Shogun" stands at (135, 64) facing South
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (143, 67)
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (139, 64)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (143, 67) is lit
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (52, 70, 130)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (141, 66) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "MealFine"
    Then Alpha Mythology Renew the creature "Inari" is standing on the map as "MM_Kitsune"
    When Nelim's Pickle Tools: the animal "Inari" stands at (138, 66) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "tea-room"
    And Nelim's Pickle Tools: the painted zones are hidden
    And Alpha Mythology Renew frames the animal "Inari" at zoom 3, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful2"
    Then I take a screenshot "workshop-4-the-kitsune-at-the-tea-room"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the phoenix in the hearth hall
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 392 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Phoenix" named "Cinder" is spawned at (180, 115)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Ember" is spawned at (177, 113)
    And Nelim's Pickle Tools: the animal "Atticus" stands at (183, 113) facing South
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (178, 117)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (183, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (178, 117) is lit
    And Nelim's Pickle Tools: the decor "Brazier" at (183, 117) is lit
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (40, 110, 90)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (177, 116) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "WoodLog"
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Nelim's Pickle Tools: the animal "Cinder" stands at (180, 115) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 4, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Open"
    Then I take a screenshot "workshop-5-the-phoenix-in-the-hearth-hall"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the hound on the gallery
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 100 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "cloister"
    And Nelim's Pickle Tools: an adult animal of kind "MM_Cerberus" named "Balthazar" is spawned at (179, 127)
    And Nelim's Pickle Tools: the animal "Yuki" stands at (172, 127) facing South
    And Nelim's Pickle Tools: the animal "Shogun" stands at (187, 126) facing South
    And Nelim's Pickle Tools: I lay the floor "TileSandstone" from (176, 127) to (183, 128)
    And Nelim's Pickle Tools: I place the decor "Stool" at (175, 127)
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (186, 127)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (90, 150, 210)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (183, 128) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "Kibble"
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Nelim's Pickle Tools: the animal "Balthazar" stands at (179, 127) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 6, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+SocialRelax"
    Then I take a screenshot "workshop-6-the-hound-on-the-gallery"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the unicorn in the plant garden
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 308 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Unicorn" named "Morwen" is spawned at (188, 86)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Pip" is spawned at (187, 89)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Tilly" is spawned at (193, 85)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Wren" is spawned at (192, 91)
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (186, 88)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (191, 86)
    And Nelim's Pickle Tools: the plants from (191, 86) to (191, 86) are fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (130, 60, 120)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: the colonist "Nelim" stands on the nearest free cell around (185, 88)
    And Nelim's Pickle Tools: "Nelim" carries the item "RawBerries"
    Then Alpha Mythology Renew the creature "Morwen" is standing on the map as "MM_Unicorn"
    When Nelim's Pickle Tools: the animal "Morwen" stands on the nearest free cell around (188, 86)
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "plant-garden"
    And Nelim's Pickle Tools: the painted zones are hidden
    And Alpha Mythology Renew frames the animal "Morwen" at zoom 5, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful2"
    Then I take a screenshot "workshop-7-the-unicorn-in-the-plant-garden"
    When Nelim's Pickle Tools: the decor is removed

  Scenario: the manticore by the paddies
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 16 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "rice-paddies"
    And Nelim's Pickle Tools: I lay the floor "Soil" from (205, 100) to (221, 116)
    And Nelim's Pickle Tools: the plants from (219, 106) to (240, 126) are fully grown
    And Nelim's Pickle Tools: an adult animal of kind "MM_Manticore" named "Thessaly" is spawned at (226, 117)
    And Nelim's Pickle Tools: an adult animal of kind "Heron" named "Aube" is spawned at (221, 120)
    And Nelim's Pickle Tools: an adult animal of kind "Heron" named "Brume" is spawned at (231, 112)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hilda" is spawned at (223, 114)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Berta" is spawned at (222, 119)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Greta" is spawned at (230, 120)
    And Nelim's Pickle Tools: I place the decor "SculptureSmall" at (220, 115)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (224, 121)
    And Nelim's Pickle Tools: the plants from (224, 121) to (224, 121) are fully grown
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (176, 48, 56)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (222, 117) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Pemmican"
    Then Alpha Mythology Renew the creature "Thessaly" is standing on the map as "MM_Manticore"
    When Nelim's Pickle Tools: the animal "Thessaly" stands at (226, 117) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "rice-paddies"
    And Nelim's Pickle Tools: the painted zones are hidden
    And Alpha Mythology Renew frames the animal "Thessaly" at zoom 6, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Smile"
    Then I take a screenshot "workshop-8-the-manticore-by-the-paddies"
    When Nelim's Pickle Tools: the decor is removed

  # The window is the subject: the interface stays on, developer mode off so that its toolbar is not in the picture.
  Scenario: the settings window
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 224 ticks pass
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I wait 30 ticks
    Then I take a screenshot "workshop-9-the-settings-window"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged

  Scenario: the settings list, to the end
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 224 ticks pass
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    And Alpha Mythology Renew scrolls its settings list to the end
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I wait 30 ticks
    Then I take a screenshot "workshop-10-the-settings-list-end"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged

  # PROBE, not a gallery shot and not rated: plays the three things no feature has played, in one short scenario, so that the replay of the eight shots rests on read facts. The save pets (Yuki, Shogun, Atticus) are moved by `stands at` after the cloister is emptied; the `TileSandstone` strip of scene 6 is laid; Nelim gets the Highpony hairstyle and the log line of her drawn hair; one picture is taken to read the tile and the pets. File it alone with -Filter '::probe: save pets' (a scenario title goes after the two colons).
  Scenario: probe: save pets, sandstone tile and Nelim's hair
    When Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "cloister"
    And Nelim's Pickle Tools: the animal "Yuki" stands at (172, 127) facing South
    And Nelim's Pickle Tools: the animal "Shogun" stands at (187, 126) facing South
    And Nelim's Pickle Tools: the animal "Atticus" stands at (183, 113) facing South
    And Nelim's Pickle Tools: I lay the floor "TileSandstone" from (176, 127) to (183, 128)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (90, 150, 210)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Sanctuary: the appearance of "Nelim" is logged
    And Nelim's Pickle Tools: "Nelim" stands at (184, 127) facing East
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Alpha Mythology Renew frames the animal "Shogun" at zoom 5, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "probe-save-pets-and-tile"
    And no errors were logged
