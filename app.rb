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
