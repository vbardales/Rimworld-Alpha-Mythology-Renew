Feature: Alpha Mythology Renew loads with its settings contracts

  # The out-of-game suites prove the defs are well formed and the rules of the settings. Only a started
  # game proves the loader admitted the mod beside VEF and Harmony, that its Mod class ran, that its
  # patch installed, and that a clean profile really carries the documented defaults.

  Scenario: the mod loads without startup errors
    Then mod "nelim.alphamythologyrenew" is loaded
    And mod "nelim.alphamythologyrenew" loads after "oskarpotocki.vanillafactionsexpanded.core"
    And no errors were logged

  Scenario: its creatures and its shortcut are present
    Then def "MM_Griffin" of type "PawnKindDef" exists
    And def "MM_Phoenix" of type "PawnKindDef" exists
    And def "AMR_Settings" of type "MainButtonDef" exists
    And Alpha Mythology Renew the settings list 25 creatures of its own

  Scenario: a clean profile loads the documented defaults
    Then Alpha Mythology Renew setting "spawnMultiplier" reads 1
    And Alpha Mythology Renew 0 creatures are blocked
