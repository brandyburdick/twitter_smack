module TweetsHelper
	def create_tags(tweet)
		message_arr = tweet.message.split
    message_arr.each_with_index do |word, index|
      if word[0] == "#" 
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create(phrase: word)
        end
        tt = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      else
        message_arr[index] = word
      end
    end
    tweet.update(message: message_arr.join(" "))
    tweet
  end

  def edit_tags(tweet)
    message_arr = tweet.message.split
    message_arr.each_with_index do |word, index|
      if word[0] == "#" 
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create(phrase: word)
        end
        if TweetTag.find_by(tweet_id: tweet.id, tag_id: tag.id) == nil
          TweetTag.creat(tweet_id: tweet.id, tag_id: tag.id)
        end
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      else
        message_arr[index] = word
      end
    end
    tweet.update(message: message_arr.join(" "))
    tweet
  end
end
