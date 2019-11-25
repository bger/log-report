require 'printer'

RSpec.describe Printer do
  subject(:printer) { described_class.new(report: report) }

  let(:report) { instance_double('PagesReport',
    pages_by_total_views: [['/contact', 10],['/home', 8]],
    pages_by_unique_views: [['/contact', 8],['/home', 5]]
  )}

  describe '#display' do
    before { $stdout = StringIO.new }

    after { $stdout = STDOUT }

    it 'prints pages ordered by total views' do
      printer.display
      $stdout.rewind

      expect($stdout.read.chomp).to include("/contact 10 visits\n/home 8 visits")
    end

    it 'prints pages ordered by unique view' do
      printer.display
      $stdout.rewind

      expect($stdout.read.chomp).to include("/contact 8 unique views\n/home 5 unique views")
    end
  end
end
