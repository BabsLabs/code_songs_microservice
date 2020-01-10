require 'faraday'
require 'figaro/sinatra'

class YouTubeService

  def initialize(song_title, artist_name)
    @song_title = song_title
    @artist_name = name_sanitizer(artist_name)
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

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    video_id = parsed_response[:items][0][:id][:videoId]

    "https://www.youtube.com/embed/#{video_id}"
  end

  def name_sanitizer(name)
    encoding_options = {
      :invalid           => :replace,  # Replace invalid byte sequences
      :undef             => :replace,  # Replace anything not defined in ASCII
      :replace           => '',        # Use a blank for those replacements
      :universal_newline => true       # Always break lines with \n
    }

    name.encode(Encoding.find('ASCII'), encoding_options)
  end

  private
  attr_reader :song_title, :artist_name


end
