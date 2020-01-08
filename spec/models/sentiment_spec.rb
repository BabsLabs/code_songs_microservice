require 'spec_helper'

describe Sentiment, type: :model do
  describe "relationships" do
    it { should belong_to :track }
  end

end
