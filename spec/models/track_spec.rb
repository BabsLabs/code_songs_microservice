require 'spec_helper'

describe Track, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :mm_track_id }
    it { should validate_presence_of :mm_artist_id }
    it { should validate_presence_of :artist_name }
  end

  # describe "relationships" do
  #   it { should have_many :sentiments }
  # end
end
