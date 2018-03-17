begin
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:cucumber,'Run Cucumber features without @pending or @wip tags') do |t|
    t.cucumber_opts = '--tags ~@pending --tags ~@wip --format pretty --format html --out=Cucumber-Report.html'
  end

  Cucumber::Rake::Task.new(:wip, 'Run Cucumber features with @wip tags') do |t|
    t.cucumber_opts = '--tags @wip --format pretty'
  end
rescue LoadError
  desc 'Rake task for Cucumber is not available'
  task :cucumber do
    abort 'Cucumber does not appear to be installed. (Try "gem install cucumber".)'
  end
  desc 'Rake task for Cucumber is not available'
  task :wip => :cucumber
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = '--color --format documentation --format html --out=RSpec-Report.html'
  end
rescue LoadError
  desc 'Rake task for RSpec is not available'
  task :spec do
    abort 'RSpec does not appear to be installed. (Try "gem install rspec".)'
  end
end

task :rspec => :spec
desc 'Run RSpec and Cucumber tests'
task :test => [:spec, :cucumber]

