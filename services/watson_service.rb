require 'faraday'
require 'pry'

class WatsonService
  def initialize(text)
    @text = text
  end

  def sentiments
    response = conn.post('/tone') do |req|
      req.params['version'] = '2017-09-21'
      req.body = @text
    end
    binding.pry
  end

  def conn
    Faraday.new(url: "https://api.us-east.tone-analyzer.watson.cloud.ibm.com/instances/#{ENV['WATSON_INSTANCE']}/v3") do |f|
      f.basic_auth('apikey', ENV['WATSON_TOKEN'])
      f.headers['Content-Type'] = 'text/plain'
      f.adapter Faraday.default_adapter
    end
  end
end
