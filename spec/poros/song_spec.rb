require 'spec_helper'

describe Song do
  it "can find lyrics", :vcr do

    info = { "track": { "track_id": 124985077,
                         "track_name": "Shape of You",
                         "artist_name": "Ed Sheeran" }}

    song = Song.new(info)

    expect(song.track_id).to eq(info[:track][:track_id])
    expect(song.track_name).to eq(info[:track][:track_name])
    expect(song.artist).to eq(info[:track][:artist_name])
    expect(song.lyrics).to be_a String
    expect(song.lyrics.include?("The club isn't the best place to find a lover\nSo the bar is where I go")).to be_truthy

  end

  it "can find youtube_link", :vcr do

    info = { "track": { "track_id": 30212784,
                         "track_name": "Rocket Man",
                         "artist_name": "Elton John" }}

    song = Song.new(info)

    expect(song.youtube_link).to eq("https://www.youtube.com/embed/DtVBCG6ThDk")
  end
end