require 'spec_helper'

describe 'When a post request is triggered to /update_database' do
  it 'should add a track to the database' do
    expect{post '/update_database'}.to change{Track.count}.by(1)
  end
end