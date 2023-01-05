# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EscambiaCountFLAlerts API' do
  describe 'GET /EscambiaCountyFlAlerts' do
    describe 'When there are alert records' do
      before :each do
        json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/alerts_with_moderate_filter.json')
        stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
          status: 200, body: json_response
        )
        get '/api/v1/EscambiaCountyFLAlerts'
      end

      let!(:alerts) { JSON.parse(response.body, symbolize_names: true) }

      it 'returns http status code 200' do
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it 'returns alerts' do
        expect(alerts).to be_a Hash
        expect(alerts).to have_key(:data)
        expect(alerts[:data]).to be_a String
      end
    end

    describe 'When there are no alert records' do
      before :each do
        json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/no_current_alerts.json')
        stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
          status: 200, body: json_response
        )
        get '/api/v1/EscambiaCountyFLAlerts'
      end

      let!(:alerts) { JSON.parse(response.body, symbolize_names: true) }

      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns no current alerts' do
        expect(alerts).to have_key(:data)
        expect(alerts[:data]).to eq('No Current Alerts')
      end
    end
  end
end
