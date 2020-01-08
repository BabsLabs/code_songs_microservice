require './app/models/track.rb'

t1 = Track.create(title: "Rocket Man!", mm_track_id: '10', mm_artist_id: '5', artist_name: 'Elton John')

t2 = Track.create(title: 'Umbrella', mm_track_id: '32130011', mm_artist_id: '33491890', artist_name: 'Rhianna')
s2 = t2.sentiments.create(:joy=>2.13323, :tentative=>1.840974, :analytical=>5.124888, :confident=>4.398569, :fear=>0.688855, :sadness=>0.620114)
