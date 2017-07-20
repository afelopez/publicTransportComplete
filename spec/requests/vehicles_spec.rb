require 'rails_helper'

RSpec.describe Api::VehiclesController, type: :request do 
  # Test suite for GET /todos
  #Vehicle is empty
  describe 'GET /api/vehicles' do
    # make HTTP get request before each example
    before { get '/api/vehicles' }

    it 'returns vehicles' do
      expect(json).to be_empty
      expect(json.size).to eq(0)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /todos
  describe 'POST /api/vehicles' do
    # valid payload
    let(:valid_attributes) { { plate: 'ABC123', color: 'red', year: 2009 } }

    context 'when the request is valid' do
      before { post '/api/vehicles', params: valid_attributes }

      it 'creates a vehicle' do
        expect(json['plate']).to eq('ABC123')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/vehicles', params: { plate: 'ABC342', color: 'red'} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Year can't be blank, Year is not a number/)
      end
    end
  end
end
