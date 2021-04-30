require "duration_range/version"
require "active_support/core_ext/date"
require "active_support/core_ext/time"

class DurationRange
  class Error < StandardError; end

  def initialize(today: Date.today)
    @today = today
  end
  attr_reader :today

  #
  # @param reference_date [Date]
  # @return [Range]
  #
  def this_month(reference_date: today)
    begin_date = reference_date.at_beginning_of_month
    end_date = reference_date.at_end_of_month
    
    (begin_date..end_date).lazy
  end

  #
  # @param count [Integer]
  # @return [Range]
  #
  def next_month(count: 1)
    this_month(reference_date: today.months_since(count))
  end

  #
  # @param count [Integer]
  # @return [Range]
  #
  def last_month(count: 1)
    this_month(reference_date: today.months_ago(count))
  end
 
  #
  # @param reference_date [Date]
  # @return [Range]
  #
  # :reek:UtilityFuncion
  def this_week(reference_date: today)
    begin_date = reference_date.beginning_of_week
    end_date = reference_date.end_of_week

    (begin_date..end_date).lazy
  end

  #
  # @param count [Integer]
  # @return [Range]
  #
  def next_week(count: 1)
    this_week(reference_date: today.weeks_since(count))
  end

  #
  # @param count [Integer]
  # @return [Range]
  #
  def last_week(count: 1)
    this_week(reference_date: today.weeks_ago(count))
  end
end
