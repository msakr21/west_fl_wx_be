class TwitterService
  def self.fl511_tweets
    get_url('tweets/search/recent?query=from:fl511_panhandl%20Escambia&max_results=20&tweet.fields=created_at')
  end

  def self.bereadyescambia_tweets
    get_url('tweets/search/recent?query=from:bereadyescambia&tweet.fields=created_at')
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.twitter.com/2/') do |f|
      f.headers['Authorization'] = ENV['twitter_bearer_token']
    end
  end
end
