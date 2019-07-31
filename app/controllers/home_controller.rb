class HomeController < ApplicationController
  before_action :set_twitter_client, only: [:timeline, :tweet]
  
  def index
  end
  
  def timeline
    @friends = @client.friends(current_user).take(20)
    @timeline = @client.home_timeline(include_entities: true)
  end
  
  def tweet
    @client.update(params[:text])
    redirect_to home_path
  end
  
  private
  
  def set_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = current_user.access_token
      config.access_token_secret = current_user.access_secret
    end
  end

end
