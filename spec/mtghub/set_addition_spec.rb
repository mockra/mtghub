require_relative '../../app/mtghub/set_addition'

class CardsFromSet; end

describe SetAddition do
  let(:addition) { SetAddition.new 'Return to Ravnica', 'RTR',
    'Return to Ravnica' }
  let(:block) { double :block }

  describe '#process' do
    it 'creates a new set for given block' do
      expect(addition).to receive(:block).and_return(block).twice
      block.stub_chain :mtg_sets, :create
      expect(CardsFromSet).to receive(:new).and_return(double generate: true)
      addition.process
    end
  end
end
