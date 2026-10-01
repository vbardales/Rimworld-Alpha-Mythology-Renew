# The three animal-mod patches, read in the live game with their provider loaded (Mod/Patches/AlphaMythology:
# AnimalProsthetics2Patch.xml, DogsMatePatch.xml, BetterCrossbreedingPatch.xml). One pass each:
#   -DepMap wsl-deps.avec-ads2.map   -DepMap wsl-deps.avec-dogsmate.map   -DepMap wsl-deps.avec-crossbreeding.map
# Each scenario is tagged with its provider: a skip is not a pass. The unit tests (Tests/UnitTests/PatchTests.cs)
# prove the patch files on stand-in definitions; what is asserted here is only what the game ended up with.
# The steps live in Source/AnimalPatchSteps.cs. The choice of each animal (and of the ones left out) is in the
# header of each patch file.

Feature: the animal-mod patches reach the game's own data

  Background:
    Given the save "test-colony" is loaded

  @requires:SamBucher.ADogSaidAnimalProsthetics2
  Scenario: A Dog Said... Animal Prosthetics 2 offers its surgeries to the listed creatures
    Then Alpha Mythology Renew the animal "MM_Cerberus" is offered surgeries by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And Alpha Mythology Renew the animal "MM_Pegasus" is offered surgeries by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And Alpha Mythology Renew the animal "MM_CeryneianHind" is offered surgeries by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And Alpha Mythology Renew the animal "MM_Basilisk" is offered surgeries by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And no errors were logged

  @requires:SamBucher.ADogSaidAnimalProsthetics2
  Scenario: the creatures left out of Animal Prosthetics 2 on purpose are offered none
    Then Alpha Mythology Renew the animal "MM_LernaeanHydra" is offered no surgery by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And Alpha Mythology Renew the animal "MM_LesserWyvern" is offered no surgery by mod "SamBucher.ADogSaidAnimalProsthetics2"
    And Alpha Mythology Renew the animal "MM_WillOWisp" is offered no surgery by mod "SamBucher.ADogSaidAnimalProsthetics2"

  # Dogs mate ships its own patch for these defNames (Patches/sarg.magicalmenagerie.xml): Cerberus, the hind, Pegasus, the
  # Unicorn, the Kitsune and the Catoblepas are grouped by it, not by us. Run 95c8 showed it (the Kitsune listed Fox_Red).
  @requires:Mlie.DogsMate
  Scenario: Dogs mate lets the grouped creatures breed with their own species
    Then Alpha Mythology Renew the animal "MM_Cerberus" can cross-breed with "Husky"
    And Alpha Mythology Renew the animal "Husky" can cross-breed with "MM_Cerberus"
    And Alpha Mythology Renew the animal "MM_CeryneianHind" can cross-breed with "Deer"
    And Alpha Mythology Renew the animal "MM_Pegasus" can cross-breed with "Horse"
    And Alpha Mythology Renew the animal "Horse" can cross-breed with "MM_Pegasus"
    And Alpha Mythology Renew the animal "MM_Kitsune" can cross-breed with "Fox_Red"
    And no errors were logged

  # The one group this port adds itself (DogsMatePatch.xml).
  @requires:Mlie.DogsMate
  Scenario: the Erymanthian boar joins the pigs
    Then Alpha Mythology Renew the animal "MM_ErymanthianBoar" can cross-breed with "WildBoar"
    And Alpha Mythology Renew the animal "Pig" can cross-breed with "MM_ErymanthianBoar"
    And no errors were logged

  @requires:Mlie.DogsMate
  Scenario: nobody groups the creatures that only look like a species
    Then Alpha Mythology Renew the animal "MM_Ahuizotl" cannot cross-breed with "Husky"
    And Alpha Mythology Renew the animal "MM_Qilin" cannot cross-breed with "Deer"

  @requires:DizzyEevee.BetterCrossbreeding
  Scenario: Better Crossbreeding lists the pairs on both races and carries the outcomes on the mother
    Then Alpha Mythology Renew the animal "MM_Cerberus" can cross-breed with "LabradorRetriever"
    And Alpha Mythology Renew the animal "YorkshireTerrier" can cross-breed with "MM_Cerberus"
    And Alpha Mythology Renew the animal "MM_ErymanthianBoar" can cross-breed with "Pig"
    And Alpha Mythology Renew the animal "MM_CeryneianHind" can cross-breed with "Caribou"
    And Alpha Mythology Renew the animal "MM_Pegasus" can cross-breed with "Horse"
    And Alpha Mythology Renew the animal "MM_Cerberus" carries the extension "DZY.CrossBreeding.Extension"
    And Alpha Mythology Renew the animal "Horse" carries the extension "DZY.CrossBreeding.Extension"
    And no errors were logged

  # Not an animal patch: kept here with the other provider-reading scenarios of this file. Vanilla Achievements Expanded
  # (vanillaexpanded.achievements, 2288125657) is the one provider of F11 that was never mounted. Its patch
  # (AchievementsPatch.xml, guarded by the mod's name) adds a tab and eight achievements, and the LoadFolders branch
  # Integrations/Achievements carries their French text. Pass: -DepMap wsl-deps.avec-achievements.map
  @requires:vanillaexpanded.achievements
  Scenario: Vanilla Achievements Expanded receives the tab and the eight achievements
    Then Alpha Mythology Renew the def "MM_Achievements" of type "AchievementsExpanded.AchievementTabDef" exists
    And Alpha Mythology Renew the def "MM_AchievementMagicHunter" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementStayingAhead" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementHardLove" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementMagicParka" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementGrabbingHands" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementFountainOfBlood" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementStatueOfColonist" of type "AchievementsExpanded.AchievementDef" exists
    And Alpha Mythology Renew the def "MM_AchievementForbiddenPoultry" of type "AchievementsExpanded.AchievementDef" exists
    And no errors were logged
