# Festibals

A ruby gem that easily integrates a schedule of philippine festivals to your calendar.

A sample ics file [here](www.gerdadecio.com/page/philippine_festivals.ics)
## Installation

Add this line to your application's Gemfile:

    gem 'festibals'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install festibals

## Usage

calendar = Festibals::FestibalCalendar.new.calendar
calendar.to_ical

## Contributing

1. Fork it ( http://github.com/<my-github-username>/festibals/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
