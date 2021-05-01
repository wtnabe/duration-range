require "active_support/core_ext/date"
require "active_support/core_ext/time"
require_relative "./common_functions"

module DurationRange
  class Date
    include DurationRange::CommonFunctions

    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_month(as: :array, reference_date: today)
      super(as: as, reference_date: reference_date)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_month(as: :array, count: 1)
      super(as: as, count: count)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_month(as: :array, count: 1)
      super(as: as, count: count)
    end

    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_week(as: :array, reference_date: today)
      super(as: as, reference_date: reference_date)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_week(as: :array, count: 1)
      super(as: as, count: count)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_week(as: :array, count: 1)
      super(as: as, count: count)
    end
  end
end
