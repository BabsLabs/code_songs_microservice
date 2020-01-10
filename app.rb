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

post '/update_top_one_hundred' do
  DatabaseUpdaterService.update_database
  return 0
end

post '/seed_database' do
  DatabaseUpdaterService.seed_database
  return 0
end

get '/codesongs_matcher' do
  # In Postman, to replicate this endpoint, use 'login', 'token', 'repo', and 'artist_id' in headers without 'HTTP_'
  CodesongsMatcher.collection_as_json(
    request.env['HTTP_LOGIN'],
    request.env['HTTP_TOKEN'],
    request.env['HTTP_REPO'],
    request.env['HTTP_ARTIST_ID']
  )
end
