require 'spec_helper'

describe TrackFinder do
  it "finds the top tracks", :vcr do
    artist_id = 38620990

    tracks = TrackFinder.new(artist_id).top_tracks

    tracks.each do |track|
      expect(track.mm_artist_id).to eq artist_id
      expect(track.sentiments.count).to_not eq 0
    end

    ar_relation = Track.const_get(:ActiveRecord_Relation)
    expect(tracks).to be_a(ar_relation)
  end
end
