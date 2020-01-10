module AggregationModule
  def tones_hash(sentiments_data)
    return {} if sentiments_data.nil?
    tones_hash = {}
    sentiments_data.each do |sentences|
      sentences[:tones].each do |tone|
        if tones_hash[tone[:tone_id].to_sym]
          tones_hash[tone[:tone_id].to_sym] += tone[:score]
        else
          tones_hash[tone[:tone_id].to_sym] = tone[:score]
        end
      end
    end

    tones_hash
  end
end
