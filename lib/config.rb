require 'json'

module BattleTech
  ConfigFilename = 'mod-config.json'
  ConfigDefaults = JSON.load('{ "GameLocation": ' +
    '"C:/Program Files (x86)/Steam/SteamApps/common/BattleTech - Private Beta", ' +
    '"ModDirectory": "mods" }')

  def self.load_config(filename)
    if File.exists?(filename) then
      conf = JSON.load( File.read(filename) )
    else
      conf = Hash.new
    end
    return ConfigDefaults.merge(conf)
  end
end

