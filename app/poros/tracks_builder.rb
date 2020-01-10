class TracksBuilder

  def self.build_collection(tracks)
    songs = {songs: []}
    tracks.each do |track|
      songs[:songs].push({title: track.title, link: track.youtube_link})
    end
    songs.to_json
  end
end
