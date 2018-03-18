When /^I load configuration from the file "(.*?)"$/ do |f|
  @config = BattleTech::load_config("#{TempDir}/#{f}")
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

