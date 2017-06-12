class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_tweets

  def index
    @profile = if current_user
                 Profile.find_by(user_id: current_user.id)
               else
                 Profile.new(user_name: 'Zemoga', description: @tweets[0].text)
               end
  end

  private

  def load_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = Rails.application.secrets.consumer_key
      config.consumer_secret    = Rails.application.secrets.consumer_secret
      config.oauth_token        = Rails.application.secrets.oauth_token
      config.oauth_token_secret = Rails.application.secrets.oauth_token_secret
    end
    @tweets =
      if current_user
        begin
          client.user_timeline(current_user.profile.twitter_account.gsub(/\s+/,''))[0..4]
        rescue StandardError => e
          flash[:alert] = e.message + ' edit a valid twitter_account on your profile to fix it.'
          []
        end
      else
        client.user_timeline('zemoga')[0..4]
      end
  end
end
