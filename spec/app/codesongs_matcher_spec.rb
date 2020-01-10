require 'spec_helper'

describe "when the endpoint '/codesongs_matcher' is hit" do
  it 'returns a JSON object formated as an ordered array of hashes with track name and link', :vcr do
    params = nil
    headers = { 'HTTP_LOGIN' => 'ap2322', 'HTTP_TOKEN'=> ENV['GITHUB_TEST_TOKEN'], 'HTTP_REPO' => 'battleship', 'HTTP_ARTIST_ID'=> '38620990'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok
    # expect(last_response.body).to be_a JSON
    expected_output = "{\"songs\":[{\"title\":\"Shape of You\",\"link\":\"https://www.youtube.com/embed/JGwWNGJdvx8\"},{\"title\":\"Thinking Out Loud\",\"link\":\"https://www.youtube.com/embed/JGwWNGJdvx8\"},{\"title\":\"Photograph\",\"link\":\"https://www.youtube.com/embed/JGwWNGJdvx8\"},{\"title\":\"Perfect\",\"link\":\"https://www.youtube.com/embed/JGwWNGJdvx8\"},{\"title\":\"South of the Border\",\"link\":\"https://www.youtube.com/embed/JGwWNGJdvx8\"}]}"
    expect(last_response.body).to eq expected_output
  end

  it 'returns an error when the artist has no tracks', :vcr do
    params = nil
    headers = { 'HTTP_LOGIN' => 'ap2322', 'HTTP_TOKEN'=> ENV['GITHUB_TEST_TOKEN'], 'HTTP_REPO' => 'battleship', 'HTTP_ARTIST_ID'=> '38020124'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok

    expected_output = "[{\"error\":\"Artist has no tracks.\"}]"
    expect(last_response.body).to eq expected_output
  end
end
