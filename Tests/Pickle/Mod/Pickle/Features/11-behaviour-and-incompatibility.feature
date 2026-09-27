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
# The contract is: green = the incompatibility behaves as declared. Settled by the first run of this pass (778c,
# 2026-09-27): the hypothesis (a "MM_" duplicate-def message at load) was wrong, rewritten to the real symptom.
# Both mods declare PawnKindDefs under the same defNames; the surviving instance loses a cross-reference in one of
# them, and RimWorld.BiomeDef.CommonalityOfAnimal (postfixed by this mod's own settings patch, hence it shows in the
# stack) throws a NullReferenceException the first time the wild-animal spawner ticks. It reached every scenario of
# this pass, not only this one (the original stays loaded for the whole run): the phoenix scenario above failed on
# the same exception when this pass first ran, which is this incompatibility's fallout, not a defect of its own.
# "an error matching" is this mod's own step (BehaviourSteps.ErrorMatching), not Pickle's: see its doc comment.
# "@allow-errors" keeps the expected error from failing the scenario by itself.
  @requires:sarg.magicalmenagerie @allow-errors
  Scenario: the original loaded beside this port logs the collision the incompatibility warns about
    Then mod "sarg.magicalmenagerie" is loaded
    And mod "nelim.alphamythology" is loaded
    And I wait 60 ticks
    And Alpha Mythology Renew an error matching "CommonalityOfAnimal" was logged
