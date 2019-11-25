require 'csv'
require 'log_entry'
require 'pry'

class LogParser
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def data
    CSV.foreach(full_path, col_sep: ' ').map do |line|
      LogEntry.new(line)
    end
  rescue Errno::ENOENT => e
    puts "File #{file_path} not found"
    exit(1)
  end

  private

  def full_path
    @full_path ||= File.expand_path(file_path, __FILE__)
  end
end
