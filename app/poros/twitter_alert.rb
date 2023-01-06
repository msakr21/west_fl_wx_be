class TwitterAlert
  attr_reader :id,
              :text,
              :created_at

  def initialize(tweet)
    @id = tweet[:id]
    @text = tweet[:text]
    @created_at = Time.parse(tweet[:created_at]).strftime('%A at%l:%M%P, %B%e, %Y')
  end
end
