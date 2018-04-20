require 'json'

module BattleTech
  ConfigFilename = 'mod-config.json'
  ConfigDefaults = JSON.load('{ "GameLocation": ' +
    '"C:/Program Files (x86)/Steam/SteamApps/common/BattleTech - Private Beta", ' +
    '"ModDirectory": "mods" }')
  GameExeLocation = 'BattleTech.exe'
  GameVersionLocation = 'BattleTech_Data/StreamingAssets/version.json'
  GameDBLocation = 'BattleTech_Data/StreamingAssets/MDD/MetadataDatabase.db'
  GameManifestLocation = 'BattleTech_Data/StreamingAssets/data/VersionManifest.csv'

  def self.load_config(filename)
    if File.exists?(filename) then
      conf = JSON.load( File.read(filename) )
    else
      conf = Hash.new
    end
    return ConfigDefaults.merge(conf)
  end

  def self.is_config_valid?(cfg)
    return false
  end
end

