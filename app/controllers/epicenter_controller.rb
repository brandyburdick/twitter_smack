class EpicenterController < ApplicationController
  def feed
  	# Instantiate empty array for holding all the tweets
  	@following_tweets = []
  	# Loop through all the tweets and find the relevant ones
  	# TODO: Very inefficient query, look at better alternatives
  	if user_signed_in?
      Tweet.all.each do |tweet|
    		if current_user.following.include?(tweet.user_id)
    			@following_tweets.push(tweet)                 
    		end
    	end
    end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
    @user = User.find(params[:id])

    current_user.following.push(params[:id].to_i)
    current_user.save
  end

  def unfollow
    @user = User.find(params[:unfollow_id])
    current_user.following.delete(params[:unfollow_id].to_i)
    current_user.save
  end
end
