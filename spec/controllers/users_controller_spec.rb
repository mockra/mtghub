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
      it 'persists a new user' do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by 1
      end

      it 'creates auth cookie' do
        post :create, user: attributes_for(:user)
        expect(cookies[:auth_token]).to_not be_nil
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

  describe '#edit' do
    before { controller.stub current_user: user }

    it 'assigns the user' do
      get :edit, id: user
      expect(assigns[:user]).to eq user
      expect(response).to be_successful
    end
  end

  describe '#update' do
    before { controller.stub current_user: user }

    it 'updates the current_user' do
      post :update, id: user, user: { username: 'update' }
      expect(user.username).to eq 'update'
    end

    it 'redirects to user' do
      post :update, id: user, user: { id: 3 }
      expect(response).to redirect_to user
    end
  end

  describe '#destroy' do
    before { controller.stub current_user: user }

    it 'deletes the account' do
      expect {
        delete :destroy, id: user
      }.to change(User, :count).by -1
    end

    it 'clears auth_token and redirects to root' do
      delete :destroy, id: user
      expect(cookies[:auth_token]).to be_nil
      expect(response).to redirect_to root_url
    end
  end
end
