class TrackSentiment < ActiveRecord::Base

  validates_presence_of :track_id
  validates_presence_of :sentiment_id

  belongs_to :track
  belongs_to :sentiment
  
end
