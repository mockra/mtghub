require_relative '../../app/mtghub/cards_from_set'

class SetCollector; end
class CardAddition; end

describe CardsFromSet do
  let(:subject) { CardsFromSet.new 'Gatecrash' }

  describe '#generate' do
    it 'fetches cards from set collector for card addition' do
      SetCollector.should_receive(:new).with('Gatecrash').
        and_return(stub cards: ['hash'])
      CardAddition.should_receive(:new).with('Gatecrash', 'hash').
        and_return(stub create: '')
      subject.generate
    end
  end
end
