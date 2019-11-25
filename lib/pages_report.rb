# Responsible for any kind of reports grouped by pages
#
class PagesReport
  attr_reader :data_source

  # @param [ISourcable] any object that responds to .data interface
  #   and return list of <LogEntry>
  #
  def initialize(data_source:)
    @data_source = data_source
  end

  def pages_by_total_views
    group(log_entries)
  end

  def pages_by_unique_views
    group(log_entries.uniq{|log_entry| [log_entry.page, log_entry.ip]})
  end

  private

  def group(collection)
    collection
      .group_by(&:page)
      .transform_values {|log_entries| log_entries.map(&:ip).count}
      .to_a
      .sort_by {|_page, ip| ip}
      .reverse
  end

  def log_entries
    data_source.data
  end
end
