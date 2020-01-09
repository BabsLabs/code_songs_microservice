require 'faraday'
require 'figaro'

MUSIX_MATCH_API_URL = 'https://api.musixmatch.com/ws/1.1/'.freeze

class MusixMatchService

  def initialize(artist_id = nil, track_id = nil)
    @artist_id = artist_id
    @track_id = track_id
  end

  # an array of hashes of the top five song_facades. The keys are :track and the values are the info
  def top_songs
    response = conn.get('track.search') do |req|
      req.params['f_artist_id'] = @artist_id
      req.params['page_size'] = '5'
      req.params['page'] = '1'
      req.params['s_track_rating'] = 'desc'
      req.params['f_has_lyrics'] = 'true'
    end

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    parsed_response[:message][:body][:track_list]
  end

  def get_lyrics
    response = conn.get('track.lyrics.get') do |req|
      req.params['track_id'] = @track_id
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: MUSIX_MATCH_API_URL,
      params: {apikey: ENV['MUSIX_MATCH_TOKEN']}
    )
  end

  # Get the top songs by with no artist
  def self.get_top_songs(page_size = 100, page_num = 1)
    response = conn.get('chart.tracks.get') do |req|
      req.params['page_size']    = page_size
      req.params['page']         = page_num
      req.params['f_has_lyrics'] = 'true'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method

  def self.conn
    Faraday.new(
      url: MUSIX_MATCH_API_URL,
      params: { apikey: ENV['MUSIX_MATCH_TOKEN'] }
    )
  end
end
