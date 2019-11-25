require 'spec_helper'
require 'log_entry'

RSpec.describe LogEntry do
  subject(:log_entry) { described_class.new(row_line) }

  let(:row_line) { ['/help_page/1', '184.123.665.067'] }

  it { is_expected.to have_attributes(url: '/help_page/1', ip: '184.123.665.067') }
end
