require_relative '../../app/mtghub/set_collector'
module GathererSetParser; class Fetch; end; end

describe SetCollector do
  let(:subject) { SetCollector.new 'Gatecrash' }

  describe '#cards' do
    it 'returns formatted parsed cards' do
      GathererSetParser::Fetch.should_receive(:new).with('Gatecrash').
        and_return(stub cards: [{card_type: 'test'}])
      expect(subject.cards.first).to include main_type: 'test'
    end
  end

  describe '#parsed_cards' do
    it 'fetches cards from the set parser' do
      GathererSetParser::Fetch.should_receive(:new).with('Gatecrash').
        and_return(stub cards: ['dimir'])
      expect(subject.parsed_cards).to eq ['dimir']
    end
  end
end
