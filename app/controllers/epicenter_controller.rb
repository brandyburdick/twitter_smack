class EpicenterController < ApplicationController
  def feed
  	# Instantiate empty array for holding all the tweets
  	@following_tweets = []
  	# Loop through all the tweets and find the relevant ones
  	# TODO: Very inefficient query, look at better alternatives
  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user_id)
  			@following_tweets.push(tweet)                 
  		end
  	end
  end

  def show_user
  end

  def now_following
  end

  def unfollow
  end
end
