class ArtistsFacade
  attr_reader :top_five

  def initialize(artist_id)
    @artist_id = artist_id
    @top_five ||= top_tracks
  end

  def top_tracks
    service = MusixMatchService.new(@artist_id, nil)
    top_five_songs = service.top_songs

    top_five_songs.map do |track_info|
      Song.new(track_info)
    end
  end

end