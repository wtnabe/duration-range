require "active_support/core_ext/date"
require "active_support/core_ext/time"
require_relative "./common_functions"

module DurationRange
  class Date
    include DurationRange::CommonFunctions

    #
    # generate specific month duration (e.g. 2021-04)
    #
    # @param month [String]
    # @param as [Symbol]
    # @return [Object]
    #
    def month(month, as: :array)
      month_as_date(month, as: as)
    end

    #
    # longest duration from multiple months
    #
    # @param months [Array]
    # @param as [Symbol]
    # @return [Object]
    #
    def months(*months, as: :array)
      months_as_date(*months, as: as)
    end

    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_month(as: :array, reference_date: today)
      this_month_as_date(as: as, reference_date: reference_date)
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
