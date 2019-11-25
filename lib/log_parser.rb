# frozen_string_literal: true

require 'csv'
require_relative 'log_entry'

# Responsible for parsing .log file. Has simple
# .data interface
#
class LogParser
  attr_reader :file_path

  # @param [String] file_path
  #
  def initialize(file_path:)
    @file_path = file_path
  end

  # Read data from file and cast each line into LogEntry DTO
  #
  # @returns Array<LogEntry>
  def data
    CSV.foreach(full_path, col_sep: ' ').map do |line|
      LogEntry.new(line)
    end
  rescue Errno::ENOENT
    puts "File #{file_path} not found"
    exit(1)
  end

  private

  def full_path
    @full_path ||= File.expand_path(file_path)
  end
end
