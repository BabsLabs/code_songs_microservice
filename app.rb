require 'sinatra'
require './services/git_hub_service.rb'
require './poros/repos_facade.rb'
require './services/musix_match_service.rb'
require './poros/artists_facade.rb'
require './poros/song.rb'

get '/' do
  "Hello World!"
end
