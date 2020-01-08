class Sentiment < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :track

end
