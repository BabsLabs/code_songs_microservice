ENV['SINATRA_ENV'] ||= "production"
ENV['RACK_ENV'] ||= "production"
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require_all 'app'