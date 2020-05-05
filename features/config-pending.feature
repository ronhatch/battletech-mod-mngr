Feature: Read and write the configuration from a file.
  The BattleTech game might not be installed in the default location, so we
    need to allow it to be configured. Read the configuration from a file, and
    if the file does not exist or if some options are not set, write the
    defaults instead.

  @pending
  Scenario: Partial configuration
    Given the file "test-config.json" contains:
      """
      {
        GameLocation: "Somewhere Else"
      }
      """
    When I load configuration from the file "test-config.json"
    Then the configuration should be:
      """
      {
        GameLocation: "Somewhere Else"
        ModDirectory: "mods"
      }
      """

  @pending
  Scenario: Save the defaults when there is no existing configuration
    Given the file "test-config.json" does not exist
    When I load configuration from the file "test-config.json"
    Then the file "test-config.json" should contain:
      """
      {
        GameLocation: "C:/Program Files (x86)/Steam/SteamApps/common/BattleTech - Private Beta",
        ModDirectory: "mods"
      }
      """

  @pending
  Scenario: Save the defaults when there was only a partial configuration
    Given the file "test-config.json" contains:
      """
      {
        GameLocation: "Somewhere Else"
      }
      """
    When I load configuration from the file "test-config.json"
    Then the file "test-config.json" should contain:
      """
      {
        GameLocation: "Somewhere Else"
        ModDirectory: "mods"
      }
      """

