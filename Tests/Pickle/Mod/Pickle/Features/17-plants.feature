# F08 and F12 of Tests/FUNCTIONAL.md, automated. Both are historical Workshop cases of the original mod. Cutting a plant
# is a vanilla job, but the dead plants and the kappa are this port's definitions.
# F12's second half needs Tree Chopping Speed Stat (Workshop 2566231583, velcroboy333, 1.2 to 1.6): the pass
# wsl-deps.avec-treechop.map stages it. The Workshop report of the original (discussion of 24 Nov 2023) is a
# NullReferenceException in that mod's prefix on PlantUtility.PawnWillingToCutPlant_Job, raised because the kappa has no
# VBY_TreeChopWorkSpeed stat, from VEF's harvest job giver. The scenario below reproduces the call; it may well fail:
# that would be a defect of the port on that provider, to be fixed with a patch, not a suite defect.

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

  @requires:TreeChoppingSpeed.velcroboy333
  Scenario: with Tree Chopping Speed Stat, asking a tamed kappa about a mature crop does not throw
    Then Alpha Mythology Renew a tamed "MM_Kappa" may be asked whether it will cut a mature crop without an exception
    And no errors were logged
