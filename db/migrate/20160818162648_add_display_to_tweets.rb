class AddDisplayToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :display, :text
  end
end
