$:.push File.expand_path("lib", __dir__)

require "will_remember/version"

Gem::Specification.new do |spec|
  spec.name        = "will_remember"
  spec.version     = WillRemember::VERSION
  spec.authors     = ["Jeremiah A. Bohling"]
  spec.email       = ["jeremiah.bohling@gmail.com"]
  spec.summary     = "Page-tracking for will_paginate."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "will_paginate", "~> 3.1.7"
end
