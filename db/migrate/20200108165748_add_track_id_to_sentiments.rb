class AddTrackIdToSentiments < ActiveRecord::Migration[5.2]
  def change
    add_reference :sentiments, :track, index: true, foreign_key: true
  end
end
