#!/usr/bin/env ruby
require_relative 'lib/log_parser'
require_relative 'lib/pages_report'
require_relative 'lib/printer'

file_path = ARGV[0]
parser = LogParser.new(file_path: file_path)
report = PagesReport.new(data_source: parser)
printer = Printer.new(report: report)
printer.display
