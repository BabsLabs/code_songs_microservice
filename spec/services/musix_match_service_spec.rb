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
end
