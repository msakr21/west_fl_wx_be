class Api::V1::AlertsController < ApplicationController

  def index
    @alerts = WeatherService.escambia_county_alerts
    render json: @alerts
  end

end
