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
