require_relative '../../app/mtghub/fork_addition'

describe ForkAddition do
  let(:deck) { double cards: [:card], sideboard_cards: [:sideboard] }
  let(:new_deck) { double :deck }
  let(:user) { double :user }
  let(:addition) { ForkAddition.new user, deck }

  describe '#create' do
    before { addition.stub new_deck: new_deck }

    it 'creates a new deck for given user' do
      expect(new_deck).to receive(:user=).with(user)
      expect(new_deck).to receive(:origin=).with(deck)
      expect(new_deck).to receive(:cards=).with([:card])
      expect(new_deck).to receive(:sideboard_cards=).with([:sideboard])
      expect(new_deck).to receive(:save)
      addition.create
    end
  end
end
