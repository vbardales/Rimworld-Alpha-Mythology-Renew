# DRAFT for Tests/Pickle/Mod/Pickle/Features/ (frozen until the first run is done). Never played.
# Two files' worth in one draft; split when moving:
#   11-phoenix-and-wisp   -> the minimal pass and the French pass (the wisp text depends on the language)
#   12-incompatibility    -> its own pass, -DepMap wsl-deps.incompat-magicalmenagerie.map, tag @requires below
# Steps used from docs/gallery-draft: "spawns the player animal". Steps of docs/scenarios-draft/BehaviourSteps.cs.

Feature: two behaviours of this mod that only a running game shows

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  # The death worker moved from the original's DLL into this mod's own assembly (the namespace changed): this is the
  # scenario that shows it still works. The explosion itself is vanilla; what the mod adds is the egg in the flames.
  Scenario: a dying phoenix leaves an egg in its flames
    Given Alpha Mythology Renew spawns the player animal "Cinderella" as "MM_Phoenix" near x 100 and z 100
    When Alpha Mythology Renew kills the creature "Cinderella"
    And I wait 60 ticks
    Then Alpha Mythology Renew an egg "MM_EggPhoenixFertilized" lies within 8 cells of the corpse of "Cinderella"
    And no errors were logged

  # The VEF reproduction text is replaced by a keyed, translatable one by a Harmony postfix scoped to this creature.
  # In a pass in English or in French the same step checks the language of that pass.
  Scenario: the will-o'-wisp's inspection text carries the fission progress in the language of the pass
    Given Alpha Mythology Renew spawns the player animal "Glimmer" as "MM_WillOWisp" near x 100 and z 100
    Then Alpha Mythology Renew the inspection text of "Glimmer" carries the fission progress text of the language this pass runs
    And no errors were logged

# --- 12-incompatibility: play only in the pass that stages the original ------------------------------------------
# The contract is: green = the incompatibility behaves as declared. The symptom is not known: this session has not
# seen the two mods together. The step below is a HYPOTHESIS (duplicate defNames between the original and this port);
# the first run of this pass is what settles it. If the log shows something else, rewrite the pattern, do not add a
# scenario expected to fail. "@allow-errors" keeps the expected error from failing the scenario by itself.
#
  @requires:sarg.magicalmenagerie @allow-errors
  Scenario: the original loaded beside this port logs the duplicate definitions it is declared incompatible for
    Then mod "sarg.magicalmenagerie" is loaded
    And mod "nelim.alphamythologyrenew" is loaded
    And an error matching "MM_" was logged
