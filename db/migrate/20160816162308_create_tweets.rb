class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.references :user, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end