$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "duration_range"

require "minitest/autorun"
require "minitest/reporters"
require "minitest-power_assert"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

Dir.glob(__dir__ + "/support/**/*.rb").each { |f|
  require f.sub(/\.rb/, '')
}
