require 'spec_helper'

describe "when the endpoint '/codesongs_matcher' is hit" do
  it 'returns a JSON object formated as an ordered array of hashes with track name and link', :vcr do
    params = nil
    headers = { 'HTTP_LOGIN' => 'ap2322', 'HTTP_TOKEN'=> ENV['GITHUB_TEST_TOKEN'], 'HTTP_REPO' => 'battleship', 'HTTP_ARTIST_ID'=> '38620990'}
    get '/codesongs_matcher', params, headers

    expect(last_response).to be_ok
    # expect(last_response.body).to be_a JSON

    expected_output = "[{\"title\":\"Shape of You\",\"link\":\"https://www.youtube.com/watch?v=JGwWNGJdvx8\"},{\"title\":\"Thinking Out Loud\",\"link\":\"https://www.youtube.com/watch?v=lp-EO5I60KA\"},{\"title\":\"Photograph\",\"link\":\"https://www.youtube.com/watch?v=qgmXPCX4VzU\"},{\"title\":\"Perfect\",\"link\":\"https://www.youtube.com/watch?v=UDDMYw_IZnE\"},{\"title\":\"South of the Border\",\"link\":\"https://www.youtube.com/watch?v=UPOT2tgY9QQ\"}]"
    expect(last_response.body).to eq expected_output
  end
end
