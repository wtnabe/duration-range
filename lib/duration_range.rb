Dir.glob(__dir__ + "/duration_range/**/*.rb").each { |f|
  require f.sub(/\.rb/, '')
}

module DurationRange
  class Error < StandardError; end
end
