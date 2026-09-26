@requires:MalteSchulze.RIMMSqol @requires:nelim.pickletools.rimmsqol @rimmsqol
Feature: RIMMSQOL finds, reveals and hides the shortcut

  # Needs the pass that stages RIMMSQOL (wsl-deps.avec-rimmsqol.map); skipped in the minimal pass, and a
  # skip is not a pass. Reveals through RIMMSQOL's own settings calls, not pixel clicks: that its checkbox
  # is wired to the same call is read from RIMMSQOL's source, not shown here.

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs

  Scenario: RIMMSQOL lists the button, hidden by default and not drawn
    Then RIMMSQOL is ready to be driven
    And RIMMSQOL's own list of main buttons offers "AMR_Settings"
    And RIMMSQOL shows the main button "AMR_Settings" as hidden
    And the main bar does not draw the button "AMR_Settings"

  Scenario: revealed through RIMMSQOL it is drawn, enabled and opens the same settings
    When RIMMSQOL reveals the main button "AMR_Settings"
    Then the main bar draws the button "AMR_Settings"
    When the main bar's button "AMR_Settings" is activated
    Then Alpha Mythology Renew sees its own settings window open
    And Alpha Mythology Renew the open window edits the same settings instance
    When I close all dialogs
    And RIMMSQOL hides the main button "AMR_Settings"
    Then the main bar does not draw the button "AMR_Settings"
    And no errors were logged
