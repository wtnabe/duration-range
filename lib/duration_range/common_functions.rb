module DurationRange
  module CommonFunctions
    #
    # @param today [Date]
    #
    def initialize(today: ::Date.today)
      @today = today
    end
    attr_reader :today

    #
    # @return [Array]
    #
    def modes
      [:array, :hash]
    end

    #
    # @param as [Symbol]
    # @param begin_date [Date]
    # @param end_date [Date]
    # @return [Object]
    #
    # :reek:UtilityFunction :reek:ControlParameter
    def tidy_with_date(as:, begin_date:, end_date:)
      case as
      when :array
        (begin_date..end_date).to_a
      when :hash
        { begin: begin_date, end: end_date }
      end
    end

    #
    # @param month [String]
    # @param as [Symbol]
    # @return [Object]
    #
    def month_as_date(month, as:)
      this_month_as_date(as: as, reference_date: ::Date.parse(month + '-01'))
    end

    #
    # @param months [Array]
    # @param as [Symbol]
    # @return [Object]
    #
    # :reek:NilCheck :reek:TooMenyStatements
    def months_as_date(*months, as:)
      min = nil
      max = nil
      months.each { |mon|
        dates = month_as_date(mon, as: :hash)
        begin_date = dates[:begin]
        end_date = dates[:end]

        if min.nil? || begin_date < min
          min = begin_date
        end
        if max.nil? || max < end_date
          max = end_date
        end
      }

      tidy_with_date(as: as, begin_date: min, end_date: max)
    end

    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_month_as_date(as:, reference_date: today)
      begin_date = reference_date.at_beginning_of_month
      end_date = reference_date.at_end_of_month

      tidy_with_date(as: as, begin_date: begin_date, end_date: end_date)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_month(as:, count: 1)
      this_month(as: as, reference_date: today.months_since(count))
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_month(as:, count: 1)
      this_month(as: as, reference_date: today.months_ago(count))
    end
 
    #
    # @param as [Symbol]
    # @param reference_date [Date]
    # @return [Object]
    #
    def this_week(as:, reference_date: today)
      begin_date = reference_date.beginning_of_week
      end_date = reference_date.end_of_week

      tidy_with_date(as: as, begin_date: begin_date, end_date: end_date)
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def next_week(as:, count: 1)
      this_week(as: as, reference_date: today.weeks_since(count))
    end

    #
    # @param as [Symbol]
    # @param count [Integer]
    # @return [Object]
    #
    def last_week(as:, count: 1)
      this_week(as: as, reference_date: today.weeks_ago(count))
    end
  end
end
