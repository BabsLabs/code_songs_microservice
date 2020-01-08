class CreateTrackSentiments < ActiveRecord::Migration[5.2]
  def change
    create_table :track_sentiments do |t|
     t.integer :track_id
     t.integer :sentiment_id

     t.timestamps null: false
    end
  end
end
