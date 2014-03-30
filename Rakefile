require 'rake'
require 'rspec/core/rake_task'

ENV['HOME'] = 'C:\Users\m-namiki'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :default => :spec
