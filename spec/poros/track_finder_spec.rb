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

  it "can find youtube_link", :vcr do

    info = { "track": { "track_id": 30212784,
                         "track_name": "Rocket Man",
                         "artist_name": "Elton John" }}

    song = Song.new(info)

    expect(song.youtube_link).to eq("https://www.youtube.com/watch?v=DtVBCG6ThDk")
  end
end
