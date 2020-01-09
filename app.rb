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
  DatabaseUpdaterService.update_database
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
