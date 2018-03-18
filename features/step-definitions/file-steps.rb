TempDir = 'temp-testing'

# Any scenario that uses files needs the temp directory.
Before('@files') do
  unless Dir.exist?(TempDir) then
    Dir.mkdir(TempDir)
  end
  unless File.exist?("#{TempDir}/Readme.txt") then
    text  = "This entire directory is used only for testing.\n"
    text += "These files should all be deleted at the end of each test,\n"
    text += "  but if they are still here you can safely delete them manually.\n"
    File.write("#{TempDir}/Readme.txt", text)
  end
end

Given /^the configuration file does not exist$/ do
  filename = "#{TempDir}/#{BattleTech::ConfigFilename}"
  if File.exist?(filename) then
    File.delete(filename)
  end
end

Given /^the configuration file contains:$/ do |contents|
  File.write("#{TempDir}/#{BattleTech::ConfigFilename}", contents)
end

# And if we've made the temp directory, we need to clean it up.
After('@files') do
  Dir.foreach(TempDir) do |f|
    name = "#{TempDir}/#{f}"
    if File.file?(name) then
      File.delete(name)
    end
  end
  Dir.delete(TempDir)
end

