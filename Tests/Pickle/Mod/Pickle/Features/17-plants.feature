# F08 and F12 of Tests/FUNCTIONAL.md, automated. Both are historical Workshop cases of the original mod. Cutting a plant
# is a vanilla job, but the dead plants and the kappa are this port's definitions.
# F12's second half (Tree Chopping Speed Stat) needs a third-party mod that is not staged; its own pass is to be added
# once a compatible version and its Workshop id are known.

Feature: plants and harvesting

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario Outline: a colonist can cut the basilisk's <plant> and free the cell
    Given Alpha Mythology Renew spawns the dead plant "<plant>" and a colonist beside it
    When Alpha Mythology Renew orders a colonist to cut the plant
    And I wait 1200 ticks
    Then Alpha Mythology Renew the plant is gone and its cell is free again
    And no errors were logged

    Examples:
      | plant          |
      | MM_BurnedGrass |
      | MM_BurnedBush  |

  Scenario: asking whether a tamed kappa will cut a mature crop does not throw
    Then Alpha Mythology Renew a tamed "MM_Kappa" may be asked whether it will cut a mature crop without an exception
    And no errors were logged
