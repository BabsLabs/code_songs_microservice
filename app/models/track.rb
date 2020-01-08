class Track < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :mm_track_id
  validates_presence_of :mm_artist_id
  validates_presence_of :artist_name

  has_many :sentiments

end
