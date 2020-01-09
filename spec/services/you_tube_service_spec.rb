require 'spec_helper'

describe YouTubeService do
  it 'fetches a video link', :vcr do
    song_title = 'Rocket Man'
    artist_name = 'Elton John'
    youtube_service = YouTubeService.new(song_title, artist_name)

    expect(youtube_service).to be_a YouTubeService

    expect(youtube_service.get_youtube_link).to be_a String
    expect(youtube_service.get_youtube_link).to eq("https://www.youtube.com/watch?v=DtVBCG6ThDk")
  end
end
