require 'spec_helper'

describe TrackSentiment, type: :model do
  describe "validations" do
    it { should validate_presence_of :track_id }
    it { should validate_presence_of :sentiment_id }
  end

  describe "relationships" do
    it { should belong_to :track }
    it { should belong_to :sentiment }
  end
end
