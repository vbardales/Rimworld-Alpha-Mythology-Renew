# Tests/Pickle is not frozen any more; zoom values and cell offsets below were tuned against two captures.
# First (studio pass 5bc7, 2026-09-26): the hero shots (griffin, hound, phoenix) read small at zoom 7, and the
# five-creature line-up only fit 3 of its 5 subjects in frame at zoom 13 offset 2 cells left of the middle one.
# Second (studio2, c928, 2026-09-27): zoom 4 for the hero shots turned out identical to zoom 7 pixel for pixel
# (SetRootSize clamps to a floor near 7-8 in this game build; not a mistake in the number, just a wall under it),
# and the group shot at zoom 20 got WORSE, not better — it revealed the meadow's own building and three stray
# colonists. Virginie's call, 2026-09-28: stop trying to fit several creatures in one frame; one animal per
# picture ("un a un"). The single group scenario below is replaced by one scenario per remaining creature, framed
# the same as the other hero shots. Virginie, 2026-09-28: the creatures still read too small; the floor is not a wall
# after all — GallerySteps.Frame now lowers CameraDriver.config.sizeRange.min, and the shots ask for zoom 2.5.
#
# Pictures meant for the Workshop page and for nothing else. What they assert is only that the picture says what
# its caption will say: each creature is the kind it claims to be and belongs to the player. The creatures are
# spawned adult on the owner's photographic colony; nothing about their behaviour is staged or claimed.
#
# Names must not exist in the fixture (the steps take the first pawn of that name; the meadow already has a macaw
# called "Clover"). The interface is off in the creature scenes (studio presentation mode) and on in the
# settings scene, where the window is the subject.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode
Feature: Workshop pictures

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario: a griffin, close, as the first picture
    Given Alpha Mythology Renew spawns the player animal "Aurelia" as "MM_Griffin" near x 154 and z 98
    Then Alpha Mythology Renew the creature "Aurelia" is standing on the map as "MM_Griffin"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 2.5, shown 1 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 1 - the griffin"

  Scenario: the three-headed hound
    Given Alpha Mythology Renew spawns the player animal "Balthazar" as "MM_Cerberus" near x 154 and z 98
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 2.5, shown 1 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 2 - the three-headed hound"

  Scenario: the phoenix
    Given Alpha Mythology Renew spawns the player animal "Cinder" as "MM_Phoenix" near x 154 and z 98
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 2.5, shown 1 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 3 - the phoenix"

  # One creature per picture from here on ("un a un", 2026-09-28: the hound and the phoenix already have their own
  # shot above; these are the rest of what the old group photo tried to fit in one frame), same framing as the
  # other hero shots. Each is spawned alone, not alongside the others, so none is ever hidden behind another's
  # flowers or sprite.
  Scenario Outline: <creature>, alone
    Given Alpha Mythology Renew spawns the player animal "<name>" as "<creature>" near x 154 and z 98
    Then Alpha Mythology Renew the creature "<name>" is standing on the map as "<creature>"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "<name>" at zoom 2.5, shown 1 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "<caption>"

    Examples:
      | creature      | name     | caption                        |
      | MM_Unicorn    | Morwen   | publication 4 - the unicorn    |
      | MM_Manticore  | Thessaly | publication 5 - the manticore  |
      | MM_Pegasus    | Zephyra  | publication 6 - the pegasus    |

  # The window is the subject: the interface stays on, developer mode off so its toolbar is not in the picture.
  Scenario: the settings window over the meadow, with a creature beside it
    Given Alpha Mythology Renew spawns the player animal "Aurelia" as "MM_Griffin" near x 154 and z 98
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 9, shown 6 cells left and 2 cells up
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And I wait 30 ticks
    Then I take a screenshot "publication 7 - the settings window"
    When I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged
