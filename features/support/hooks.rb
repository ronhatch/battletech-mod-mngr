# Any scenario that uses files needs the temp directory.
Before('@files') do
  unless Dir.exist?('temp-testing') then
    Dir.mkdir('temp-testing')
  end
  unless File.exist?('temp-testing/Readme.txt') then
    text  = "This entire directory is used only for testing.\n"
    text += "These files should all be deleted at the end of each test,\n"
    text += "  but if they are still here you can safely delete them manually.\n"
    File.write('temp-testing/Readme.txt', text)
  end
end

# And if we've made the temp directory, we need to clean it up.
After('@files') do
  Dir.foreach('temp-testing') do |f|
    name = "temp-testing/#{f}"
    if File.file?(name) then
      File.delete(name)
    end
  end
  Dir.delete('temp-testing')
end

