class Printer
  attr_reader :report, :stdout

  def initialize(report:, stdout: $stdout)
    @report = report
    @stdout = stdout
  end

  def display
    stdout.puts(format_pages_total_views.concat(format_pages_unique_views))
  end

  def format_pages_total_views
    report.pages_by_total_views.map do |page, ip|
      "#{page} #{ip} visits"
    end
  end

  def format_pages_unique_views
    report.pages_by_unique_views.map do |page, ip|
      "#{page} #{ip} unique views"
    end
  end
end
