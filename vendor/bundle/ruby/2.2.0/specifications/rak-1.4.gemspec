# -*- encoding: utf-8 -*-
# stub: rak 1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rak"
  s.version = "1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Lucraft"]
  s.date = "2012-01-15"
  s.description = "    Grep replacement, recursively scans directories to match a given Ruby regular expression. Prints highlighted results.\n    Based on the Perl tool 'ack' by Andy Lester.  \n"
  s.email = "dan@fluentradical.com"
  s.executables = ["rak"]
  s.files = ["bin/rak"]
  s.homepage = "http://rak.rubyforge.org"
  s.rubyforge_project = "rak"
  s.rubygems_version = "2.4.5"
  s.summary = "A grep replacement in Ruby, type \"rak pattern\"."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version
end
