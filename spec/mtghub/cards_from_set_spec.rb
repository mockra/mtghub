require_relative '../../app/mtghub/cards_from_set'

class SetCollector; end
class CardAddition; end

describe CardsFromSet do
  let(:subject) { CardsFromSet.new 'Gatecrash' }

  describe '#generate' do
    it 'fetches cards from set collector for card addition' do
      expect(SetCollector).to receive(:new).with('Gatecrash').
        and_return(double cards: ['hash'])
      expect(CardAddition).to receive(:new).with('Gatecrash', 'hash').
        and_return(double create: '')
      subject.generate
    end
  end
end
