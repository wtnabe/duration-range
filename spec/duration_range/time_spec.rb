require 'spec_helper'

describe DurationRange::Time do
  include TestableRange

  # additional 1 day for `less than` with time

  def duration_with_utc
    @duration_with_utc ||= DurationRange::Time.new(today: Date.parse('2021-04-30'))
    @duration_with_utc
  end

  def duration_with_localtime
    @duration_with_localtime ||= DurationRange::Time.new(today: Date.parse('2021-04-30'), with_localtime: true)
    @duration_with_localtime
  end

  describe 'with_utc' do
    describe 'given 2021-04-30' do
      describe '#this_month' do
        describe 'as: :hash' do
          it {
            assert {
              { begin: '2021-04-01 00:00:00 UTC', end: '2021-05-01 00:00:00 UTC' } == stringified_hash(duration_with_utc.this_month)
            }
          }
        end
      end

      describe '#this_week' do
        describe 'as: :hash' do
          it {
            assert {
              { begin: '2021-04-26 00:00:00 UTC', end: '2021-05-03 00:00:00 UTC' } == stringified_hash(duration_with_utc.this_week)
            }
          }
        end
      end
    end
  end

  describe 'with_localtime' do
    describe '2021-04-30' do
      describe '#this_week' do
        describe 'as: :hash' do
          it {
            assert {
              { begin: '2021-04-26 00:00:00 +0900', end: '2021-05-03 00:00:00 +0900' } == stringified_hash(duration_with_localtime.this_week)
            }
          }
        end

        describe 'as: :array' do
          it {
            assert {
              ['2021-04-26 00:00:00 +0900', '2021-05-03 00:00:00 +0900'] == two_of_array_of_string(duration_with_localtime.this_week(as: :array))
            }
          }
        end
      end
    end
  end

  describe '#last_month' do
    it {
      assert {
        { begin: '2021-03-01 00:00:00 UTC', end: '2021-04-01 00:00:00 UTC' } == stringified_hash(duration_with_utc.last_month)
      }
    }
  end

  describe '#next_month' do
    it {
      assert {
        { begin: '2021-05-01 00:00:00 UTC', end: '2021-06-01 00:00:00 UTC' } == stringified_hash(duration_with_utc.next_month)
      }
    }
  end

  describe '#last_week' do
    it {
      assert {
        { begin: '2021-04-19 00:00:00 UTC', end: '2021-04-26 00:00:00 UTC' } == stringified_hash(duration_with_utc.last_week)
      }
    }
  end

  describe '#next_week' do
    describe 'as: :hash' do
      it {
        assert {
          { begin: '2021-05-03 00:00:00 UTC', end: '2021-05-10 00:00:00 UTC' } == stringified_hash(duration_with_utc.next_week)
        }
      }
    end

    describe 'as: :array' do
      it {
        assert {
          ['2021-05-03 00:00:00 UTC', '2021-05-10 00:00:00 UTC'] == two_of_array_of_string(duration_with_utc.next_week(as: :array))
        }
      }
    end
  end
end

