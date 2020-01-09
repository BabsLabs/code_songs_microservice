require 'spec_helper'

describe ReposFacade do
  it "concatenates commit messages", :vcr do
    login = 'ap2322'
    token = ENV['GITHUB_TEST_TOKEN']
    repo = 'battleship'

    repos_facade= ReposFacade.new(login, token, repo)

    expect(repos_facade.message).to be_a String
    expect(repos_facade.message.include?("Fix player input bug and break computer smart shot")).to be_truthy
  end



  it 'retrieves sentiments for a repo', :vcr do
    login = 'ap2322'
    token = ENV['GITHUB_TEST_TOKEN']
    repo = 'battleship'

    repos_facade= ReposFacade.new(login, token, repo)

    repo_sentiments = repos_facade.sentiments

    expect(repo_sentiments).to be_a Array
    expect(repo_sentiments[0]).to be_a Hash
    expect(repo_sentiments).to eq [ {:tone=>"tentative", :value=>3.7023770000000003},
                                    {:tone=>"analytical", :value=>2.923112},
                                    {:tone=>"sadness", :value=>1.136886},
                                    {:tone=>"confident", :value=>0.825035}]
  end
end
