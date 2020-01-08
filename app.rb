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
  # Get the info from the headers (login, artist_id, repo, token)
  login = request.env['login']
  artist_id = request.env['artist_id']
  repo = request.env['repo']
  token = request.env['token']

  # repo = RepoFacade gets the commit messages
  repo = ReposFacade.new(login, token, repo)
  binding.pry

  # repo_sentiments = repo.get_sentiments
  # Send combined string to Watson for sentiments
  # Get the info from the headers (login, artist_id, repo, token)
  # Get repo commit messages
  # get sentiments from the repo messages
  # Get tracks_data from artist_id
  # tracks_data.each |track_data|
  #   if track not in db
  #     new_track = Track.create(track_data)
  #     new_track.get_youtube_link
  #     sentiments_data = WatsonService.get_sentiments(track.lyrics)
  #     sentiments_data.each |sentiment_data|
  #       new_track.sentiments.create(sentiment_data)
  #   end
  # Do math with repo sentiments and all artist track sentiments?
  # expected_output [ {title: 'title', link: 'link' } ]
end
