require "active_support/core_ext/date"
require "active_support/core_ext/time"
require_relative "./common_functions"

module DurationRange
  class Time
    include DurationRange::CommonFunctions

    #
    # @param today [Date]
    # @param localtime [boolish]
    #
    # :reek:BooleanParameter
    def initialize(today: ::Date.today, with_localtime: false)
      @today = today
      @with_localtime = with_localtime
    end
    attr_reader :today, :with_localtime

    #
    # @param as [Symbol]
    # @param begin_date [Date]
    # @param end_date [Date]
    # @return [Object}
    #
    # :reek:TooManyStatements :reek:ControlParameter
    def tidy_with_time(as:, begin_date:, end_date:)
      case as
      when :array
        tidy_with_date(as: :array, begin_date: begin_date, end_date: end_date).map { |date| to_time(date) }
      when :hash
        {
          begin: to_time(begin_date),
          end: to_time(end_date)
        }
      end
    end

    #
    # @param date [Date]
    # @return [Time]
    #
    # :reek:FeatureEnvy
    def to_time(date)
      with_localtime ? date.to_time : date.to_time(:utc)
    end

    #
    # @param month [String]
    # @param as [Symbol]
    # @return [Object]
    #
    def month(month, as: :hash)
      dates = month_as_date(month, as: :hash)

      tidy_with_time(as: as, begin_date: dates[:begin], end_date: dates[:end] + 1)
    end

    #
    # @param months [Array]
    # @param as [Symbol]
    # @return [Object]
    #
    def months(*months, as: :hash)
      dates = months_as_date(*months, as: :hash)

      tidy_with_time(as: as, begin_date: dates[:begin], end_date: dates[:end] + 1)
    end

    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_month(as: :hash, reference_date: today)
      dates = this_month_as_date(as: :hash, reference_date: reference_date)

      tidy_with_time(as: as, begin_date: dates[:begin], end_date: dates[:end] + 1)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_month(as: :hash, count: 1)
      this_month(as: as, reference_date: today.months_since(count))
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_month(as: :hash, count: 1)
      this_month(as: as, reference_date: today.months_ago(count))
    end
    
    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_week(as: :hash, reference_date: today)
      dates = super(as: :hash, reference_date: reference_date)

      tidy_with_time(as: as, begin_date: dates[:begin], end_date: dates[:end] + 1)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_week(as: :hash, count: 1)
      this_week(as: as, reference_date: today.weeks_since(count))
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_week(as: :hash, count: 1)
      this_week(as: as, reference_date: today.weeks_ago(count))
    end
  end
end
