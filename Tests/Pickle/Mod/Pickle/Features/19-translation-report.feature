# The game's own translation report, read for this mod (Nelim's Pickle Tools, ScreenshotStudio, 2026-10-08): the step runs the game's debug action that writes the report for the
# language of the pass, keeps only what belongs to this mod and fails on a missing keyed translation, a missing def-injection, an argument-count mismatch, an unnecessary or
# renamed one, or a load error that names this mod. Notes "matching English (maybe ok)" never fail; what belongs to other mods (RimLogging, the game's own files) is ignored and
# the whole report is attached to the evidence. It replaces nothing: Tests/Check-Translations.py checks the files, this checks what the running game says of them.
# Played in French only, with -Language French and -DepMap wsl-deps.translation.map: the game writes a translation report only for a language other than English (the English run of 252b,
# 2026-10-08, failed with exactly that message: nothing to read, not a defect of the mod). English coverage stays with Tests/Check-Translations.py. NPT did not read whether the key is exactly the packageId: the first run says.
@requires:nelim.pickletools.screenshotstudio
Feature: the translation report of the game

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs

  Scenario: the translation report has no problem for this mod in the language of the pass
    Then Nelim's Pickle Tools: the translation report has no problem for the mod "nelim.alphamythology"
