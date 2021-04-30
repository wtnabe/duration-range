require "active_support/core_ext/date"
require "active_support/core_ext/time"
require_relative "./common_functions"

module DurationRange
  class Date
    include DurationRange::CommonFunctions

    def initialize(today: ::Date.today)
      @today = today
    end
    attr_reader :today
  end
end
