# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "social-hamster/version"

Gem::Specification.new do |s|
  s.name        = "social-hamster"
  s.version     = SocialHamster::VERSION
  s.authors     = ["Victor Gumayunov"]
  s.email       = ["gumayunov@gmail.com"]
  s.homepage    = ""
  s.description = %q{Lib to abstract and unify interactions with social networks}
  s.summary     = s.description

  s.rubyforge_project = "social-hamster"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'hashie', '~> 1.2'
  s.add_dependency 'koala'

  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
