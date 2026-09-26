# F01 of Tests/FUNCTIONAL.md, automated: every one of the 25 creatures spawns at every life stage the race defines and
# draws its four facings and its dessicated body without a missing material. A missing texture or an unresolved class also
# logs an error, which "no errors were logged" catches. What a person still does not see here: the sounds, the movement and
# feeding behaviour, the look of each drawing. Those are the creatures' original design, not this port's changes.
Feature: every creature spawns and draws

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario: the 25 creatures spawn at every life stage and draw their four facings
    When Alpha Mythology Renew spawns every creature of this mod at every life stage
    Then Alpha Mythology Renew all 25 creatures are on the map and each draws its four facings and its dessicated body
    And no errors were logged
