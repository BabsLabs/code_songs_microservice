require 'spec_helper'

describe 'hello world' do
  it 'shows hello world' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello World!")
  end
end
