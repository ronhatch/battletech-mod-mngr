Feature: Verify Cucumber is installed correctly
  These tests don't really do anything interesting.

  Scenario: Working steps that do nothing
    Given Cucumber works
    When I run a passing step
    Then this step should run

  Scenario: Failing steps that do nothing
    Given Cucumber works
    When I run a failing step
    Then this step should not run

  Scenario: Pending steps
    Given Cucumber works
    When I run a pending step
    Then this step should not run

