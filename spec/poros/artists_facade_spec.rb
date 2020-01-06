require 'spec_helper'

describe ArtistsFacade do
  it "finds the top tracks", :vcr do
    artist_id = 38620990

    artists_facade = ArtistsFacade.new(artist_id)

    expect(artists_facade.top_five).to be_an Array
  end
end