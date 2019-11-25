class Printer
  attr_reader :report

  def initialize(report:)
    @report = report
  end

  def display
    render = report.pages_by_total_views.map do |page, ip|
      "#{page} #{ip} visits"
    end
    puts render
  end
end
