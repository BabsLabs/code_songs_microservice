class Sentiment < ActiveRecord::Base

  validates_presence_of :name

  has_many :track_sentiments
  has_many :tracks, through: :track_sentiments

end
