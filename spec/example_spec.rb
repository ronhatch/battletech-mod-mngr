require 'spec_helper.rb'

describe Integer do
  it "should have a passing test" do
    (2 + 2).should == 4
  end

  it "should have a failing test" do
    (2 + 2).should == 5
  end

  it "should have a pending test"
end
