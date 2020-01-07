class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
     t.string :title
     t.string :mm_track_id
     t.string :mm_artist_id
     t.string :artist_name
   end
  end
end
