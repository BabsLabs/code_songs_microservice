require 'spec_helper'

describe YouTubeService do
  it 'fetches a video link', :vcr do
    song_title = 'Who Will Save Your Soul'
    artist_name = 'Jewel'
    youtube_service = YouTubeService.new(song_title, artist_name)

    expect(youtube_service).to be_a YouTubeService

    expect(youtube_service.get_youtube_link).to be_a String
    expect(youtube_service.get_youtube_link).to eq("https://www.youtube.com/embed/0wBDDAZkNtk")
  end

  it 'sanitizes the name of an artist that uses non ASCII characters', :vcr do

    song_title = 'White Christmas'
    artist_name = 'Michael Bublé'
    youtube_service = YouTubeService.new(song_title, artist_name)
    response = youtube_service.get_youtube_link
    expect(response).to eq("https://www.youtube.com/embed/30TkClWvT5k")
  end
end
