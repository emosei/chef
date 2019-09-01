# -*- encoding: utf-8 -*-
# stub: rak 1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rak".freeze
  s.version = "1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Lucraft".freeze]
  s.date = "2012-01-15"
  s.description = "    Grep replacement, recursively scans directories to match a given Ruby regular expression. Prints highlighted results.\n    Based on the Perl tool 'ack' by Andy Lester.  \n".freeze
  s.email = "dan@fluentradical.com".freeze
  s.executables = ["rak".freeze]
  s.files = ["bin/rak".freeze]
  s.homepage = "http://rak.rubyforge.org".freeze
  s.rubyforge_project = "rak".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "A grep replacement in Ruby, type \"rak pattern\".".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version
end
