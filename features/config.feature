Feature: Read the configuration from a file.
  The BattleTech game might not be installed in the default location, so we
    need to allow the location to be configured. Read the configuration from
    a file, and if the file does not exist or if some options are not set,
    use the defaults instead.

  @files
  Scenario: No existing configuration
    Given the file "test-config.json" does not exist
    When I load configuration from the file "test-config.json"
    Then the configuration will match the defaults

  @wip @files
  Scenario: Configuration file adds an option
    Given the file "test-config.json" contains:
    """
      { "Fake option that doesn't really exist": "Some value" }
    """
    When I load configuration from the file "test-config.json"
    Then the configuration will not match the defaults
    And the configuration will be a superset of the defaults

