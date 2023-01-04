class WeatherService

  def self.conn
    Faraday.new('https://api.weather.gov/')
  end

  def self.escambia_county_alerts
    response = conn.get("alerts?zone=FLZ202")
    JSON.parse(response.body, symbolize_names: true)
  end

end
