# F04 of Tests/FUNCTIONAL.md, automated up to persistence: the wound hits every 65 ticks while it lasts and stops when it is
# removed. Its saving (the counter is saved with Scribe) is proved by the static contract and is not exercised across a
# save file here: Pickle has no step that writes a save and loads it back.

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
