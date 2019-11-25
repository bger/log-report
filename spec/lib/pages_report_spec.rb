RSpec.describe 'PagesReport' do
  subject(:report) { described_class.new(data_source: source) }
  let(:source) { double(data: [

  ])}

  describe '#pages_by_total_views' do
    it 'returns collection of pages' do
      skip
    end

    context 'collection' do
      it 'is sorted by total views' do
        skip
      end
    end
  end
end
