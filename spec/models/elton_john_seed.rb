require 'spec_helper'

class EltonJohnSeed
  def self.make
    make_tracks
  end

  def self.make_tracks
    ej_1 = Track.create(title: "Tiny Dancer - Remastered",
      mm_track_id: 139906958,
      mm_artist_id: 136,
      artist_name: "Elton John",
      youtube_link: "https://www.youtube.com/watch?v=65CNtap6bow")

    ej_1.sentiments.create(name: 'tentative', value: 3)

    ej_2 = Track.create(title: "I'm Still Standing - Remastered",
      mm_track_id: 139906976,
      mm_artist_id: 136,
      artist_name: "Elton John",
      youtube_link: "https://www.youtube.com/watch?v=swuzkq0Q8nw")

    ej_2.sentiments.create(name: 'tentative', value: 4)

    ej_3 = Track.create(  title: "Candle In The Wind - Remastered",
      mm_track_id: 139906965,
      mm_artist_id: 136,
      artist_name: "Elton John",
      youtube_link: "https://www.youtube.com/watch?v=MYU3F8uUGiw")

    ej_3.sentiments.create(name: 'tentative', value: 5)

    ej_4 = Track.create(title: "Rocket Man (I Think It's Going to Be a Long, Long Time)",
      mm_track_id: 30212784,
      mm_artist_id: 136,
      artist_name: "Elton John",
      youtube_link: "https://www.youtube.com/watch?v=nA7ZyJqq5WI")
    ej_4.sentiments.create(name: 'tentative', value: 1)

    ej_5 = Track.create( title: "Daniel - Remastered",
      mm_track_id: 139906962,
      mm_artist_id: 136,
      artist_name: "Elton John",
      youtube_link: "https://www.youtube.com/watch?v=IBibyilzUK4")

    ej_5.sentiments.create(name: 'tentative', value: 2)

    Track.where(mm_artist_id: 136)
  end
end
