require_relative '../../app/mtghub/star_addition'

describe StarAddition do
  let(:user) { double :user }
  let(:deck) { double :deck }
  let(:addition) { StarAddition.new user, deck }

  describe '#process' do
    it 'creates star with user and deck' do
      deck.stub_chain(:stars, :find_by_user_id) { nil }
      expect(addition).to receive(:create_star)
      addition.process
    end

    it 'does not create star if one exists' do
      deck.stub_chain(:stars, :find_by_user_id) { true }
      expect(addition).to_not receive(:create_star)
      addition.process
    end
  end
end
