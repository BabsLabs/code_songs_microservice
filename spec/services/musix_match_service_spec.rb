require 'spec_helper'

describe MusixMatchService do
  it 'fetches the top five song_facades for an artist', :vcr do
    artist_id = '38620990'
    musix_match_service = MusixMatchService.new(artist_id)

    expect(musix_match_service).to be_a MusixMatchService

    expect(musix_match_service.top_songs).to be_an Array
    expect(musix_match_service.top_songs[0]).to be_a Hash
    expect(musix_match_service.top_songs[0][:track]).to have_key :track_id
  end

  it 'can fetch the lyrics of a song', :vcr do
    info = { "track": { "track_id": 124985077,
      "track_name": "Shape of You",
      "artist_name": "Ed Sheeran" }}

    musix_match_service = MusixMatchService.new(nil, info[:track][:track_id])

    lyrics = musix_match_service.get_lyrics

    expect(lyrics).to be_a Hash
    expect(lyrics[:message][:body][:lyrics]).to have_key :lyrics_body
    expect(lyrics[:message][:body][:lyrics][:lyrics_body].include?("The club isn't the best place to find a lover\nSo the bar is where I go")).to be_truthy

  end
end
