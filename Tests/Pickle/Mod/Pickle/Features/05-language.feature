@review
Feature: the settings texts in the language this pass runs

  # One pass per language, fixed at staging, never switched inside a scenario. In developer mode - which
  # every Pickle run is - a key missing from the active language shows as accented gibberish: accented
  # text in a capture means a missing key, clean English inside a French run means a string that never
  # went through Translate.

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs

  Scenario: every settings text and the shortcut resolve in the active language
    Then Alpha Mythology Renew every settings text exists in the language this pass runs
    And Alpha Mythology Renew the shortcut is named in the language this pass runs

  Scenario: the settings window is captured for review in this language
    When Alpha Mythology Renew opens its settings window
    Then Alpha Mythology Renew sees its own settings window open
    When I take a screenshot "alpha mythology renew settings in this language"
    And I close all dialogs
    Then no errors were logged
