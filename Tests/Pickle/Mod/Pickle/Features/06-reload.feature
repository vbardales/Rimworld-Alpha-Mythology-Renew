Feature: the settings are global and survive a save being loaded

  # Settings live in the player's configuration, not in the save: loading a save must neither reset them
  # nor take them from the file. This is a reload inside one process, which is not a restart (see 07/08).

  Scenario: a changed multiplier and a blocked creature are still there after a reload
    Given the save "test-colony" is loaded
    And I close all dialogs
    When Alpha Mythology Renew sets the spawn multiplier to 3
    And Alpha Mythology Renew blocks the creature "MM_Griffin"
    And the save "test-colony" is loaded
    And I close all dialogs
    Then Alpha Mythology Renew setting "spawnMultiplier" reads 3
    And Alpha Mythology Renew 1 creatures are blocked
    And Alpha Mythology Renew the wild commonality of "MM_Griffin" is zero in every biome
    And no errors were logged
