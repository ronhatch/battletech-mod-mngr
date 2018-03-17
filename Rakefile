require 'cucumber/rake/task'
require 'rspec/core/rake_task'

task :rspec => :spec
task :test => [:spec, :cucumber]

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = '--tags ~@pending --tags ~@wip --format pretty --format html --out=Cucumber-Report.html'
end

Cucumber::Rake::Task.new(:wip) do |t|
  t.cucumber_opts = '--tags @wip --format pretty'
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = '--color --format documentation --format html --out=RSpec-Report.html'
end

