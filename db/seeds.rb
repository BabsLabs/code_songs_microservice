require './app/models/track.rb'

t1 = Track.create(title: "Rocket Man!", mm_track_id: '10', mm_artist_id: '5', artist_name: 'Elton John')

t2 = Track.create(title: 'Umbrella', mm_track_id: '32130011', mm_artist_id: '33491890', artist_name: 'Rhianna')
