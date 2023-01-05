class Api::V1::NwsAlertsController < ApplicationController
  def index
    @alerts = NwsFacade.escambia_alerts
    if @alerts.blank?
      render json: { data: 'No Current Alerts' }
    else
      render json: { data: 'Current Alerts in Your Area' }
    end
  end
end
