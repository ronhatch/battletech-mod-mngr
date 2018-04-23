#! /usr/bin/env ruby

require_relative 'lib/options'
require_relative 'lib/config'

my_opts = ModManager::parse_options
cfg = BattleTech::load_config(my_opts[:config])
if (!BattleTech::is_config_valid?(cfg)) then
  puts "The \"#{cfg["GameLocation"]}\" directory does not appear to contain the game."
  puts "Make sure your configuration file (#{my_opts[:config]}) has the correct install location."
  puts "If you use backslashes, they need to be doubled (use \\\\ for every \\ you want)."
  exit 1
end

# Do your thing here...

if (my_opts[:play]) then
  exec File.join(cfg["GameLocation"],BattleTech::GameExeLocation), ' '
end
