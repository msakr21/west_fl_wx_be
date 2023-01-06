class TwitterFacade
  def self.fl511_alerts
    TwitterService.fl511_tweets[:data].map do |tweet|
      TwitterAlert.new(tweet)
    end
  end

  def self.bereadyescambia_alerts
    TwitterService.bereadyescambia_tweets[:data].map do |tweet|
      TwitterAlert.new(tweet)
    end
  end
end
