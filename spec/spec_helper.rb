require 'rack/test'
require 'rspec'
require 'pry'
require 'vcr'
require 'webmock/rspec'

ENV['RACK_ENV'] = 'test'
require File.expand_path '../../app.rb', __FILE__
module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end
# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { :match_requests_on => [:method,
    VCR.request_matchers.uri_without_param(:access_token, :apikey)] }
  config.filter_sensitive_data("<GITHUB_TEST_TOKEN>") { ENV['GITHUB_TEST_TOKEN'] }
  config.filter_sensitive_data("<MUSIX_MATCH_TOKEN>") { ENV['MUSIX_MATCH_TOKEN'] }
  config.filter_sensitive_data("<WATSON_TOKEN>") { ENV['WATSON_TOKEN'] }
  config.filter_sensitive_data("<WATSON_INSTANCE>") { ENV['WATSON_INSTANCE'] }
end
