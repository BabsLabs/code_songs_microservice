require 'faraday'
require 'figaro/sinatra'

class YouTubeService

  def initialize(song_title, artist_name)
    @song_title = song_title
    @artist_name = artist_name
  end

  def get_youtube_link
    require "uri"
    require "net/http"

    url = URI("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&order=relevance&q=#{song_title} #{artist_name}&type=video&key=#{ENV['YOUTUBE_API_TOKEN']}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"

    response = https.request(request)
    # puts response.read_body

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    video_id = parsed_response[:items][0][:id][:videoId]

    youtube_link = "https://www.youtube.com/watch?v=#{video_id}"
  end

  private
  attr_reader :song_title, :artist_name

end
