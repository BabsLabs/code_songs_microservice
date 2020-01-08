class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
     t.string :title
     t.integer :mm_track_id
     t.integer :mm_artist_id
     t.string :artist_name

     t.timestamps null: false
   end
  end
end
