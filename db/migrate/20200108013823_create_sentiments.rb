class CreateSentiments < ActiveRecord::Migration[5.2]
  def change
    create_table :sentiments do |t|
     t.string :name, null: false
     t.float :value, null: false
     t.integer :track_id, null: false

     t.timestamps null: false
    end
  end
end
