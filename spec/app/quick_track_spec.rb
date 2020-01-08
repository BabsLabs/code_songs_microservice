require 'spec_helper'

describe 'quick track' do
  it 'shows track' do
    get '/tracks'

    expect(last_response).to be_ok
    expect(last_response.body).to eq("Rocket Man (I Think It's Going to Be a Long, Long Time)")
  end
end
