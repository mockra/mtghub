require 'spec_helper'

describe DecksController do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }
  before { controller.stub current_user: user }

  describe '#new' do
    it 'assigns a new deck' do
      get :new, user_id: user
      expect(assigns[:deck]).to be_a_new Deck
    end

    it 'assigns a deck belonging to current user' do
      get :new, user_id: user
      expect(assigns[:deck].user).to eq user
    end
  end

  describe '#edit' do
    it 'assigns the specified deck' do
      get :edit, user_id: user, id: deck
      expect(assigns[:deck]).to eq deck
    end
  end

  describe '#create' do
    context 'success' do
      it 'redirects to deck' do
        post :create, user_id: user, deck: attributes_for(:deck)
        expect(response).to redirect_to(
          edit_user_deck_url user, assigns[:deck])
      end

      it 'persists a new deck' do
        expect {
          post :create, user_id: user, deck: attributes_for(:deck)
        }.to change(Deck, :count).by 1
      end
    end

    context 'failure' do
      it 'renders new' do
        post :create, user_id: user, deck: { title: '' }
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    it 'assigns the given deck' do
      get :show, user_id: user, id: deck
      expect(assigns[:deck]).to eq deck
    end
  end
end
