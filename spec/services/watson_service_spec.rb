require 'spec_helper'
require 'pry'

describe WatsonService do
  xit 'makes a service and returns sentiment for body of text', :vcr do
    WebMock.enable_net_connect!
VCR.eject_cassette
VCR.turn_off!(ignore_cassettes: true)
    text = "The club isn't the best place to find a lover\nSo the bar is where I go"
    service = WatsonService.new(text)
    service_2 = WatsonService.new('Initial commit')

    expect(service).to be_a WatsonService
    expect(service.sentiments).to be_a Hash
    expect(service.sentiments).to have_key :document_tone
    expect(service.sentiments).to have_key :sentences_tone

    expect(service_2.sentiments).to have_key :document_tone
    expect(service_2.sentiments[:document_tone]).to have_key :tones
    expect(service_2.sentiments).to_not have_key :sentences_tone
  end
end
