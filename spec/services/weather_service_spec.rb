# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService do
  it 'exists' do
    w_s = WeatherService.new

    expect(w_s).to be_an_instance_of(WeatherService)
  end

  describe 'Class Methods' do
    describe '#conn' do
      it 'creates a url prefix', :vcr do
        expect(WeatherService.conn.url_prefix).to be_a URI
      end
    end

    describe '#escambia_county_alerts' do
      describe 'when alert records exist' do
        it 'displays weather alerts for escambia county' do
          json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/alerts_with_moderate_filter.json')
          stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
            status: 200, body: json_response
          )

          expect(WeatherService.escambia_county_alerts).to be_a Hash
          expect(WeatherService.escambia_county_alerts).to have_key(:features)
          expect(WeatherService.escambia_county_alerts[:features]).to be_an Array
          expect(WeatherService.escambia_county_alerts[:features].first).to have_key(:properties)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:areaDesc)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:effective)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:ends)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:status)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:severity)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:event)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:description)
          expect(WeatherService.escambia_county_alerts[:features].first[:properties]).to have_key(:instruction)

          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:areaDesc]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:effective]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:ends]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:status]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:severity]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:event]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:description]).to be_a String
          expect(WeatherService.escambia_county_alerts[:features].first[:properties][:instruction]).to be_a String
        end
      end

      describe 'When there are no alert records' do
        it 'returns a hash when an empty features array' do
          json_response = File.read('spec/fixtures/DO_NOT_DELETE/services/no_current_alerts.json')
          stub_request(:get, 'https://api.weather.gov/alerts?zone=FLZ202&status=actual&severity=Severe,Extreme').to_return(
            status: 200, body: json_response
          )

          expect(WeatherService.escambia_county_alerts).to be_a Hash
          expect(WeatherService.escambia_county_alerts).to have_key(:features)
          expect(WeatherService.escambia_county_alerts[:features]).to be_an Array
          expect(WeatherService.escambia_county_alerts[:features]).to eq([])
        end
      end
    end
  end
end
