class CreateTableTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet,                null: false
      t.string :image,

      t.timestamps
    end
  end
end
