module Festibals
  require 'ostruct'
  require 'icalendar'

  class Festibal < OpenStruct

    #ATTRS: date_start, summary, recurrence_rule
    SUMMARY_PARAMS = {"language" => "ENGLISH"}

    def to_ical_event
      event = Icalendar::Event.new   
      event.dtstart = Date.new(start_year, start_month, start_day) || DateTime.now
      event.summary = Icalendar::Values::Text.new summary || "An Awesome Festival", SUMMARY_PARAMS
      event.categories = "Holidays"
      event = set_alarm(event)

      # RRULE value --> RRULE:FREQ=MONTHLY;COUNT=10;BYDAY=1FR (Monthly on the 1st Friday for ten occurrences)
      # Checkout RFC2445 for more info: http://tools.ietf.org/html/rfc2445#section-4.8.5
      event.rrule = recurrence_rule
      
      return event
    end

    def set_alarm(event)
      event.alarm do |a|
        a.action  = "DISPLAY" # This line isn't necessary, it's the default
        a.summary = "Alarm notification"
        a.trigger = "-P1DT9H0M0S" # 1 day before
      end
      return event
    end

  end
end