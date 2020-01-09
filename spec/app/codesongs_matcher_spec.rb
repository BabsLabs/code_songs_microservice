require 'spec_helper'

describe "when the endpoint '/codesongs_matcher' is hit" do
  it 'returns a JSON object formated as an ordered array of hashes with track name and link', :vcr do
    params = nil
    headers = { 'login' => 'ap2322', 'token'=> ENV['GITHUB_TEST_TOKEN'], 'repo' => 'battleship', 'artist_id'=> '38620990'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok
    # expect(last_response.body).to be_a JSON
    expected_output = "[{\"title\":\"Shape of You\",\"link\":\"https://www.youtube.com/watch?v=kx7P_ENnDPE\"},{\"title\":\"Thinking Out Loud\",\"link\":\"https://www.youtube.com/watch?v=kx7P_ENnDPE\"},{\"title\":\"Photograph\",\"link\":\"https://www.youtube.com/watch?v=kx7P_ENnDPE\"},{\"title\":\"Perfect\",\"link\":\"https://www.youtube.com/watch?v=CrKRDEZExyU\"},{\"title\":\"South of the Border\",\"link\":\"https://www.youtube.com/watch?v=kx7P_ENnDPE\"}]"
    expect(last_response.body).to eq expected_output
  end
end
