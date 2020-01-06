require 'spec_helper'

describe GitHubService do
  it 'fetches a users commit messages for a repo', :vcr do
    # get '/', nil, { 'login' => 'ap2322',
    #                 'token' => ENV['GITHUB_TEST_TOKEN'],
    #                 'repo' => 'battleship',
    #                 'artist_id' => '38620990'}

    login = 'ap2322'
    token = ENV['GITHUB_TEST_TOKEN']
    repo = 'battleship'
    git_hub_service = GitHubService.new(login, token, repo)

    expect(git_hub_service).to be_a GitHubService

    expect(git_hub_service.commit_messages).to be_a Array
    expect(git_hub_service.commit_messages[0]).to be_a Hash
    expect(git_hub_service.commit_messages[0][:commit]).to have_key :message
  end
end
