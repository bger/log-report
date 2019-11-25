require 'spec_helper'
require 'log_parser'

RSpec.describe LogParser do
  subject(:parser) { described_class.new(file_path: file_path) }

  let(:file_path) { File.expand_path('spec/fixtures/webserver.log') }

  context 'for correct path' do
    it 'returns all rows' do
      expect(parser.data.count).to eq(10)
    end

    it 'returns parsed collection' do
      actual_result = parser.data.map {|entry| [entry.url, entry.ip]}

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
    it 'shows a warning' do
      skip
    end
  end
end
