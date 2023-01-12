class Api::V1::AlertMailerController < ApplicationController
  def create
    @user = User.find_or_create_by(user_params)
    @alerts = NwsFacade.escambia_alerts
    CheckNwsJob.perform_async(params[:email], params[:name])
    if @alerts.blank?
      alert = [NwsAlert.new({
        event: 'None',
        effective: DateTime.now.to_s,
        ends_at: DateTime.now.to_s,
        description: 'N/A',
        instructions: 'N/A'
        })]
      tweets = [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts]
      UserNotifierMailer.send_alerts(@user, alert, tweets).deliver_now
      render json: { data: 'No Current Alerts' }
    else
      render json: { data: 'Current Alerts in Your Area' }
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
