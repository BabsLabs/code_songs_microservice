require 'faraday'
require 'figaro/sinatra'

class WatsonService

  def initialize(text)
    @text = text
  end

  def sentiment
    response = conn.post('tone') do |req|
      req.headers['Content-Type'] = 'text/plain'
      req.params['version'] = '2017-09-21'
      req.body = @text
    end
    raise "watson error" if response.body.to_s == "{:code=>403, :error=>\"Forbidden\"}"
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end


  def conn
    Faraday.new(url: "https://api.us-east.tone-analyzer.watson.cloud.ibm.com/instances/#{ENV['WATSON_INSTANCE']}/v3/") do |f|
      f.basic_auth('apikey', ENV['WATSON_TOKEN'])
      f.adapter Faraday.default_adapter
    end
  end
end
