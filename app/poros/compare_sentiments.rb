class CompareSentiments
  def initialize(repo_sentiments, track_collection)
    @repo_sentiments = repo_sentiments
    @tracks = track_collection
  end

  def sorted_tracks
    @tracks.match_sentiments(@repo_sentiments)
  end

  
end
