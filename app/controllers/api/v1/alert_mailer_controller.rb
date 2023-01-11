class Api::V1::AlertMailerController < ApplicationController
  def create
    @alerts = NwsFacade.escambia_alerts
    if @alerts.blank?
      render json: { data: 'No Current Alerts' }
    else
      # Create the user from params
      @user = User.find_or_create_by(user_params)

      # Deliver the alerts email
      alerts = NwsFacade.escambia_alerts
      tweets = [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts]
      UserNotifierMailer.send_alerts(@user, alerts, tweets).deliver_now
      render json: { data: 'Current Alerts in Your Area' }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:name, :email)
  end
end
