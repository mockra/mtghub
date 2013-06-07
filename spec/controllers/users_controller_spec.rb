require 'spec_helper'

describe UsersController do
  let(:user) { create :user }

  describe '#new' do
    it 'assigns a new user' do
      get :new
      expect(assigns[:user]).to be_a_new User
    end
  end

  describe '#create' do
    context 'success' do
      it 'redirects to root' do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to root_url
      end

      it 'persists a new user' do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by 1
      end
    end

    context '#failure' do
      it 'renders new' do
        post :create, user: { email: 'test' }
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    it 'assigns a user' do
      get :show, id: user
      expect(assigns[:user]).to eq user
    end
  end
end
