require_relative '../../app/mtghub/set_collector'
module GathererSetParser; class Fetch; end; end

describe SetCollector do
  let(:subject) { SetCollector.new 'Gatecrash' }

  describe '#cards' do
    it 'returns formatted parsed cards' do
      expect(GathererSetParser::Fetch).to receive(:new).with('Gatecrash').
        and_return(double cards: [{card_type: 'test'}])
      expect(subject.cards.first).to include main_type: 'test'
    end
  end

  describe '#parsed_cards' do
    it 'fetches cards from the set parser' do
      expect(GathererSetParser::Fetch).to receive(:new).with('Gatecrash').
        and_return(double cards: ['dimir'])
      expect(subject.parsed_cards).to eq ['dimir']
    end
  end
end
