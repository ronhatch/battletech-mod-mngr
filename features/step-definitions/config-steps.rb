Given /^the default configuration has a(?:n?) "(.*?)" option$/ do |opt|
  BattleTech::ConfigDefaults.should include opt
end

When /^I load the configuration file$/ do
  @config = BattleTech::load_config(File.join(TempDir, BattleTech::ConfigFilename))
end

Then /^the configuration will match the defaults$/ do
  @config.should == BattleTech::ConfigDefaults
end

Then /^the configuration will not match the defaults$/ do
  @config.should_not == BattleTech::ConfigDefaults
end

Then /^the configuration will be a superset of the defaults$/ do
  BattleTech::ConfigDefaults.each_key do |k|
    @config[k].should == BattleTech::ConfigDefaults[k]
  end
end

Then /^the configuration will not be considered valid$/ do
  BattleTech::is_config_valid?(@config).should == false
end

