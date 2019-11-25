require 'spec_helper'
require 'log_parser'

RSpec.describe LogParser do
  subject(:parser) { described_class.new(file_path: file_path) }

  let(:file_path) { File.expand_path('spec/fixtures/webserver.log') }

  context 'for correct path' do
    it 'returns all rows' do

    end

    it 'returns parsed collection' do

    end
  end

  context 'for incorrect path' do
    it 'shows a warning' do

    end
  end
end
