class CompareSentiments
  def initialize(repo_sentiments, track_collection)
    @repo_sentiments = repo_sentiments
    @tracks = track_collection
  end

  def sorted_tracks
    binding.pry

    # repo_sentiments
    # Use ActiveRecord class method on tracks with matching sentiments compared to repo
    @tracks.match_sentiments(@repo_sentiments)
  end

  # make array of hashes from sorted tracks
end
