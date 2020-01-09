class TrackFinder
  attr_reader :top_tracks

  def initialize(artist_id)
    @artist_id = artist_id
    @top_tracks ||= top_artist_tracks
  end

  def top_artist_tracks
    service = MusixMatchService.new(@artist_id, nil)
    @top_five_songs ||= service.top_songs

    find_or_create_tracks_and_sentiments_with_youtube(@top_five_songs)

    Track.where(mm_artist_id: @artist_id)
  end

  private
  def find_or_create_tracks_and_sentiments_with_youtube(top_five_songs)
    top_five_songs.each do |track_info|
      trimmed_info = {
          title: track_info[:track][:track_name],
          mm_track_id: track_info[:track][:track_id],
          mm_artist_id: track_info[:track][:artist_id],
          artist_name: track_info[:track][:artist_name],
      }
      track = Track.find_or_create_by(trimmed_info)

      if track.youtube_link.nil?
        track.update(youtube_link: found_link(track.title, track.artist_name))
      end

      check_for_sentiment(track)
    end
  end

  def check_for_sentiment(track)
    if track.sentiments.count == 0
      lyrics = track.lyrics
      track.make_sentiments(lyrics)
    end
  end

  def found_link(song_title, artist_name)
    service = YouTubeService.new(@track_name, @artist)
    service.get_youtube_link
  end

end
