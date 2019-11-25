require 'spec_helper'
require 'log_parser'

RSpec.describe LogParser do
  subject(:parser) { described_class.new(file_path: file_path) }

  context 'for correct path' do
    let(:file_path) { File.expand_path('spec/fixtures/webserver.log') }

    it 'returns all rows' do
      expect(parser.data.count).to eq(10)
    end

    it 'returns parsed collection' do
      actual_result = parser.data.map {|entry| [entry.page, entry.ip]}

      expect(actual_result).to match_array([
                                           ['/contact', '184.123.665.067'],
                                           ['/contact', '444.701.448.104'],
                                           ['/contact', '929.398.951.889'],
                                           ['/contact', '126.318.035.038'],
                                           ['/home', '184.123.665.067'],
                                           ['/help_page/1', '126.318.035.038'],
                                           ['/help_page/1', '126.318.035.038'],
                                           ['/help_page/1', '126.318.035.038'],
                                           ['/help_page/1', '929.398.951.889'],
                                           ['/help_page/1', '722.247.931.582']
                                         ])
    end

    it 'returns list of log entries' do
      expect(parser.data).to all(be_kind_of(LogEntry))
    end
  end

  context 'for incorrect path' do
    let(:file_path) { File.expand_path('spec/fixtures/invalid_name.log') }

    before { $stdout = StringIO.new }

    after { $stdout = STDOUT }

    before { allow(parser).to receive(:exit) }

    it 'shows a warning' do
      parser.data
      $stdout.rewind

      expect($stdout.read.chomp).to eq("File #{file_path} not found")
    end
  end
end
