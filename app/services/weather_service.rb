# frozen_string_literal: true

class WeatherService
  def self.escambia_county_alerts
    get_url('alerts?zone=FLZ202&status=actual&severity=Severe,Extreme')
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.weather.gov/')
  end
end
