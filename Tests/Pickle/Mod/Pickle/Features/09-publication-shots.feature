# Workshop pictures: one staged story, played on the shared fixture of every mod's gallery, Nelim's sanctuary (PickleTools docs/GALERIE.md and
# docs/SANCTUAIRE-LIEUX.md). Rewritten 2026-10-05 for the sanctuary, then again 2026-10-07 after PUBLISHING.md's gallery rules (2026-10-06).
# NOT TO BE FILED before Pickle Tools says the final fixture is installed ("fixture prete"): until then `Nelims-tribe` is not in
# ScreenshotStudio/Mod/Pickle/Fixtures and these scenarios fail on the load.
#
# THE STORY. "A noon in the sanctuary": the mythical creatures of Alpha Mythology come to Nelim's sanctuary one after the other and each takes the
# corner that suits it, as the afternoon goes by. Eight creatures, eight corners, one hour of the day in the same light; then the window that lets the
# visitor choose which of them may appear in the wild. Rhythm chosen by the author of the series: 5 game minutes between two pictures (about 208 ticks),
# from noon, clear weather. The save is 23:00: every scenario sets the hour to 12, then lets the time of its own picture go by (set-up 60 ticks, plus
# 208 per picture already told), then poses the creature, so that it has not left the frame.
#
# SHOT PLAN (place, time, subject, composition, the living around it, what the picture says):
# 1. statue-garden (156, 108), 12:00, MM_Griffin "Aurelia", Griffin off-centre on the left, statues behind it, the garden wall on the right; living: the sanctuary's horses and sparrows around the statues; says: the griffin settles among the statues, a statue that moved.
# 2. fishing-zone (108, 66), 12:05, MM_Kappa "Ondine", Kappa low in the left foreground, the pond opening behind it; living: the ducks and swans of the river; says: the water spirit sits on the bank of the round pond.
# 3. water-garden (177, 173), 12:10, MM_Pegasus "Zephyra", Pegasus at the water's edge, lilies in the foreground, bamboo to the north; living: the garden's ducks; says: the winged horse drinks among the lilies, wings folded.
# 4. tea-room (140, 73), 12:15, MM_Kitsune "Inari", Kitsune left of the door, the wooden cabin filling the right; living: the cats of the house and a labrador by the bank; says: the fox spirit waits at the door of the tea room.
# 5. fire-pit (181, 115), 12:20, MM_Phoenix "Cinder", Phoenix beside the central fire, the hall in shadow around it; living: the thrumbos and cats asleep in the hall; says: the firebird lights the hall as a second hearth.
# 6. great-courtyard (185, 136), 12:25, MM_Cerberus "Balthazar", Cerberus centre-left, three heads turned three ways, the courtyard open behind; living: the sanctuary's labradors, wary at a distance; says: the three-headed hound keeps the courtyard.
# 7. plant-garden (190, 87), 12:30, MM_Unicorn "Morwen", Unicorn between two rows of plants, the fence behind; living: the sparrows in the plants; says: the unicorn walks the fenced plant garden.
# 8. rice-paddies (226, 117), 12:35, MM_Manticore "Thessaly", Manticore on the left, the rice rows running away to the right; living: the herons and chickens of the fields; says: the manticore watches the paddies from the bank.
# 9. podium (197, 152), 12:40, Griffin beside the window: the settings window, a plain screen capture of what it is, the interface on and developer mode off
#    so that its toolbar is not in the picture.
#
# Kept from the earlier versions: spawned adult on the player's side by PickleTools' own animal step, framed by this mod's own step (it lowers the camera
# floor: PickleTools' own framing stops near zoom 11), facing south, the creature names do not exist in the fixture. Zoom 5 instead of 2.5: the
# surroundings are part of the picture now. After the run, every picture is opened and read against this plan; an anomaly that comes from the scene or
# from the shared tool is described to Pickle Tools with the capture, never worked around here.
# The sanctuary's coordinates are the centres of the named places; if one is not standable, PickleTools' step will say so and the plan moves the creature a cell.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode
Feature: Workshop pictures

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I close all dialogs
    And I set the hour to 12
    And I set the weather to "Clear"

  Scenario: the griffin among the statues
    When I wait 60 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (156, 108)
    Then Alpha Mythology Renew the creature "Aurelia" is standing on the map as "MM_Griffin"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "statue-garden"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-1-the-griffin-among-the-statues"

  Scenario: the kappa by the pond
    When I wait 268 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kappa" named "Ondine" is spawned at (108, 66)
    Then Alpha Mythology Renew the creature "Ondine" is standing on the map as "MM_Kappa"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "fishing-zone"
    And Alpha Mythology Renew frames the animal "Ondine" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-2-the-kappa-by-the-pond"

  Scenario: the pegasus at the water garden
    When I wait 476 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Pegasus" named "Zephyra" is spawned at (177, 173)
    Then Alpha Mythology Renew the creature "Zephyra" is standing on the map as "MM_Pegasus"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "water-garden"
    And Alpha Mythology Renew frames the animal "Zephyra" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-3-the-pegasus-at-the-water-garden"

  Scenario: the kitsune at the tea room
    When I wait 500 ticks
    And I wait 184 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Kitsune" named "Inari" is spawned at (140, 73)
    Then Alpha Mythology Renew the creature "Inari" is standing on the map as "MM_Kitsune"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "tea-room"
    And Alpha Mythology Renew frames the animal "Inari" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-4-the-kitsune-at-the-tea-room"

  Scenario: the phoenix in the hearth hall
    When I wait 500 ticks
    And I wait 392 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Phoenix" named "Cinder" is spawned at (181, 115)
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "fire-pit"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-5-the-phoenix-in-the-hearth-hall"

  Scenario: the hound at the courtyard gate
    When I wait 500 ticks
    And I wait 500 ticks
    And I wait 100 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Cerberus" named "Balthazar" is spawned at (185, 136)
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "great-courtyard"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-6-the-hound-at-the-courtyard-gate"

  Scenario: the unicorn in the plant garden
    When I wait 500 ticks
    And I wait 500 ticks
    And I wait 308 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Unicorn" named "Morwen" is spawned at (190, 87)
    Then Alpha Mythology Renew the creature "Morwen" is standing on the map as "MM_Unicorn"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "plant-garden"
    And Alpha Mythology Renew frames the animal "Morwen" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-7-the-unicorn-in-the-plant-garden"

  Scenario: the manticore by the paddies
    When I wait 500 ticks
    And I wait 500 ticks
    And I wait 500 ticks
    And I wait 16 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Manticore" named "Thessaly" is spawned at (226, 117)
    Then Alpha Mythology Renew the creature "Thessaly" is standing on the map as "MM_Manticore"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "rice-paddies"
    And Alpha Mythology Renew frames the animal "Thessaly" at zoom 5, shown 2 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "workshop-8-the-manticore-by-the-paddies"

  # The window is the subject: the interface stays on, developer mode off so that its toolbar is not in the picture.
  Scenario: the settings window
    When I wait 500 ticks
    And I wait 500 ticks
    And I wait 500 ticks
    And I wait 224 ticks
    And Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (197, 152)
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 9, shown 6 cells left and 2 cells up
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And I wait 30 ticks
    Then I take a screenshot "workshop-9-the-settings-window"
    When I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged
