class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :image, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end