class LogEntry
  attr_reader :page, :ip

  def initialize(line)
    @page, @ip = line
  end
end
