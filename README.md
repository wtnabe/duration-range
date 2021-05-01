# DurationRange

duration range data generator

## Features

generate Array / Hash of Date / Time

e.g.

```
{:begin=>Mon, 19 Apr 2021, :end=>Sun, 25 Apr 2021} # week as Hash of Date
[Mon, 19 Apr 2021, Tue, 20 Apr 2021, ... Sun, 25 Apr 2021] # week as Array of Date
{:begin=>2021-04-01 00:00:00 UTC, :end=>2021-05-01 00:00:00 UTC} # month as Hash of Time
```

available classes:

 * DurationRange::Date ( default type Array )
 * DurationRange::Time ( default type Hash )

DurationRange::Date generates range using `ge` and `le`. DurationRange::Time differs from that, it uses `ge` and `lt` to generate the range.

available methods:

 * this_week
 * last_week
 * next_week
 * this_month
 * last_month
 * next_month
 * month
 * months

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'duration-range'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install duration-range

## Usage

```
require 'duration-range'

DurationRange::Date.new.this_week.map(&:to_s)
# => ["2021-04-26", "2021-04-27", "2021-04-28", "2021-04-29", "2021-04-30", "2021-05-01", "2021-05-02"]

DurationRange::Date.new.last_month(as: :hash)
# => {:begin=>Thu, 01 Apr 2021, :end=>Fri, 30 Apr 2021}

DurationRange::Time.new.last_month
# => {:begin=>2021-04-01 00:00:00 UTC, :end=>2021-05-01 00:00:00 UTC}

DurationRange::Time.new.month('2021-04')
# => {:begin=>2021-04-01 00:00:00 UTC, :end=>2021-05-01 00:00:00 UTC}

DurationRange::Date.new.months('2021-04', '2021-06')
# => [Thu, 01 Apr 2021, Fri, 02 Apr 2021, ... Wed, 30 Jun 2021]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wtnabe/duration-range.
