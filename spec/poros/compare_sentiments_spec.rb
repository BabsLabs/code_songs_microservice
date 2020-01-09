require 'spec_helper'

describe CompareSentiments do

  it 'initializes with repo_sentiments and collection of tracks', :vcr do
    tracks = TrackFinder.new(38620990).top_tracks
    
    repo_sentiments = [ {:tone=>"tentative", :value=>3.7023770000000003},
                                    {:tone=>"analytical", :value=>2.923112},
                                    {:tone=>"sadness", :value=>1.136886},
                                    {:tone=>"confident", :value=>0.825035}]

    comparison = CompareSentiments.new(repo_sentiments, tracks)

    expect(comparison).to be_a CompareSentiments

  end

  it 'compares the repo to tracks and returns a sorted array of track info', :vcr do
    tracks = TrackFinder.new(38620990).top_tracks
    repo = ReposFacade.new('ap2322', ENV['GITHUB_TEST_TOKEN'], 'battleship')
    comparison = CompareSentiments.new(repo.sentiments, tracks)

    expected_output = [{title: 'song_title_1', link: 'youtubelink'}]
    expect(comparison.sorted_tracks).to eq expected_output
  end
end
