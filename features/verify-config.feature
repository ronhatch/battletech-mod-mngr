Feature: Verify the configuration points to a copy of the game.
  The BattleTech game might not be installed where we were told it was, so we
    need to verify that all the files we expect to use actually exist.

  @files @wip
  Scenario: No executable
    Given the configuration file points to our test directory
    And the game executable is not in our test directory
    When I load the configuration file
    Then the configuration will not be considered valid

