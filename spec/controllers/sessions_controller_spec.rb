require 'spec_helper'

describe SessionsController do
  let(:user) { create :user }

  describe '#create' do
    context 'success' do
      it 'logs in the user' do
        post :create, session: { email: user.email, password: user.password }
        expect(cookies[:auth_token]).to eq user.auth_token
      end

      it 'redirects to root_url' do
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to user
      end
    end

    context 'failure' do
      it 'redirects to sign in' do
        post :create, session: { email: user.email, password: '' }
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    it 'deletes the auth cookie' do
      cookies[:auth_token] = 'test'
      delete :destroy, id: user.id
      expect(cookies[:auth_token]).to be_nil
    end
  end
end
