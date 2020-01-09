require_relative '../modules/aggregation_module'

class ReposFacade
  include AggregationModule
  attr_reader :message, :sentiments

  def initialize(login, token, repo)
    @login = login
    @token = token
    @repo = repo
    @message ||= full_messages
    @sentiments ||= aggregate_sentiments
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

  def aggregate_sentiments
    service = WatsonService.new(@message)
    raw_feelings = service.sentiment[:sentences_tone]
    tones_hash = tones_hash(raw_feelings)
    make_sorted_tones_array(tones_hash)
  end

  private

  def make_sorted_tones_array(tones_hash)
    tones_array = []
    tones_hash.each do |k, v|
      tones_array.push({tone: k.to_s, value: v})
    end
    tones_array.sort_by { |hash| hash[:value] }.reverse
  end

end
