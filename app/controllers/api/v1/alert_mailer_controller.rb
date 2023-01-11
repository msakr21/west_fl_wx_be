class Api::V1::AlertMailerController < ApplicationController
  def create
    @alerts = NwsFacade.escambia_alerts
    CheckNwsJob.
    if @alerts.blank?
      render json: { data: 'No Current Alerts' }
    else
      @user = User.find_or_create_by(user_params)

      alerts = NwsFacade.escambia_alerts
      tweets = [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts]
      UserNotifierMailer.send_alerts(@user, alerts, tweets).deliver_now
      render json: { data: 'Current Alerts in Your Area' }
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
