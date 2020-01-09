class TracksBuilder

  def self.build_collection(tracks)
    as_array = tracks.map do |track|
      {title: track.title, link: track.youtube_link}
    end
    as_array.to_json
  end
end
