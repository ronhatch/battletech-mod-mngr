Given /^Cucumber works$/ do
  true
end

When /^I run a passing step$/ do
  true
end

When /^I run a failing step$/ do
  fail 'Intentionally failed.'
end

When /^I run a pending step$/ do
  pending
end

Then /^this step should run$/ do
  true
end

Then /^this step should not run$/ do
  fail "Shouldn't have run this step."
end

