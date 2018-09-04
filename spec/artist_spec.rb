require 'artist'

RSpec.describe Artist do
  describe 'INFO_KINDS' do
    it 'holds the available kinds of information' do
      expect(described_class::INFO_KINDS).to eq [:albums, :top_tracks, :related_artists]
    end
  end
end
