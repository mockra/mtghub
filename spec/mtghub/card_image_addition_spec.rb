require_relative '../../app/mtghub/card_image_addition'

describe CardImageAddition do
  let(:card) { double :card }
  let(:service) { double :service }
  let(:bucket) { double :bucket }
  let(:addition) { CardImageAddition.new card }

  before { card.stub image_url: 'test.jpeg', filename: '1.jpeg' }

  describe '#process' do
    it 'downloads and uploads the card image' do
      expect(addition).to receive(:open)
      expect(addition).to receive(:upload_card)
      expect(addition).to receive :delete_temp_card
      addition.process
    end
  end
end
