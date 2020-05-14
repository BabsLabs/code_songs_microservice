require 'spec_helper'

describe 'When a post request is triggered to /seed_database' do
  xit 'should add tracks to the database', :vcr do
    expect{post '/seed_database'}.to change{Track.count}.by(95)
  end
end