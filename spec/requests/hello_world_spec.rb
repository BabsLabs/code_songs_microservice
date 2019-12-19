require "spec_helper"

describe "when something something" do
  it "can do something" do
    get '/'

  binding.pry
    expect(last_response).to be_ok
  end
end