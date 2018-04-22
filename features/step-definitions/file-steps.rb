require 'fileutils'
TempDir = 'temp-testing'

# Any scenario that uses files needs the temp directory.
Before('@files') do
  unless Dir.exist?(TempDir) then
    Dir.mkdir(TempDir)
  end
  readme = File.join(TempDir, 'Readme.txt')
  unless File.exist?(readme) then
    text  = "This entire directory is used only for testing.\n"
    text += "These files should all be deleted at the end of each test,\n"
    text += "  but if they are still here you can safely delete them manually.\n"
    File.write(readme, text)
  end
end

Given /^the configuration file does not exist$/ do
  filename = File.join(TempDir, BattleTech::ConfigFilename)
  if File.exist?(filename) then
    File.delete(filename)
  end
end

Given /^the configuration file contains:$/ do |contents|
  File.write(File.join(TempDir, BattleTech::ConfigFilename), contents)
end

Given /^the configuration file points to our test directory$/ do
  File.write("#{TempDir}/#{BattleTech::ConfigFilename}", "{ \"GameLocation\": \"#{TempDir}\" }")
end

Given /^the game (.*?) is( not)? in our test directory$/ do |f, n|
  file_location = case f
  when 'executable'
    BattleTech::GameExeLocation
  when 'version'
    BattleTech::GameVersionLocation
  when 'database'
    BattleTech::GameDBLocation
  when 'manifest'
    BattleTech::GameManifestLocation
  else
    fail 'Invalid step... unrecognized file type.'
  end
  if (n == ' not') then
    filename = File.join(TempDir, file_location)
    if File.exist?(filename) then
      File.delete(filename)
    end
  else
    FileUtils.mkdir_p File.join(TempDir, file_location[0...-1])
    FileUtils.touch File.join(TempDir, file_location)
  end
end

# And if we've made the temp directory, we need to clean it up.
After('@files') do
  FileUtils.rm_rf(TempDir, :secure => true)
end

