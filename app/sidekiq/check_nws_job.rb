class CheckNwsJob
  include Sidekiq::Job

  def perform(*args)
    require'pry';binding.pry
    alerts = NwsFacade.escambia_alerts
    user_params = { name: name, email: email }
    if !alerts.blank?
      user = User.find_or_create_by(user_params)
      tweets = [TwitterFacade.fl511_alerts, TwitterFacade.bereadyescambia_alerts]
      UserNotifierMailer.send_alerts(user, alerts, tweets).deliver_now
    end
  end
end

Sidekiq::Cron::Job.create(name: 'CheckNwsJob - every 5min', cron: '*/5 * * * *', class: 'CheckNwsJob', args: { email: params[:email], name: params[:name] })