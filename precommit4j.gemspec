
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "precommit4j/version"

Gem::Specification.new do |spec|
  spec.name          = "precommit4j"
  spec.version       = PreCommit4J::VERSION
  spec.authors       = ["Seun Matt"]
  spec.email         = ["smatt382@gmail.com"]

  spec.summary       = %q{A pre-commit hook for running the checkstyle validation}
  spec.description   = %q{A pre-commit hook for running the checkstyle validation}
  spec.homepage      = "https://github.com/SeunMatt/precommit4j"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/SeunMatt/precommit4j"
    spec.metadata["changelog_uri"] = "https://github.com/SeunMatt/precommit4j"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = %w[checkstyle]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
