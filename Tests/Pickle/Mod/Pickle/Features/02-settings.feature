Feature: the settings window, and what it changes in the game's own spawn table

  # The unit tests prove the rule. What only a running game shows: that the window belongs to this mod,
  # that it edits the instance the patch reads from, and that a changed value reaches BiomeDef's real
  # CommonalityOfAnimal - the number wild spawns are drawn from - for this mod's creatures and for
  # nobody else's.

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs

  Scenario: the primary route opens this mod's own window on the live settings
    When Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    And Alpha Mythology Renew the open window edits the same settings instance
    When I close all dialogs
    Then no errors were logged

  Scenario: the multiplier scales the wild commonality of the mod's creatures only
    When Alpha Mythology Renew records the wild commonality of "MM_Griffin"
    And Alpha Mythology Renew records the wild commonality of "Muffalo"
    And Alpha Mythology Renew sets the spawn multiplier to 2
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" is 2 times the recorded one
    And Alpha Mythology Renew the wild commonality of "Muffalo" equals the recorded one
    When Alpha Mythology Renew sets the spawn multiplier to 100
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" is 5 times the recorded one
    When Alpha Mythology Renew sets the spawn multiplier to 0
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" is 0.1 times the recorded one
    And no errors were logged

  Scenario: a blocked creature never appears, the others still do, and allowing it restores it
    When Alpha Mythology Renew records the wild commonality of "MM_Griffin"
    And Alpha Mythology Renew records the wild commonality of "MM_Phoenix"
    And Alpha Mythology Renew blocks the creature "MM_Griffin"
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" is zero in every biome
    And Alpha Mythology Renew the wild commonality of "MM_Phoenix" equals the recorded one
    When Alpha Mythology Renew allows the creature "MM_Griffin" again
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" equals the recorded one

  Scenario: restoring the defaults undoes both controls
    When Alpha Mythology Renew records the wild commonality of "MM_Griffin"
    And Alpha Mythology Renew sets the spawn multiplier to 3
    And Alpha Mythology Renew blocks the creature "MM_Griffin"
    And Alpha Mythology Renew restores its defaults
    Then Alpha Mythology Renew setting "spawnMultiplier" reads 1
    And Alpha Mythology Renew 0 creatures are blocked
    And Alpha Mythology Renew the wild commonality of "MM_Griffin" equals the recorded one
