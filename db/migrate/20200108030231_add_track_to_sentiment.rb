class AddTrackToSentiment < ActiveRecord::Migration[5.2]
  def change
    add_reference :sentiments, :track, foreign_key: true
  end
end
