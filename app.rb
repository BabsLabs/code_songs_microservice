require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| load(f) }

get '/' do
  "Hello World!"
end

get '/tracks' do
  @tracks = Track.all
  @tracks.first.title
end

post '/update_database' do
  tracks_data = MusixMatchService.get_top_songs[:message][:body][:track_list]

  tracks_data.each do |track_data|
    track = track_data[:track]
    if Track.find_by(mm_track_id: track[:track_id]).nil?
      Track.create(
        title: track[:track_name],
        mm_track_id: track[:track_id],
        mm_artist_id: track[:artist_id],
        artist_name: track[:artist_name]
      )
    end
  end

  # Error without this
  # Will look into a proper response
  return 0
end

get '/codesongs_matcher' do
  # In Postman, to replicate this endpoint, use 'login', 'token', 'repo', and 'artist_id' in headers without 'HTTP_'
  repo = ReposFacade.new(request.env['HTTP_LOGIN'], request.env['HTTP_TOKEN'], request.env['HTTP_REPO'])
  repo_sentiments = repo.sentiments
  # Get tracks_data from artist_id
  tracks = TrackFinder.new(request.env['HTTP_ARTIST_ID']).top_tracks
  sorted_tracks = tracks.match_sentiments(repo_sentiments)
  
  tracks_json_builder = TracksBuilder.new(sorted_tracks)
  tracks_json_builder.build_collection
  # expected_output [ {title: 'title', link: 'link' } ]
end
