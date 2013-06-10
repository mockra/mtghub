require_relative '../../app/mtghub/card_addition'

class MtgSet; end
class CardImageAddition; end

describe CardAddition do
  let(:subject) { CardAddition.new 'Gatecrash', title: 'test' }

  describe '#create' do
    it 'creates a card' do
      subject.stub_chain(:mtg_set, :cards, :create)
      CardImageAddition.stub_chain :new, :process
      subject.create
    end
  end

  describe '#mtg_set' do
    it 'finds set by id' do
      expect(MtgSet).to receive(:find_by_title).with('Gatecrash')
      subject.mtg_set
    end
  end
end
