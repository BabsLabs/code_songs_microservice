require 'spec_helper'

describe 'When a post request is triggered to /update_database' do
  it 'should add a track to the database', :vcr do
    expect{post '/update_database'}.to change{Track.count}.by(100)
  end

  it 'should only add tracks if they do not exist already', :vcr do
    Track.create(
      title: 'Dance Monkey',
      mm_track_id: 177501051,
      mm_artist_id: 37843472,
      artist_name: 'Tones and I'
    )
    expect{post '/update_database'}.to change{Track.count}.by(99)
  end
end