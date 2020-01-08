require 'rspec/core'
require 'rspec/core/rake_task'

require './app'
require 'sinatra/activerecord/rake'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)
