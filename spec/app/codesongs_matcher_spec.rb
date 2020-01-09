require 'spec_helper'

describe "when the endpoint '/codesongs_matcher' is hit" do
  it 'returns a JSON object formated as an ordered array of hashes with track name and link', :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)
    params = {'holder'=> 'holder'}
    headers = { 'login' => 'ap2322', 'token'=> ENV['GITHUB_TEST_TOKEN'], 'repo' => 'battleship', 'artist_id'=> '38620990'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok
    expect(last_response.body).to be_a JSON
  end
end
