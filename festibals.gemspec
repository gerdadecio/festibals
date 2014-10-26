# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'festibals/version'

Gem::Specification.new do |spec|
  spec.name          = "festibals"
  spec.version       = Festibals::VERSION
  spec.authors       = ["Gerda Decio"]
  spec.email         = ["gerdadecio@gmail.com"]
  spec.summary       = %q{Ical Philippine Festivals}
  spec.description   = %q{A ruby gem that easily integrates a schedule of philippine festivals to your calendar. Feel free to use and add more schedules or events.}
  spec.homepage      = "https://github.com/gerdadecio/festibals"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.files += [
    "lib/festibals/festibal.rb",
    "lib/festibals/festibal_calendar.rb"
  ]
  spec.files += Dir.glob("lib/festivals/*.yml")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('icalendar', '~> 2.2')
  spec.add_runtime_dependency("activesupport")

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
end
