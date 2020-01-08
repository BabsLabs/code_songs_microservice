require 'spec_helper'

describe WatsonService do
  it 'fetches the sentiment of lyrics', :vcr do
    text = "No clouds in my stones\nLet it rain, I hydroplane in the bank (eh, eh, eh)\nComing down with the Dow Jones\nWhen the clouds come, we gone, we Roc-A-Fella (eh, eh, eh, eh)\nWe fly higher than weather, in G5's or better\nYou know me\nIn anticipation for precipitation stack chips for the rainy day (eh, eh, eh)\nJay, Rain Man is back (eh, eh, eh)\nWith little Ms. Sunshine, Rihanna, where you at?\n\nYou have my heart\nAnd we'll never be worlds apart\nMay be in magazines\nBut you'll still be my star\nBaby, 'cause in the dark\nYou can't see shiny cars\nAnd that's when you need me there\nWith you I'll always share\n\nBecause\nWhen the sun shine, we shine together\nTold you I'll be here forever\nSaid I'll always be your friend\nTook an oath, I'mma stick it out to the end\nNow that it's raining more than ever\nKnow that we'll still have each other\nYou can stand under my umbrella\nYou can stand under my umbrella\n\nElla, ella, eh, eh, eh\nUnder my umbrella\nElla, ella, eh, eh, eh"

    w_service = WatsonService.new(text)

    expect(w_service).to be_a WatsonService

    expect(w_service.sentiment).to be_a Hash
    expect(w_service.sentiment).to have_key :document_tone
    expect(w_service.sentiment).to have_key :sentences_tone
  end

end
