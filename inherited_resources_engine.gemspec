# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "inherited_resources_engine/version"

Gem::Specification.new do |s|
  s.name        = "inherited_resources_engine"
  s.version     = InheritedResourcesEngine::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Burke Libbey", "Stefan Penner"]
  s.email       = ["blibbey@innovatisinc.ca", "spenner@innovatisinc.ca"]
  s.homepage    = ""
  s.summary     = %q{sort of like inherited_resources_views for 3.1}
  s.description = %q{sort of like inherited_resources_views for 3.1}

  s.add_dependency "inherited_resources"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
