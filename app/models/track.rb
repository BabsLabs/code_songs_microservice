require_relative '../modules/aggregation_module'

class Track < ActiveRecord::Base
  include AggregationModule

  validates_presence_of :title
  validates_presence_of :mm_track_id
  validates_presence_of :mm_artist_id
  validates_presence_of :artist_name

  has_many :sentiments

  def lyrics
    service = MusixMatchService.new(nil, mm_track_id)
    response = service.get_lyrics
    lyrics = response[:message][:body][:lyrics][:lyrics_body]
    lyric_sanitizer(lyrics)
  end

  def make_sentiments(lyrics_text)
    service = WatsonService.new(lyrics_text)
    sentiment_response = service.sentiment[:sentences_tone]

    tones_hash(sentiment_response).each do |k,v|
      sentiments.create(name: k.to_s, value: v)
    end

  end

  def self.match_sentiments(repo_sentiments)
    top_feel = repo_sentiments.first[:tone]

    joins(:sentiments)
    .select('tracks.*, MAX(sentiments.value) as s_value')
    .group('tracks.id')
    .where('sentiments.name = ?', top_feel)
    .order('s_value desc')
  end

  private

  def lyric_sanitizer(song_lyrics)
    song_lyrics.gsub("\n\n******* This Lyrics is NOT for Commercial use *******\n", "")
  end
end
