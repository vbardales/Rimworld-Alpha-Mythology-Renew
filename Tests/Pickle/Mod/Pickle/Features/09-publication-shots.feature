# Workshop pictures, played on the shared fixture of every mod's gallery: Nelim's sanctuary (docs/GALERIE.md and
# docs/SANCTUAIRE-LIEUX.md of PickleTools). Rewritten 2026-10-05 from the studio-colony version (studio8, 09-28 framing).
# NOT TO BE FILED before Pickle Tools says the final fixture is installed ("fixture prete"): until then `Nelims-tribe`
# is not in ScreenshotStudio/Mod/Pickle/Fixtures and these scenarios fail on the load.
#
# What is kept from the earlier version: one animal per picture ("un a un", Virginie 2026-09-28), spawned adult on the
# player's side, framed by this mod's own step at zoom 2.5 (the game's camera floor is lowered by GallerySteps.Frame:
# PickleTools' own step stops at about 11, "a request for 4 gave the same picture as 7" at studio pass c928), facing south
# (front view), interface off in the creature scenes and on in the settings scene, a creature name the map does not have.
# What changes: the scene is the `podium` of the sanctuary (the empty green square built for the mods, cell (197, 152)),
# by day (hour 12, clear weather: the save was written at 23:00), instead of the meadow of the studio colony.
#
# What they assert is only that the picture says what its caption will say: each creature is the kind it claims to be and
# belongs to the player. Nothing about their behaviour is staged or claimed.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode
Feature: Workshop pictures

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I close all dialogs
    And I set the hour to 12
    And I set the weather to "Clear"

  Scenario: a griffin, close, as the first picture
    Given Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (197, 152)
    Then Alpha Mythology Renew the creature "Aurelia" is standing on the map as "MM_Griffin"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 2.5, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 1 - the griffin"

  Scenario: the three-headed hound
    Given Nelim's Pickle Tools: an adult animal of kind "MM_Cerberus" named "Balthazar" is spawned at (197, 152)
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 2.5, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 2 - the three-headed hound"

  Scenario: the phoenix
    Given Nelim's Pickle Tools: an adult animal of kind "MM_Phoenix" named "Cinder" is spawned at (197, 152)
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 2.5, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 3 - the phoenix"

  # Each creature alone, never alongside the others, so none is ever hidden behind another's sprite.
  Scenario Outline: <creature>, alone
    Given Nelim's Pickle Tools: an adult animal of kind "<creature>" named "<name>" is spawned at (197, 152)
    Then Alpha Mythology Renew the creature "<name>" is standing on the map as "<creature>"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "<name>" at zoom 2.5, shown 1 cells left and 0 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "<caption>"

    Examples:
      | creature      | name     | caption                        |
      | MM_Unicorn    | Morwen   | publication 4 - the unicorn    |
      | MM_Manticore  | Thessaly | publication 5 - the manticore  |
      | MM_Pegasus    | Zephyra  | publication 6 - the pegasus    |

  # The window is the subject: the interface stays on, developer mode off so its toolbar is not in the picture.
  Scenario: the settings window over the podium, with a creature beside it
    Given Nelim's Pickle Tools: an adult animal of kind "MM_Griffin" named "Aurelia" is spawned at (197, 152)
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I am at the sanctuary "podium"
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 9, shown 6 cells left and 2 cells up
    And Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And I wait 30 ticks
    Then I take a screenshot "publication 7 - the settings window"
    When I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged
