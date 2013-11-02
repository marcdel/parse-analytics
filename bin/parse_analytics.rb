#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parse_analytics'

analytics = Analytics.new ARGV[0]
website = Website.new ARGV[1]

report = Report.new analytics, website

puts report.render
