require_relative 'lib/heroes/version'

Gem::Specification.new do |spec|
  spec.name          = "heroes"
  spec.version       = Heroes::VERSION
  spec.authors       = ["Cole Flournoy"]
  spec.email         = ["flournoy.cole@gmail.com"]

  spec.summary       = "This gem scrapes a Superhero API, and allows users to compare character stats, fights, etc."
  spec.homepage      = "https://github.com/cole-flournoy/heroes-CLI"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cole-flournoy/heroes-CLI"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dotenv"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "nokogiri"


end
