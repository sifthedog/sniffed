# frozen_string_literal: true

require_relative "lib/sniffed/version"

Gem::Specification.new do |spec|
  spec.name          = "sniffed"
  spec.version       = Sniffed::VERSION
  spec.authors       = ["João Fernandes", "Sif The Dog"]
  spec.email         = ["joaopfernandesc@gmail.com"]

  spec.description   = "Keeps track of multiple changes made in a transaction."
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/sifthedog/sniffed"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sifthedog/sniffed"
  spec.metadata["changelog_uri"] = "https://github.com/sifthedog/sniffed/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.0", "< 6.2"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "rubocop-rspec", "~> 1.7"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "sqlite3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
