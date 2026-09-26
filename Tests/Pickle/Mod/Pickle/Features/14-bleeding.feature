# F04 of Tests/FUNCTIONAL.md, automated up to persistence: the wound hits every 65 ticks while it lasts and stops when it is
# removed, and it survives a save and reload (Pickle's "I save and reload" writes the game and loads it back, Scribe errors
# being left in the log for "no errors were logged" to catch).

Feature: the recurring bleeding wound

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs
    And Alpha Mythology Renew spawns the adult creature "MM_Griffin" named "Bleeder" for the bleeding tests

  Scenario: the wound keeps hurting while it is there
    When Alpha Mythology Renew records the open wound severity of "Bleeder"
    And Alpha Mythology Renew gives the bleeding wound to "Bleeder"
    And I wait 400 ticks
    Then Alpha Mythology Renew the open wound severity of "Bleeder" has grown since it was recorded
    And no errors were logged

  Scenario: removing the wound stops the damage
    When Alpha Mythology Renew gives the bleeding wound to "Bleeder"
    And I wait 200 ticks
    And Alpha Mythology Renew removes the bleeding wound from "Bleeder"
    And Alpha Mythology Renew records the open wound severity of "Bleeder"
    And I wait 400 ticks
    Then Alpha Mythology Renew the open wound severity of "Bleeder" has not grown since it was recorded
    And no errors were logged

  Scenario: the wound survives a save and reload and keeps hurting
    When Alpha Mythology Renew gives the bleeding wound to "Bleeder"
    And I wait 100 ticks
    And I save and reload
    Then Alpha Mythology Renew "Bleeder" still carries the bleeding wound
    When Alpha Mythology Renew records the open wound severity of "Bleeder"
    And I wait 400 ticks
    Then Alpha Mythology Renew the open wound severity of "Bleeder" has grown since it was recorded
    And no errors were logged
