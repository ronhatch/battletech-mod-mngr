require 'json'

module BattleTech
  ConfigDefaults = JSON.load('{ "GameLocation": ' +
    '"C:/Program Files (x86)/Steam/SteamApps/common/BattleTech - Private Beta", ' +
    '"ModDirectory": "mods" }')

  def self.load_config(filename)
    return ConfigDefaults
  end
end
