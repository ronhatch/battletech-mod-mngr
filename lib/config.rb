require 'json'

module BattleTech
  ConfigFilename = 'mod-config.json'
  ConfigDefaults = JSON.load('{ "GameLocation": ' +
    '"C:/Program Files (x86)/Steam/SteamApps/common/BattleTech - Private Beta", ' +
    '"ModDirectory": "mods" }')
  GameDBLocation = ['BattleTech_Data','StreamingAssets','MDD','MetadataDatabase.db']
  GameExeLocation = ['BattleTech.exe']
  GameManifestLocation = ['BattleTech_Data','StreamingAssets','data','VersionManifest.csv']
  GameVersionLocation = ['BattleTech_Data','StreamingAssets','version.json']

  def self.load_config(filename)
    if File.exists?(filename) then
      conf = JSON.load( File.read(filename) )
    else
      conf = Hash.new
    end
    return ConfigDefaults.merge(conf)
  end

  def self.is_config_valid?(cfg)
    # Configuration is valid if all the critical files exist...
    return File.exist?( File.join(cfg['GameLocation'],GameDBLocation) ) &&
           File.exist?( File.join(cfg['GameLocation'],GameExeLocation) ) &&
           File.exist?( File.join(cfg['GameLocation'],GameManifestLocation) ) &&
           File.exist?( File.join(cfg['GameLocation'],GameVersionLocation) )
  end
end

