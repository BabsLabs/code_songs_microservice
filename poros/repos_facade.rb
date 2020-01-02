require './services/git_hub_service.rb'

class ReposFacade
  attr_reader :message

  def initialize(login, token, repo)
    @login = login
    @token = token
    @repo = repo
    @message ||= full_messages
  end

  def full_messages
    service = GitHubService.new(@login, @token, @repo)
    commit_info = service.commit_messages

    message = ''
    commit_info.each do |info|
      message << info[:commit][:message] << '. '
    end
    message.delete("\n\n")
  end

end
