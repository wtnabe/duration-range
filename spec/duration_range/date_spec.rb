require 'spec_helper'

describe DurationRange::Date do
  #
  # @param range [Range]
  # @return [Array]
  #
  # :reek:UtilityFunction
  def range_to_array_of_string(range)
    arr = range.to_a
    [arr.first.to_s, arr.last.to_s]
  end

  describe '#this_month' do
    describe 'given 2021-04-30' do
      it 'from 2021-04-01 to 2021-04-30' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-04-01', '2021-04-30'] == range_to_array_of_string(duration.this_month)
        }
      end
    end

    describe 'given 2021-04-20' do
      it 'from 2021-04-01 to 2021-04-30' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-20'))

        assert {
          ['2021-04-01', '2021-04-30'] == range_to_array_of_string(duration.this_month)
        }
      end
    end
  end

  describe '#next_month' do
    describe 'given 2021-04-30' do
      it 'from 2021-05-01 to 2021-05-31' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-05-01', '2021-05-31'] == range_to_array_of_string(duration.next_month)
        }
      end
    end

    describe 'given 2021-04-30 and 2 month later' do
      it 'from 2021-06-01 to 2021-06-30' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-06-01', '2021-06-30'] == range_to_array_of_string(duration.next_month(count: 2))
        }
      end
    end
  end

  describe '#last_month' do
    describe 'given 2021-04-30' do
      it 'from 2021-03-01 to 2021-03-31' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-03-01', '2021-03-31'] == range_to_array_of_string(duration.last_month)
        }
      end
    end

    describe 'given 2021-04-30 and 2 months earlier' do
      it 'from 2021-02-01 to 2021-02-28' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-02-01', '2021-02-28'] == range_to_array_of_string(duration.last_month(count: 2))
        }
      end
    end
  end
  
  describe '#this_week' do
    describe 'given 2021-04-30' do
      it 'from 2021-04-26 to 2021-05-02' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-04-26', '2021-05-02'] == range_to_array_of_string(duration.this_week)
        }
      end
    end

    describe 'given 2021-04-20' do
      it 'from 2021-04-19 to 2021-04-25' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-20'))

        assert {
          ['2021-04-19', '2021-04-25'] == range_to_array_of_string(duration.this_week)
        }
      end
    end
  end

  describe '#next_week' do
    describe 'given 2021-04-30' do
      it 'from 2021-05-03 to 2021-05-09' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-05-03', '2021-05-09'] == range_to_array_of_string(duration.next_week)
        }
      end
    end

    describe 'given 2021-04-20' do
      it 'from 2021-04-26 to 2021-05-02' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-20'))

        assert {
          ['2021-04-26', '2021-05-02'] == range_to_array_of_string(duration.next_week)
        }
      end
    end

    describe 'given 2021-04-30 and 2 weeks later' do
      it 'from 2021-05-10 to 2021-05-16' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-05-10', '2021-05-16'] == range_to_array_of_string(duration.next_week(count: 2))
        }
      end
    end
  end

  describe '#last_week' do
    describe 'given 2021-04-30' do
      it 'from 2021-04-19 to 2021-04-25' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-04-19', '2021-04-25'] == range_to_array_of_string(duration.last_week)
        }
      end
    end

    describe 'given 2021-04-20' do
      it 'from 2021-04-12 to 2021-04-18' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-20'))

        assert {
          ['2021-04-12', '2021-04-18'] == range_to_array_of_string(duration.last_week)
        }
      end
    end

    describe 'given 2021-04-30 and 2 weeks earlier' do
      it 'from 2021-04-12 to 2021-04-18' do
        duration = DurationRange::Date.new(today: Date.parse('2021-04-30'))

        assert {
          ['2021-04-12', '2021-04-18'] == range_to_array_of_string(duration.last_week(count: 2))
        }
      end
    end
  end
end
