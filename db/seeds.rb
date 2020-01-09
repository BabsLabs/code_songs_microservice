require './app/models/track.rb'

t1 = Track.create(title: "Rocket Man (I Think It's Going to Be a Long, Long Time)", mm_track_id: 30212784, mm_artist_id: 136, artist_name: 'Elton John')

t2 = Track.create(title: 'Umbrella', mm_track_id: '32130011', mm_artist_id: '33491890', artist_name: 'Rhianna')

elton_john_top_five_tracks_seed = TrackFinder.new(136)
