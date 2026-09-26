Feature: settings survive the game being closed and reopened

  # The claim this pair exists for: settings are global, so they must outlive the process, which no
  # scenario inside one process can show. The first step is the guard: it refuses to pass when the writer
  # ran in this same process (a restart test that never restarted).
  #
  # One scenario, deliberately: the teardown restores the defaults after every scenario, which is right
  # once this pair has been read and would make a second scenario here measure the defaults.

  Scenario: the previous launch's settings are loaded, and the game computes from them
    Given Alpha Mythology Renew the settings kept by the previous launch are in place
    Then Alpha Mythology Renew setting "spawnMultiplier" reads 3
    And Alpha Mythology Renew 1 creatures are blocked
    And Alpha Mythology Renew its settings file records a multiplier of 3 and the blocked creature "MM_Griffin"
    When the save "test-colony" is loaded
    And I close all dialogs
    Then Alpha Mythology Renew the wild commonality of "MM_Griffin" is zero in every biome
    And no errors were logged
