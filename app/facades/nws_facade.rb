
class NwsFacade

  def self.escandia_alerts
    WeatherService.escambia_county_alerts[:features].map do |alert|
      NwsAlert.new(alert[:properties])
    end
  end
end
