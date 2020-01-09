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

  it "can update or find youtube_link", :vcr do

    existing_track = Track.new(title: 'Umbrella', mm_track_id: 32130011, mm_artist_id: 33491890, artist_name: 'Rhianna')
    expect(existing_track.youtube_link).to be_nil

    found_tracks = TrackFinder.new(33491890)

    found_tracks.top_tracks.each do |track|
      expect(track.reload.youtube_link).to be_truthy
    end
  end
end
