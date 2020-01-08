require 'spec_helper'

describe "when the endpoint '/codesongs_matcher' is hit", :vcr do
  it 'returns a JSON object formated as an ordered array of hashes with track name and link' do
    params = {'holder'=> 'holder'}
    headers = { 'login' => 'ap2322', 'token'=> ENV['GITHUB_TEST_TOKEN'], 'repo' => 'battleship', 'artist_id'=> '38620990'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok
    expect(last_response.body).to be_a JSON
  end
end
