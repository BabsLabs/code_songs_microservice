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
  Track.create(
    title: "Hello from rails!",
    mm_track_id: '10',
    mm_artist_id: '5',
    artist_name: 'Michael Cooper'
  )
end

get '/codesongs_matcher' do
  repo = ReposFacade.new(request.env['login'], request.env['token'], request.env['repo'])

  repo_sentiments = repo.sentiments

  # Get tracks_data from artist_id
  tracks = TrackFinder.new(request.env['artist_id']).top_tracks

  binding.pry
  # Do math with repo sentiments and all artist track sentiments?
  # expected_output [ {title: 'title', link: 'link' } ]
end
