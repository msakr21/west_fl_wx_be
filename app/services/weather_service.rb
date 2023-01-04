# frozen_string_literal: true

class WeatherService
  def self.conn
    Faraday.new('https://api.weather.gov/')
  end

  def self.escambia_county_alerts
    response = conn.get('alerts?zone=FLZ202&status=actual&severity= Moderate,Severe,Extreme')
    JSON.parse(response.body, symbolize_names: true)
  end
end

