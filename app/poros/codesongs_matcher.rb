class CodesongsMatcher

  def self.collection_as_json(login, token, repo, artist_id)
    repo = ReposFacade.new(login, token, repo)
    repo_sentiments = repo.sentiments

    tracks = TrackFinder.new(artist_id).top_tracks
    sorted_tracks = tracks.match_sentiments(repo_sentiments)

    tracks_json_builder = TracksBuilder.build_collection(sorted_tracks)
  end

end
