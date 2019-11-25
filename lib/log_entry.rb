class LogEntry
  attr_reader :url, :ip

  def initialize(line)
    @url, @ip = line
  end
end
