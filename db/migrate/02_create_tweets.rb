class CreateTweets < ActiveRecord::Migration

  def change
    create_table :tweets do |tweet|
      tweet.text :content
    end
  end
end
