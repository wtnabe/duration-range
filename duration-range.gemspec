lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "duration_range/version"

Gem::Specification.new do |spec|
  spec.name          = "duration-range"
  spec.version       = DurationRange::VERSION
  spec.authors       = ["wtnabe"]
  spec.email         = ["wtnabe@gmail.com"]

  spec.summary       = %q{generate Date or Time range from human daily time interval.}
  spec.homepage      = "https://github.com/wtnabe/duration-range."

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.metadata['source_code_uri']}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 5"
  
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1"
  spec.add_development_dependency "minitest-power_assert", "~> 0.3"
  spec.add_development_dependency "yard", "~> 0.9"
end
