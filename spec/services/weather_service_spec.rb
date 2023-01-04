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
      it 'displays weather alerts for escambia county', :vcr do
        expect(WeatherService.escambia_county_alerts).to be_a Hash
        expect(WeatherService.escambia_county_alerts).to have_key(:features)
        expect(WeatherService.escambia_county_alerts[:features]).to be_a Array
      end
    end
  end
end
