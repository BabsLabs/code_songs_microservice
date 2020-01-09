require 'spec_helper'

describe CompareSentiments do
  it 'inializes with repo_sentiments and collection of tracks' do
    tracks = TrackFinder.new(38620990).top_tracks
    repo = ReposFacade.new('ap2322', ENV['GITHUB_TEST_TOKEN'], 'battleship')

    repo_sentiments = repo.sentiments
  end
end
