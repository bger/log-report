file_path = ARGV[0]
parser = LogParser.new(file_path)
report_builder = PagesReport.new(data_source: source)
printer = Printer.new(report: report)
printer.display
