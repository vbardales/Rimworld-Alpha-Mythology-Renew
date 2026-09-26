Feature: the optional MainButtons shortcut

  # Hidden by its own def rather than pushed down every frame, revealable by a customization mod, and
  # opening the same settings instance as Mod options. Reading the def proves the first; a running game
  # shows the worker drawing, enabling and opening.
  #
  # These scenarios reveal it the way any such mod does, by setting the same field. Whether RIMMSQOL itself
  # finds and reveals it is a separate claim, played in its own pass (04-rimmsqol).

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs

  Scenario: hidden on a clean configuration, and not merely greyed out
    Then Alpha Mythology Renew the shortcut is hidden on a clean configuration

  Scenario: revealed, it draws, enables and opens the same settings
    When Alpha Mythology Renew reveals its shortcut as a customization mod would
    Then Alpha Mythology Renew the shortcut is drawn and enabled
    When Alpha Mythology Renew activates its shortcut
    Then Alpha Mythology Renew sees its own settings window open
    And Alpha Mythology Renew the open window edits the same settings instance
    When I close all dialogs
    And Alpha Mythology Renew hides its shortcut again
    Then Alpha Mythology Renew the shortcut is hidden on a clean configuration
    And no errors were logged
