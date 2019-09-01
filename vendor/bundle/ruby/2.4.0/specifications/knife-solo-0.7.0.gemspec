# -*- encoding: utf-8 -*-
# stub: knife-solo 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-solo".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mat Schaffer".freeze]
  s.date = "2018-11-13"
  s.description = "Handles bootstrapping, running chef solo, rsyncing cookbooks etc".freeze
  s.email = "mat@schaffer.me".freeze
  s.homepage = "http://matschaffer.github.io/knife-solo/".freeze
  s.post_install_message = "Thanks for installing knife-solo!\n\nIf you run into any issues please let us know at:\n  https://github.com/matschaffer/knife-solo/issues\n\nIf you are upgrading knife-solo please uninstall any old versions by\nrunning `gem clean knife-solo` to avoid any errors.\n\nSee http://bit.ly/CHEF-3255 for more information on the knife bug\nthat causes this.".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "A collection of knife plugins for dealing with chef solo".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<berkshelf>.freeze, [">= 3.0.0.beta.2"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<ffi>.freeze, ["< 1.9.1"])
      s.add_development_dependency(%q<fog>.freeze, [">= 0"])
      s.add_development_dependency(%q<librarian-chef>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 4.7"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_development_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<chef>.freeze, [">= 10.20"])
      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 2.7"])
      s.add_runtime_dependency(%q<erubis>.freeze, ["~> 2.7.0"])
    else
      s.add_dependency(%q<berkshelf>.freeze, [">= 3.0.0.beta.2"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<ffi>.freeze, ["< 1.9.1"])
      s.add_dependency(%q<fog>.freeze, [">= 0"])
      s.add_dependency(%q<librarian-chef>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 4.7"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<chef>.freeze, [">= 10.20"])
      s.add_dependency(%q<net-ssh>.freeze, [">= 2.7"])
      s.add_dependency(%q<erubis>.freeze, ["~> 2.7.0"])
    end
  else
    s.add_dependency(%q<berkshelf>.freeze, [">= 3.0.0.beta.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<ffi>.freeze, ["< 1.9.1"])
    s.add_dependency(%q<fog>.freeze, [">= 0"])
    s.add_dependency(%q<librarian-chef>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 4.7"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<parallel>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<chef>.freeze, [">= 10.20"])
    s.add_dependency(%q<net-ssh>.freeze, [">= 2.7"])
    s.add_dependency(%q<erubis>.freeze, ["~> 2.7.0"])
  end
end
