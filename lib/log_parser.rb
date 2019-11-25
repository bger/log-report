require 'csv'

class LogParser
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def data
    CSV.foreach(full_path, col_sep: ' ')
  end

  private

  def full_path
    @full_path ||= File.expand_path(file_path, __FILE__)
  end
end
