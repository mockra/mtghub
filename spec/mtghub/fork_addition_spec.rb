require_relative '../../app/mtghub/fork_addition'

describe ForkAddition do
  let(:deck) { stub cards: [:card], sideboard_cards: [:sideboard] }
  let(:new_deck) { double(:deck) }
  let(:user) { double(:user) }
  let(:addition) { ForkAddition.new user, deck }

  describe '#create' do
    before { addition.stub new_deck: new_deck }

    it 'creates a new deck for given user' do
      new_deck.should_receive(:origin=).with(deck)
      new_deck.should_receive(:cards=).with([:card])
      new_deck.should_receive(:sideboard_cards=).with([:sideboard])
      new_deck.should_receive(:save)
      addition.create
    end
  end

  describe '#new_deck' do
    it 'creates a new deck based for user' do
      user.should_receive(:decks) { deck }
      deck.should_receive(:build)
      deck.should_receive(:attributes)
      addition.new_deck
    end
  end
end
