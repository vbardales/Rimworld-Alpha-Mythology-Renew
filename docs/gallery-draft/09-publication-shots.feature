# DRAFT for Tests/Pickle/Mod/Pickle/Features/, to move there once the first run (settings suite) is done:
# Tests/Pickle is frozen until then. Not compiled against a game, never played; zoom values and cell offsets
# are guesses to tune after the first capture.
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
    And Alpha Mythology Renew frames the animal "Aurelia" at zoom 7, shown 2 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 1 - the griffin"

  Scenario: five creatures side by side
    Given Alpha Mythology Renew spawns the player animal "Balthazar" as "MM_Cerberus" near x 148 and z 98
    And Alpha Mythology Renew spawns the player animal "Cinder" as "MM_Phoenix" near x 151 and z 98
    And Alpha Mythology Renew spawns the player animal "Morwen" as "MM_Unicorn" near x 154 and z 98
    And Alpha Mythology Renew spawns the player animal "Thessaly" as "MM_Manticore" near x 157 and z 98
    And Alpha Mythology Renew spawns the player animal "Zephyra" as "MM_Pegasus" near x 160 and z 98
    Then Alpha Mythology Renew the creature "Morwen" is standing on the map as "MM_Unicorn"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Morwen" at zoom 13, shown 2 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 2 - five creatures side by side"

  Scenario: the three-headed hound
    Given Alpha Mythology Renew spawns the player animal "Balthazar" as "MM_Cerberus" near x 154 and z 98
    Then Alpha Mythology Renew the creature "Balthazar" is standing on the map as "MM_Cerberus"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Balthazar" at zoom 7, shown 2 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 3 - the three-headed hound"

  Scenario: the phoenix
    Given Alpha Mythology Renew spawns the player animal "Cinder" as "MM_Phoenix" near x 154 and z 98
    Then Alpha Mythology Renew the creature "Cinder" is standing on the map as "MM_Phoenix"
    When Alpha Mythology Renew dismisses every letter
    And Nelim's Pickle Tools: I frame the studio "flowers"
    And Alpha Mythology Renew frames the animal "Cinder" at zoom 7, shown 2 cells left and 1 cells up
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 30 ticks
    Then I take a screenshot "publication 4 - the phoenix"

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
    Then I take a screenshot "publication 5 - the settings window"
    When I close all dialogs
    And Nelim's Pickle Tools: developer mode is restored
    Then no errors were logged
