require "bundler"
Bundler.setup

require "rake"
require "rake/rdoctask"
require "rspec"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Rspec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
