require 'spec_helper'

describe Track, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :mm_track_id }
    it { should validate_presence_of :mm_artist_id }
    it { should validate_presence_of :artist_name }
  end

  describe "relationships" do
    it { should have_many :sentiments }
  end

  describe "methods" do
    before(:all) do
      @umbrella = Track.create(title: 'Umbrella', mm_track_id: '32130011', mm_artist_id: '33491890', artist_name: 'Rhianna')
    end
    it 'finds lyrics', :vcr do
      umbrella_lyrics = @umbrella.lyrics
      expected_lyrics = "Uh-huh, uh-huh (Yeah, Rihanna)\nUh-huh, uh-huh (Good girl, gone bad)\nUh-huh, uh-huh (Take three, action)\nUh-huh, uh-huh (Hov)\n\nNo clouds in my stones\nLet it rain, I hydroplane in the bank\nComin' down like the Dow Jones\nWhen the clouds come, we gone\nWe Roc-A-Fellas\nWe fly higher than weather\nIn G5's or better\n\nYou know me (You know me)\nIn anticipation for precipitation\nStack chips for the rainy day\nJay, Rain Man is back, with Little Miss Sunshine\nRihanna, where you at?\n\nYou have my heart\nAnd we'll never be worlds apart\nMaybe in magazines\nBut you'll still be my star\nBaby, 'cause in the dark\nYou can't see shiny cars\nAnd that's when you need me there\nWith you, I'll always share\nBecause\n\nWhen the sun shine, we shine together\nTold you I'll be here forever\nSaid I'll always be your friend\nTook an oath, I'ma stick it out to the end\nNow that it's raining more than ever\nKnow that we'll still have each other\nYou can stand under my umbrella"

      expect(umbrella_lyrics.include?(expected_lyrics)).to be_truthy
    end

    it 'finds sentiments', :vcr do
      @umbrella.sentiments.destroy_all
      expect(@umbrella.sentiments.count).to eq 0

      umbrella_lyrics = @umbrella.lyrics
      @umbrella.make_sentiments(umbrella_lyrics)

      expect(@umbrella.sentiments.count).to eq 6
    end

    it 'matches track sentiments to repo sentiments', :vcr do
      ej_tracks = TrackFinder.new(136).top_tracks


      repo_sentiments = [ {:tone=>"tentative", :value=>3.7023770000000003},
                                      {:tone=>"analytical", :value=>2.923112},
                                      {:tone=>"sadness", :value=>1.136886},
                                      {:tone=>"confident", :value=>0.825035}]
      sorted = ['actual sorted ej tracks']

      expect(ej_tracks.match_sentiments(repo_sentiments)).to eq sorted

    end
  end
end
