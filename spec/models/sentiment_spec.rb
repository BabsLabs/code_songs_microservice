require 'spec_helper'

describe Sentiment, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should belong_to :track }
  end
end
