When /^I load configuration from the file "(.*?)"$/ do |f|
  @config = BattleTech::load_config("#{TempDir}/#{f}")
end

Then /^the configuration will match the defaults$/ do
  @config.should == BattleTech::ConfigDefaults
end

