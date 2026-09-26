Feature: settings written, for the next launch to read

  # First half of the restart pair, not playable on its own: it leaves a multiplier of 3 and a blocked
  # creature on disk on purpose and stands the teardown down. Play the two together, and only together:
  #
  #   -Filter 07-restart-write -Then 08-restart-read
  #
  # which takes the machine lock once, stages once, and launches the game twice.

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs

  Scenario: changed settings are written to the settings file
    When Alpha Mythology Renew sets the spawn multiplier to 3
    And Alpha Mythology Renew blocks the creature "MM_Griffin"
    And Alpha Mythology Renew keeps its settings for the next launch
    Then Alpha Mythology Renew its settings file records a multiplier of 3 and the blocked creature "MM_Griffin"
    And no errors were logged
