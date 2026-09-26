# F02 and F03 of Tests/FUNCTIONAL.md, automated. The explosion radius by life stage and the one-or-two egg roll are proved
# out of the game (Tests/UnitTests); what needs the game is that the death worker still runs from this mod's own assembly
# (its namespace changed from the original's) and that the eggs behave. Incubation is not waited out: the hatcher is asked
# to hatch, which is the step that turns an egg into a phoenix.

Feature: the phoenix dies in flames and leaves eggs

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario: a chick's death leaves one or two fertilized eggs
    Then Alpha Mythology Renew 40 phoenixes of life stage 0 die and each death leaves one or two fertilized eggs, both counts being seen
    And no errors were logged

  Scenario: a juvenile's death leaves one or two fertilized eggs
    Then Alpha Mythology Renew 40 phoenixes of life stage 1 die and each death leaves one or two fertilized eggs, both counts being seen
    And no errors were logged

  Scenario: an adult's death leaves one or two fertilized eggs
    Then Alpha Mythology Renew 40 phoenixes of life stage 2 die and each death leaves one or two fertilized eggs, both counts being seen
    And no errors were logged

  Scenario: an egg already lying where a phoenix dies is not lost
    Then Alpha Mythology Renew an egg already lying where a phoenix dies survives the explosion and is counted with the new ones
    And no errors were logged

  Scenario: a fertilized egg hatches a phoenix
    Then Alpha Mythology Renew a fertilized phoenix egg hatches into a phoenix when its incubation completes
    And no errors were logged

  # In a French pass the same step checks the French labels; a raw key or an accented gibberish label fails it.
  Scenario: the egg's destroy and cancel commands have labels and icons
    Then Alpha Mythology Renew a fertilized phoenix egg offers destroy and cancel commands whose labels and icons resolve in the language of this pass
    And no errors were logged

  # F03 end to end: the destruction is VEF's own designation and job (VEF is a required dependency, so it is always
  # there); what is tested is that the port's egg, wired to that comp, is offered the job when requested, is not when
  # cancelled, and is really destroyed - without hatching - when a colonist carries the job out.
  Scenario: a requested destruction is offered, cancellable, and carried out by a colonist
    Given Alpha Mythology Renew spawns a fertilized phoenix egg for the destruction tests
    When Alpha Mythology Renew requests the destruction of the egg
    Then Alpha Mythology Renew a colonist is offered a destruction job for the egg
    When Alpha Mythology Renew cancels the destruction of the egg
    Then Alpha Mythology Renew no colonist is offered a destruction job for the egg
    When Alpha Mythology Renew requests the destruction of the egg
    And Alpha Mythology Renew a colonist carries out the destruction job for the egg
    And I wait 900 ticks
    Then Alpha Mythology Renew the egg is destroyed and no phoenix has hatched from it
    And no errors were logged
