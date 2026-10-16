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
# SHOT PLAN (place, time, subject, composition, the living around it, what the picture says; zoom = half-height in cells):
# 1. statue-garden, 12:00, MM_Griffin "Aurelia" at (155, 97), zoom 6: the griffin on the bare earth between the large head-statue (149, 95) on its left and the deer statue (160, 94) on its right, statue pieces and the pawn statues around; living: a donkey and a hare placed on purpose (the wandering animals are removed first: a cat overlapped the wing in series 3); says: the griffin settles among the statues, a statue that moved.
# 2. fishing-zone, 12:05, MM_Kappa "Ondine" at (122, 67), zoom 5, on the east bank of the round pond; living: Nelim standing on the bank looking at it (smile "normal+moodCheerful"), a swan and a duck on the shallow rim of the pond; says: the water spirit sits on the bank of the round pond and Nelim has come to see it.
# 3. water-garden, 12:10, MM_Pegasus "Zephyra" at (177, 173), zoom 5, at the water's edge, lilies in the foreground, bamboo to the north; living: the garden's ducks and swans; says: the winged horse drinks among the lilies.
# 4. tea-room (the hut, door on the south side at (140, 68)), 12:15, MM_Kitsune "Inari" at (138, 66) left of the door, outside, zoom 6, the cabin filling the top of the frame; living: Nelim on the step at (141, 66) facing the fox (smile "normal+moodCheerful2", set last), a cat and a labrador by the wall; says: the fox spirit waits at the door of the tea room and Nelim comes out to it.
# 5. fire-pit, 12:20, MM_Phoenix "Cinder" at (180, 115), zoom 7 (the cell of the campfire, 181, is not standable), so that the hall is in the frame and not only the hearth; living: the thrumbo of the hall (177, 120) and a cat, left where the fixture put them; says: the firebird lights the hall as a second hearth.
# 6. cloister, 12:25, MM_Cerberus "Balthazar" at (179, 127), zoom 6, on the wooden gallery in front of the house, three heads turned to the garden; living: two labradors kept at a wary distance on the same boards; says: the three-headed hound keeps the gallery. (The first hound, alone in a meadow at the gravel yard, was dropped on 2026-10-12 as too weak and small; this one is a new place.)
# 7. plant-garden, 12:30, MM_Unicorn "Morwen" at (190, 87), zoom 5, between two rows of plants, the fence behind; living: three sparrows in the plants; says: the unicorn walks the fenced plant garden.
# 8. rice-paddies, 12:35, MM_Manticore "Thessaly" at (226, 117), zoom 6; the rice of the clearing is grown to harvest first (the fixture has seedlings), the macaw and the other wanderers are removed, two herons and three chickens are placed; says: the manticore watches the paddies from the bank.
# NELIM (the only colonist, Virginie) is in all eight creature pictures (owner rule 2026-10-14: protagonist of the series; reworked 2026-10-16). She keeps what the owner chose
# for her: hair in a bun, dark brown eyes, grey trousers. What changes per scene is the top (`Apparel_BasicShirt` dyed in a colour that stands out from the place and the creature),
# where she stands (about four cells from the creature, turned towards it or towards the visitor) and her expression, set last, right before the capture, after the map is held at
# 20 degrees (no heat face) and her own face is set (two brows, smirk smile, blink). No other pawn: the visitors are the creatures.
#   1 griffin: teal top, NLR-Open (wonder), (153, 97) facing East   2 kappa: coral top, moodCheerful, (125, 69) facing West   3 pegasus: saffron top, NLR-Smile, (181, 174) facing West
#   4 kitsune: indigo top, moodCheerful2, (141, 66) facing West      5 phoenix: green top, NLR-Open, (176, 116) facing East     6 hound: cream top, SocialRelax (calm among wary dogs), (183, 128) facing West
#   7 unicorn: plum top, moodCheerful2, (188, 87) facing East        8 manticore: crimson top, NLR-Smile, (222, 117) facing East
# Cells beside the creature are read from the place lists, not from a photograph: a step that says "not standable" names the cell to move.
# 9. window-backdrop-for-height, the settings window, a plain screen capture of what it is, the interface on and developer mode off so that its toolbar is not in the picture.
# 10. podium (197, 152), 12:45, Griffin beside the window: the creature list scrolled to its end (the window shows about 16 of the 25 creatures: the rows below Phoenix are here, the rows above are in 9).
#
# Kept from the earlier versions: spawned adult on the player's side by PickleTools' own animal step, framed by this mod's own step (it lowers the camera
# floor), facing south, the creature names do not exist in the fixture. After the run, every picture is opened and read against this plan; an anomaly that
# comes from the scene or from the shared tool is described to Pickle Tools with the capture, never worked around here.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.colonistrace
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
    And Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (155, 97)
    And Nelim's Pickle Tools: an adult animal of kind "Donkey" named "Pilar" is spawned at (159, 98)
    And Nelim's Pickle Tools: an adult animal of kind "Hare" named "Fennel" is spawned at (151, 98)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (40, 120, 125)
    And Nelim's Pickle Tools: "Nelim" stands at (153, 97) facing East
    Then Alpha Mythology Renew the creature "Aurelia" is standing on the map as "MM_Griffin"
    When Nelim's Pickle Tools: the animal "Aurelia" stands at (155, 97) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 6, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Open"
    Then I take a screenshot "workshop-1-the-griffin-among-the-statues"

  Scenario: the kappa by the pond
    When Nelim's Pickle Tools: I let 268 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kappa" named "Ondine" is spawned at (122, 67)
    And Nelim's Pickle Tools: an adult animal of kind "Swan" named "Perle" is spawned at (121, 70)
    And Nelim's Pickle Tools: an adult animal of kind "Duck" named "Plume" is spawned at (121, 64)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (224, 112, 96)
    And Nelim's Pickle Tools: "Nelim" stands at (125, 69) facing West
    Then Alpha Mythology Renew the creature "Ondine" is standing on the map as "MM_Kappa"
    When Nelim's Pickle Tools: the animal "Ondine" stands at (122, 67) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "fishing-zone"
    And Alpha Mythology Renew frames the animal "Ondine" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful"
    Then I take a screenshot "workshop-2-the-kappa-by-the-pond"

  Scenario: the pegasus at the water garden
    When Nelim's Pickle Tools: I let 476 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Pegasus" named "Zephyra" is spawned at (177, 173)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (232, 170, 60)
    And Nelim's Pickle Tools: "Nelim" stands at (181, 174) facing West
    Then Alpha Mythology Renew the creature "Zephyra" is standing on the map as "MM_Pegasus"
    When Nelim's Pickle Tools: the animal "Zephyra" stands at (177, 173) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    And Alpha Mythology Renew frames the animal "Zephyra" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Smile"
    Then I take a screenshot "workshop-3-the-pegasus-at-the-water-garden"

  Scenario: the kitsune at the tea room
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 184 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kitsune" named "Inari" is spawned at (138, 66)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (143, 65)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Rex" is spawned at (135, 64)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (52, 70, 130)
    And Nelim's Pickle Tools: "Nelim" stands at (141, 66) facing West
    Then Alpha Mythology Renew the creature "Inari" is standing on the map as "MM_Kitsune"
    When Nelim's Pickle Tools: the animal "Inari" stands at (138, 66) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "tea-room"
    And Alpha Mythology Renew frames the animal "Inari" at zoom 6, shown 2 cells left and -2 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful2"
    Then I take a screenshot "workshop-4-the-kitsune-at-the-tea-room"

  Scenario: the phoenix in the hearth hall
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 392 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Phoenix" named "Cinder" is spawned at (180, 115)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (40, 110, 90)
    And Nelim's Pickle Tools: "Nelim" stands at (176, 116) facing East
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Nelim's Pickle Tools: the animal "Cinder" stands at (180, 115) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 7, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Open"
    Then I take a screenshot "workshop-5-the-phoenix-in-the-hearth-hall"

  Scenario: the hound on the gallery
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 100 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "cloister"
    And Nelim's Pickle Tools: an adult animal of kind "MM_Cerberus" named "Balthazar" is spawned at (179, 127)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Mira" is spawned at (172, 127)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (187, 126)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (236, 226, 200)
    And Nelim's Pickle Tools: "Nelim" stands at (183, 128) facing West
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Nelim's Pickle Tools: the animal "Balthazar" stands at (179, 127) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 6, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+SocialRelax"
    Then I take a screenshot "workshop-6-the-hound-on-the-gallery"

  Scenario: the unicorn in the plant garden
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 308 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "MM_Unicorn" named "Morwen" is spawned at (190, 87)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Pip" is spawned at (187, 89)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Tilly" is spawned at (193, 85)
    And Nelim's Pickle Tools: an adult animal of kind "Sparrow" named "Wren" is spawned at (192, 91)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (130, 60, 120)
    And Nelim's Pickle Tools: "Nelim" stands at (188, 87) facing East
    Then Alpha Mythology Renew the creature "Morwen" is standing on the map as "MM_Unicorn"
    When Nelim's Pickle Tools: the animal "Morwen" stands at (190, 87) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "plant-garden"
    And Alpha Mythology Renew frames the animal "Morwen" at zoom 5, shown 0 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+moodCheerful2"
    Then I take a screenshot "workshop-7-the-unicorn-in-the-plant-garden"

  Scenario: the manticore by the paddies
    When Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 500 ticks pass
    And Nelim's Pickle Tools: I let 16 ticks pass
    And Nelim's Sanctuary: the animals are removed from the sanctuary "rice-paddies"
    And Nelim's Pickle Tools: the plants from (219, 106) to (240, 126) are fully grown
    And Nelim's Pickle Tools: an adult animal of kind "MM_Manticore" named "Thessaly" is spawned at (226, 117)
    And Nelim's Pickle Tools: an adult animal of kind "Heron" named "Aube" is spawned at (221, 120)
    And Nelim's Pickle Tools: an adult animal of kind "Heron" named "Brume" is spawned at (231, 112)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hilda" is spawned at (223, 114)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Berta" is spawned at (222, 119)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Greta" is spawned at (230, 120)
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 10 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (176, 48, 56)
    And Nelim's Pickle Tools: "Nelim" stands at (222, 117) facing East
    Then Alpha Mythology Renew the creature "Thessaly" is standing on the map as "MM_Manticore"
    When Nelim's Pickle Tools: the animal "Thessaly" stands at (226, 117) facing South
    And Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "rice-paddies"
    And Alpha Mythology Renew frames the animal "Thessaly" at zoom 6, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+NLR-Smile"
    Then I take a screenshot "workshop-8-the-manticore-by-the-paddies"

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
    And Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (197, 152)
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Sanctuary: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 9, shown 6 cells left and 2 cells up
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    And Alpha Mythology Renew scrolls its settings list to the end
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And I wait 30 ticks
    Then I take a screenshot "workshop-10-the-settings-list-end"
    When I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged
