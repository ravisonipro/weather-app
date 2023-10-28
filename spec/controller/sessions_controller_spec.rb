# spec/controllers/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
        
      let(:user) { create(:user, email: 'test@example.com', password: 'test@123') }

      it 'logs in the user and redirects to the root path' do
        post :create, params: { email: 'test@example.com', password: 'test@123' }
        
        expect(session[:id]).to eq(user.id)
        expect(flash[:notice]).to eq('Login successful')
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'redirects to the login page with an error message' do
        post :create, params: { email: 'test@example.com', password: '12345' }
        expect(session[:user_id]).to be_nil
        expect(flash[:notice]).to eq('Invalid Email or Password')
        expect(response).to redirect_to('/login')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to the login page' do
      session[:user_id] = 1  # Set a user ID to simulate a logged-in user
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(flash[:notice]).to eq('Logged Out')
      expect(response).to redirect_to('/login')
    end
  end
end
