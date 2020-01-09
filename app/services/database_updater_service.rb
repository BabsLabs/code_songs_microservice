class DatabaseUpdaterService

  def self.update_database
    tracks_data = MusixMatchService.get_top_songs[:message][:body][:track_list]

    tracks_data.each do |track_data|
      track = track_data[:track]
      if Track.find_by(mm_track_id: track[:track_id]).nil?
        Track.create(
          title: track[:track_name],
          mm_track_id: track[:track_id],
          mm_artist_id: track[:artist_id],
          artist_name: track[:artist_name]
        )
      end
    end
  end
end