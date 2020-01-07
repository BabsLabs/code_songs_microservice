require 'sinatra'
require './services/git_hub_service.rb'
require './poros/repos_facade.rb'
require './services/musix_match_service.rb'
require './poros/artists_facade.rb'
require './poros/song.rb'

require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/' do
  "Hello World!"
end

get '/tracks' do
  @tracks = Track.all
end