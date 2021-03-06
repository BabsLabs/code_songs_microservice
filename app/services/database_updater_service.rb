class DatabaseUpdaterService
  @@page_num = 2

  def self.update_database(page_size = 100, page_num = 1)
    tracks_data = get_track_data(page_size, page_num)
    
    tracks_data.each do |track_data|
      track_data = track_data[:track]
      create_track(track_data) unless track_exists?(track_data[:track_id])
    end
  end

  def self.seed_database(page_size = 100)
    update_database(page_size, current_page)
    @@page_num += 1
  end

  def self.current_page
    @@page_num
  end

  private_class_method

  def self.get_track_data(page_size, page_num)
    tracks_data = MusixMatchService.get_top_songs(page_size, page_num)
    tracks_data[:message][:body][:track_list]
  end

  def self.track_exists?(track_id)
    Track.find_by(mm_track_id: track_id) != nil
  end

  def self.create_track(track_data)
    new_track = Track.create(track_params(track_data))
    new_track.make_sentiments(new_track.lyrics)
  end

  def self.track_params(track_data)
    {
      title: track_data[:track_name],
      mm_track_id: track_data[:track_id],
      mm_artist_id: track_data[:artist_id],
      artist_name: track_data[:artist_name]
    }
  end
end