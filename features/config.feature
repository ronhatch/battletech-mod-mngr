Feature: Read the configuration from a file.
  The BattleTech game might not be installed in the default location, so we
    need to allow the location to be configured. Read the configuration from
    a file, and if the file does not exist or if some options are not set,
    use the defaults instead.

  @wip @files
  Scenario: No existing configuration
    Given the file "test-config.json" does not exist
    When I load configuration from the file "test-config.json"
    Then the configuration will match the defaults

