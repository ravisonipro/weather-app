
require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    context 'with a valid city' do
      let(:city) { 'New York' }

      it 'returns a successful response' do
        get :index, params: { city: city }
        expect(response).to have_http_status(:success)
      end

      it 'assigns the weather data' do
        get :index, params: { city: city }
        expect(assigns(:weather_data)).to be_a(Hash)
      end
    end
  end
end
