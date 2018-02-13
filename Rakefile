require 'cucumber/rake/task'
require 'rspec/core/rake_task'

task :test => [:spec, :cucumber]

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = '--format pretty --format html --out=Cucumber-Report.html'
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = '--color --format documentation --format html --out=RSpec-Report.html'
end

