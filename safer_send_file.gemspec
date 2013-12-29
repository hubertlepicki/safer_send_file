# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "safer_send_file"
  s.version     = "0.0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Hubert Łępicki"]
  s.email       = ["hubert.lepicki@amberbit.com"]
  s.homepage    = "http://www.amberbit.com"
  s.summary     = "Safer send_file for Rails"
  s.description = "implements safer_send_file method that allows sending files only from specified directories"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "safer_send_file"

  s.add_dependency("rails", [">= 3.0"])

  s.add_development_dependency("rspec", ["= 2.0.0.beta.22"])

  s.files        = Dir.glob("lib/**/*") + %w(MIT_LICENSE README.rdoc)
  s.require_path = 'lib'
end
