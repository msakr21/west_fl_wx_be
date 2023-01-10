class UserNotifierMailer < ApplicationMailer
  default from: ENV['west_fl_wx_email']

  # send an alert email to the user, pass in the user object that contains the user's email address, NWS alerts, and tweets
  def send_alerts(user, alerts, tweets)
    @user = user
    @alerts = alerts
    @tweets = tweets
    mail(to: @user.email,
         subject: "#{@user.name}, here are your emergency alerts")
  end
end
