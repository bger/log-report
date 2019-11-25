require 'printer'

RSpec.describe Printer do
  subject(:printer) { described_class.new(report: report) }

  let(:report) { instance_double('PagesReport',
    pages_by_total_views: [['/contact', 10],['/home', 8]],
    pages_by_unique_views: [['/contact', 8],['/home', 5]]
  )}

  describe '#display' do
    it 'prints pages ordered by total views' do
      expect { printer.display }.to output(<<~MESSAGE
        /contact 10 visits
        /home 8 visits
        MESSAGE
      ).to_stdout
    end

    it 'prints pages ordered by unique view' do
      skip
    end
  end
end
