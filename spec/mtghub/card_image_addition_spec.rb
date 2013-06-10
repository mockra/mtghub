require_relative '../../app/mtghub/card_image_addition'

module S3; class Service; end; end

describe CardImageAddition do
  let(:card) { double :card }
  let(:service) { double :service }
  let(:bucket) { double :bucket }
  let(:addition) { CardImageAddition.new card }

  before { S3::Service.stub new: service }
  before { card.stub image_url: 'test.jpeg', filename: '1.jpeg' }

  describe '#process' do
    it 'downloads and uploads the card image' do
      service.stub_chain(:buckets, :find) { bucket }
      expect(addition).to receive(:open).twice
      bucket.stub_chain(:objects, :build).
        and_return double 'content=' => true, save: true
      expect(File).to receive :delete
      addition.process
    end
  end
end
