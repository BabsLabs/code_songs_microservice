require 'sinatra'
require './services/git_hub_service.rb'
require './poros/repos_facade.rb'

get '/' do
  "Hello World!"
end
