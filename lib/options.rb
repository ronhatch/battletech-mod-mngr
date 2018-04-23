require_relative 'trollop'

module ModManager
  def self.parse_options (cmd_line = ARGV)
    # Parse the command line options
    my_opts = Trollop::options(cmd_line) do
      usage "[options] [mod list]"
      synopsis "Configure the BattleTech game to use the listed mods.\n\n" +
               "The name to use for each mod is simply its directory within the mods directory.\n" +
               "So, for example, \"ronhatch/unit-logo\" would install the mod located in:\n" +
               "    [Game Location]/BattleTech_Data/StreamingAssets/mods/ronhatch/unit-logo\n" +
               "Paths can use either / or \\ interchangeably, and mods will be installed in order\n" +
               "from left to right, with later ones overriding early ones in case of a conflict.\n" +
               "Specifying \"none\" anywhere in the mod list will revert to the stock configuration."
      version "mod-mngr 0.01pre"
      opt :config, "Configuration file to use", :default => BattleTech::ConfigFilename
      opt :play, "Start the game after installing the requested mods"
      opt :help, "Show this message"
    end

    Trollop::educate if ARGV.empty?

    return my_opts
  end
end

