require 'spec_helper'

describe 'quick track' do
  it 'shows track' do
    t1 = Track.create(title: "Rocket Man (I Think It's Going to Be a Long, Long Time)", mm_track_id: 30212784, mm_artist_id: 136, artist_name: 'Elton John')
    
    get '/tracks'

    expect(last_response).to be_ok
    expect(last_response.body).to eq("Rocket Man (I Think It's Going to Be a Long, Long Time)")
  end
end
