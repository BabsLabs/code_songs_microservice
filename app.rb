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
