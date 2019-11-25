require 'pry'

class PagesReport
  attr_reader :data_source

  def initialize(data_source:)
    @data_source = data_source
  end

  def pages_by_total_views
    data_source
      .data
      .group_by(&:page)
      .transform_values{|log_entries| log_entries.map(&:ip).count}
      .to_a
      .sort_by {|_page, ip| ip}
      .reverse
  end

  private
end
