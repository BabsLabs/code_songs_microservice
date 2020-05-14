require 'faraday'

class GitHubService

  def initialize(login, token, repo)
    @token = token
    @login = login
    @repo = repo
  end

  def commit_messages
    response = conn.get("/repos/#{@login}/#{@repo}/commits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.github.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
