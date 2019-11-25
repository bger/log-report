require 'pages_report'
require 'pry'

RSpec.describe PagesReport do
  subject(:report) { described_class.new(data_source: source) }

  let(:source) { instance_double('LogParser', data: [
    instance_double('LogEntry', page: '/contact', ip: '184.123.665.067'),
    instance_double('LogEntry', page: '/contact', ip: '718.344.344.444'),
    instance_double('LogEntry', page: '/home', ip: '234.324.343.777'),
    instance_double('LogEntry', page: '/help_page/1', ip: '722.247.931.582'),
    instance_double('LogEntry', page: '/help_page/1', ip: '722.247.931.582'),
    instance_double('LogEntry', page: '/help_page/1', ip: '722.247.931.582')
  ])}

  describe '#pages_by_total_views' do
    it 'groups data by pages' do
      # binding.pry
      expect(report.pages_by_total_views.keys).to match_array(['/contact', '/help_page/1', '/home'])
    end

    context 'collection' do
      it 'is sorted by total views' do
        skip
      end
    end
  end
end
