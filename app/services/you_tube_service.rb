require 'faraday'
require 'figaro/sinatra'

class YouTubeService

  def initialize(song_title, artist_name)
    @song_title = song_title
    @artist_name = artist_name
  end

  def get_youtube_link
    response = conn.get('search') do |req|
      req.params['part'] = 'snippet'
      req.params['maxResults'] = 1
      req.params['order'] ='relevance'
      req.params['type'] ='video'
      req.params['q'] = "#{song_title} #{artist_name}"
      req.params['key'] = ENV['YOUTUBE_API_TOKEN']
      req.headers['Accept'] = 'application/json'
    end

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    video_id = parsed_response[:items][0][:id][:videoId]

    "https://www.youtube.com/embed/#{video_id}"
  end

  def conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  private
  attr_reader :song_title, :artist_name


end
