# Represents line of .log file
#
class LogEntry
  attr_reader :page, :ip

  # @param Array<String, String> an array containing page and ip
  #
  def initialize(line)
    @page, @ip = line
  end
end
