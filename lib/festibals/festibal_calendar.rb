module Festibals
  require 'yaml'
  require 'icalendar'

  class FestibalCalendar
    attr_reader :calendar

    FILES = Dir[File.join(File.expand_path('lib/festibals/list/*.yml'))]

    def initialize
      @calendar = Icalendar::Calendar.new
      add_events
      set_calendar_name
      set_calendar_lang
      set_calendar_region
      @calendar.publish
    end

    def set_calendar_name
      @calendar.append_custom_property("X-WR-CALNAME", "Philippine Festivals")
    end

    def set_calendar_lang
      @calendar.append_custom_property("X-APPLE-LANGUAGE", "en")
    end

    def set_calendar_region
      @calendar.append_custom_property("X-APPLE-REGION", "PH")
    end

    def add_events
      FILES.each do |file|
        fileContent = File.open(File.expand_path(file))
        festivalParams = YAML::load(fileContent)['name']
        @calendar.add_event Festibal.new(festivalParams).to_ical_event
      end

      #@calendar.add_event(Festival.new(params).to_ical_event)
    end

  end
end