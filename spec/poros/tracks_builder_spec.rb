require 'spec_helper'

describe TracksBuilder do
  it 'takes in a collection of tracks and spits out a json array of hashes' do
    t1 = Track.create(title: "Rocket Man (I Think It's Going to Be a Long, Long Time)", mm_track_id: 30212784, mm_artist_id: 136, artist_name: 'Elton John', youtube_link: 'rocket_man_link')

    t2 = Track.create(title: 'Umbrella', mm_track_id: 32130011, mm_artist_id: 33491890, artist_name: 'Rhianna', youtube_link: 'umbrella_link')

    expected_output = [
      {title: "Rocket Man (I Think It's Going to Be a Long, Long Time)", link: 'rocket_man_link' },
      {title: "Umbrella", link: 'umbrella_link' },
    ].to_json
    expect(TracksBuilder.build_collection([t1, t2])).to eq expected_output
  end
end
