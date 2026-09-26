# F06 and F09 of Tests/FUNCTIONAL.md, automated. The verbs, projectiles and their comps belong to VEF (a hard dependency),
# but the port owns their wiring in its own Defs: a creature whose attack cannot start, or whose projectile hurts nothing, is
# this port's defect. The automatic-fire toggle is VEF's and is not exercised.

Feature: the creatures' ranged attacks

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario Outline: <creature> fires its ranged attack and the target is affected
    Given Alpha Mythology Renew spawns the tamed adult "<creature>" named "Shooter" for the combat tests
    And Alpha Mythology Renew spawns the target "Target" of kind "Muffalo" 5 cells from "Shooter"
    When Alpha Mythology Renew "Shooter" fires its first ranged attack at "Target"
    And I wait 300 ticks
    Then Alpha Mythology Renew "Target" has been hurt or otherwise affected by the attack
    And no errors were logged

    Examples:
      | creature           |
      | MM_Basilisk        |
      | MM_Catoblepas      |
      | MM_Chimera         |
      | MM_Ieltxu          |
      | MM_LernaeanHydra   |
      | MM_Manticore       |
      | MM_StymphalianBird |
      | MM_Tlilcoatl       |
      | MM_WildMinotaur    |
      | MM_WillOWisp       |

  # F09: the tlilcoatl's poison breath (ToxicBite, 15) against an organic target, a shielded colonist and a mechanoid.
  # Which interaction is right is defined by the game's damage and shield rules, so what is asserted is that each target
  # reacts as those rules allow and nothing throws; the outcome is in the failure text when it does not.
  Scenario: the poison breath hurts an organic target
    Given Alpha Mythology Renew spawns the tamed adult "MM_Tlilcoatl" named "Shooter" for the combat tests
    And Alpha Mythology Renew spawns the target "Target" of kind "Muffalo" 5 cells from "Shooter"
    When Alpha Mythology Renew "Shooter" fires its first ranged attack at "Target"
    And I wait 300 ticks
    Then Alpha Mythology Renew "Target" has been hurt or otherwise affected by the attack
    And no errors were logged

  Scenario: a shield belt reacts to the poison breath
    Given Alpha Mythology Renew spawns the tamed adult "MM_Tlilcoatl" named "Shooter" for the combat tests
    And Alpha Mythology Renew spawns the colonist target "Wearer" 5 cells from "Shooter"
    And Alpha Mythology Renew gives a shield belt to "Wearer"
    And Alpha Mythology Renew records the injury severity and the condition count of "Wearer"
    When Alpha Mythology Renew "Shooter" fires its first ranged attack at "Wearer"
    And I wait 300 ticks
    Then Alpha Mythology Renew the shield belt of "Wearer" took the attack or the wearer was hurt
    And no errors were logged

  @requires:ludeon.rimworld.biotech
  Scenario: a mechanoid takes no toxic buildup from the poison breath
    Given Alpha Mythology Renew spawns the tamed adult "MM_Tlilcoatl" named "Shooter" for the combat tests
    And Alpha Mythology Renew spawns the target "Mech" of kind "Mech_Militor" 5 cells from "Shooter"
    When Alpha Mythology Renew "Shooter" fires its first ranged attack at "Mech"
    And I wait 300 ticks
    Then Alpha Mythology Renew "Mech" has no toxic buildup
    And no errors were logged
