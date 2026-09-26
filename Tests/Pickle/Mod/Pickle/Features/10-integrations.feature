# DRAFT for Tests/Pickle/Mod/Pickle/Features/ (frozen until the first run is done). Never played.
# Play with -DepMap wsl-deps.avec-facultatifs.map (the providers below) and, for the last scenario,
# -DepMap wsl-deps.avec-giddyup.map. Each scenario is tagged with the provider it needs: a skip is not a pass.
#
# What is asserted is only that the patch reached its target: "def X was patched by mod ..." is the built-in step.
# Pickle records the patcher under the mod's DISPLAY name, not its packageId (Entity Gazing learned this on its
# first run), hence "Alpha Mythology Renew (unofficial)". Nothing here tests the providers themselves.
#
# Read before playing, from the 2026-09-26 static check: NatureIsPrettySweetPatch.xml is guarded by the name
# "Nature's Pretty Sweet", and the installed page is called "Nature's Pretty Sweet (Continued)". PatchOperationFindMod
# compares names (the Nocturnal Animals patch says so and lists both spellings), so the patch is expected NOT to
# apply. The NPS scenario is written to say what is true, not what is hoped: if it fails, that is the finding.

Feature: the optional integrations reach their targets

  Background:
    Given the save "test-colony" is loaded

  @requires:Torann.ARimworldOfMagic
  Scenario: A RimWorld of Magic adds magicyte to the creatures' butcher products
    Then def "MM_Griffin" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:Mlie.XNDNocturnalAnimals
  Scenario: the ieltxu becomes nocturnal beside Nocturnal Animals
    Then def "MM_Ieltxu" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:VanillaExpanded.VCookE
  Scenario: the fenghuang's thought follows its hediff beside Vanilla Cooking Expanded
    Then def "MM_FenghuangHediff" was patched by mod "Alpha Mythology Renew (unofficial)"
    And def "MM_FenghuangThought" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:VanillaExpanded.VGeneticsE
  Scenario: the creatures' corpses are accepted by the gene extraction recipes beside Vanilla Genetics Expanded
    Then def "GR_ExtractGenesFeline" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:Mlie.AdvancedBiomes
  Scenario: the creatures spawn in Advanced Biomes' biomes
    Then def "MM_Griffin" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:zal.lotrelves
  Scenario: the Lord of the Rims elves patch reaches its targets
    Then def "MM_Griffin" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  # Expected to fail on the name guard, see the header. Kept as a finding, then fixed in the patch, not deleted.
  @requires:Mlie.NaturesPrettySweet
  Scenario: the creatures spawn in Nature's Pretty Sweet's biomes
    Then def "MM_Ahuizotl" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged

  @requires:MemeGoddess.GiddyUp
  Scenario: the griffin becomes a mount beside Giddy-Up 2 - Continued
    Then def "MM_Griffin" was patched by mod "Alpha Mythology Renew (unofficial)"
    And no errors were logged
