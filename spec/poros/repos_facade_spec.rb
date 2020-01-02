require 'spec_helper'

describe ReposFacade do
  it "concatenates commit messages", :vcr do
    login = 'babslabs'
    token = ENV['GITHUB_TEST_TOKEN']
    repo = 'battleship'

    repos_facade= ReposFacade.new(login, token, repo)

    expect(repos_facade.message).to be_a String
    expect(repos_facade.message.include?("Merge pull request #17 from BabsLabs/bb_iteration3_refactorRemove commented out code")).to be_truthy
  end
end