# F07 of Tests/FUNCTIONAL.md, automated. Hatch targets and durations are asserted offline by Check-Mod; here the egg layers
# and milkable creatures are asked to produce (a forced cycle, not a wait of days) and the Kitsune's passive regeneration is
# compared between a colonist inside its radius and one far away. Trainability is a definition, checked offline.

Feature: production and regeneration

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario Outline: a female <creature> lays an egg as defined
    Then Alpha Mythology Renew a female "<creature>" produces an unfertilized egg of its own kind
    And no errors were logged

    Examples:
      | creature           |
      | MM_Basilisk        |
      | MM_Fenghuang       |
      | MM_Griffin         |
      | MM_Ieltxu          |
      | MM_Salamander      |
      | MM_StymphalianBird |

  Scenario Outline: a <creature> gives milk when it is full
    Then Alpha Mythology Renew a "<creature>" gives milk when it is full
    And no errors were logged

    Examples:
      | creature         |
      | MM_CeryneianHind |
      | MM_Chimera       |

  Scenario: a tamed Kitsune heals a colonist within its radius faster
    Given Alpha Mythology Renew spawns the tamed adult "MM_Kitsune" named "Healer" for the combat tests
    When Alpha Mythology Renew injures two colonists equally, one within 3 cells of "Healer" and one far away
    And I wait 1500 ticks
    Then Alpha Mythology Renew the colonist near the healer has healed more than the one far away
    And no errors were logged
