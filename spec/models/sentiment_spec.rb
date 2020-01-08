require 'spec_helper'

describe Sentiment, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :track_sentiments }
    it { should have_many :tracks }
  end
end
