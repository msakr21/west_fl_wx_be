# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EscambiaCountFLAlerts API' do
  describe 'GET /EscambiaCountyFlAlerts' do
    describe 'When there are alert records' do
      before :each do
        @json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/alerts_with_moderate_filter.json')
        stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
          status: 200, body: @json_response
        )
        get '/api/v1/EscambiaCountyFLAlerts'

        @alerts = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns http status code 200' do
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it 'returns alerts' do
        expect(@alerts).to be_a Hash
        expect(@alerts).to have_key(:data)
        expect(@alerts[:data]).to be_a Array

        expect(@alerts[:data].first).to have_key(:id)
        expect(@alerts[:data].first).to have_key(:type)
        expect(@alerts[:data].first).to have_key(:attributes)

        expect(@alerts[:data].first[:id]).to be_a String
        expect(@alerts[:data].first[:type]).to be_a String
        expect(@alerts[:data].first[:attributes]).to be_a Hash

        expect(@alerts[:data].first[:attributes]).to have_key(:areas_affected)
        expect(@alerts[:data].first[:attributes]).to have_key(:effective_at)
        expect(@alerts[:data].first[:attributes]).to have_key(:ends_at)
        expect(@alerts[:data].first[:attributes]).to have_key(:status)
        expect(@alerts[:data].first[:attributes]).to have_key(:severity)
        expect(@alerts[:data].first[:attributes]).to have_key(:event)

        expect(@alerts[:data].first[:attributes][:areas_affected]).to be_a String
        expect(@alerts[:data].first[:attributes][:effective_at]).to be_a String
        expect(@alerts[:data].first[:attributes][:ends_at]).to be_a String
        expect(@alerts[:data].first[:attributes][:status]).to be_a String
        expect(@alerts[:data].first[:attributes][:severity]).to be_a String
        expect(@alerts[:data].first[:attributes][:event]).to be_a String
      end
    end

    describe 'When there are no alert records' do
      before :each do
        @json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/no_current_alerts.json')
        stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
          status: 200, body: @json_response
        )
        get '/api/v1/EscambiaCountyFLAlerts'

        @alerts = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns no current alerts' do
        expect(@alerts).to have_key(:data)
        expect(@alerts[:data]).to eq('No Current Alerts')
      end
    end
  end
end
