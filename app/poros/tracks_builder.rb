class TracksBuilder
  def initialize(tracks)
    @tracks = tracks
  end

  def build_collection
    as_array = tracks.map do |track|
      {title: track.title, link: track.youtube_link}
    end
    as_array.to_json
  end

  private
  attr_reader :tracks
end
